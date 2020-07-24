<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Routing\ResponseFactory;
use Illuminate\Support\Facades\Mail;

use Auth;

use App\Models\Calendar;
use App\Models\Appointment;
use App\Models\Client;

use PayPal\Api\Amount;
use PayPal\Api\Details;
use PayPal\Api\Item;
use PayPal\Api\ItemList;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\RedirectUrls;
use PayPal\Api\Transaction;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Rest\ApiContext;

class AppointmentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index($location_id) 
    {
        if(request()->ajax()) 
        {
            $data = DB::table('tbl_appointment')
                ->leftjoin('tbl_clients','tbl_clients.tbl_clients_id','=','tbl_appointment.tbl_appointment_client_id')
                ->Leftjoin('tbl_staff','tbl_staff.tbl_staff_id','=','tbl_appointment.tbl_appointment_staff_id')
                ->where('tbl_appointment_group','0')
                ->where('tbl_appointment.tbl_appointment_location_id',$location_id)
                ->select('tbl_appointment.*','tbl_clients.tbl_clients_first_name','tbl_clients.tbl_clients_last_name','tbl_staff.tbl_staff_first_name','tbl_staff.tbl_staff_last_name','tbl_staff.tbl_staff_appointment_color_code','tbl_appointment.tbl_appointment_service_id','tbl_appointment.tbl_appointment_noofperson','tbl_appointment.tbl_appointment_total_amount','tbl_appointment.tbl_appointment_location_id')
                ->get();
            /*echo "<pre>";
            print_r($data);exit();*/
            //$data = Appointment::get();
            $inner_array = [];
            $exp_service = array();
            foreach ($data as $key => $value) {

                $exp_service = explode(',',$value->tbl_appointment_service_id);
                //print_r($exp_service);
                $count_service = count($exp_service);
                /*echo 'Total Count:-'.$count_service;
                echo "<br>";*/
                $service = array();
                for ($i=0; $i < $count_service; $i++) { 
                    $service[] = DB::table('tbl_services')->where('tbl_services_id',$exp_service[$i])->get();
                }
                $imp_ser_name = '';

                foreach ($service[0] as $key => $serv_name) {
                    //print_r($serv_name->tbl_services_name);
                    $imp_ser_name .= $serv_name->tbl_services_name.',';
                }
                //print_r($imp_ser_name);

                $inner_array[] = array("title" => $value->tbl_clients_first_name." ".$value->tbl_clients_last_name,"start" => $value->tbl_appointment_date." ".$value->tbl_appointment_start_time,"end" => $value->tbl_appointment_date." ".$value->tbl_appointment_end_time,"eid" => $value->tbl_appointment_id,"service" => $imp_ser_name,"comments" => $value->tbl_appointment_comments,"date" => $value->tbl_appointment_date,"start_time" => $value->tbl_appointment_start_time,"end_time" => $value->tbl_appointment_end_time,"service_id" => $value->tbl_appointment_service_id,"service_name" => $imp_ser_name,"staff_id" => $value->tbl_appointment_staff_id,"staff_name" => $value->tbl_staff_first_name." ".$value->tbl_staff_last_name,"client_id" => $value->tbl_appointment_client_id,"client_name" => $value->tbl_clients_first_name." ".$value->tbl_clients_last_name,"color" => $value->tbl_staff_appointment_color_code,"noofperson" => $value->tbl_appointment_noofperson,'total_amount' => $value->tbl_appointment_total_amount,'location_id' => $value->tbl_appointment_location_id); 
            }
            
            $response = response()->json($inner_array);
            //print_r($response);exit;
            return $response;
        }

        $country_codes = DB::table('tbl_country_code')->get();
        $client = DB::table('tbl_clients')->where('tbl_clients_location_id',session()->get('location_id'))->where('tbl_clients_status','1')->get();
        $staff = DB::table('tbl_staff')->where('tbl_staff_location_id',session()->get('location_id'))->where('tbl_staff_status','1')->get();
        return view('appointment/index',compact('client','staff','country_codes'));
    }

    /*private $_api_context;
    public function __construct(){
        $payal_conf = \Config::get('paypal');
        $this->_api_context = new ApiContext(new OAuthTokenCredential(
            $payal_conf['client_id'],
            $payal_conf['secret'],
        ));
        $this->_api_context->setConfig($payal_conf['settings']);
    }*/

    public function add(Request $request)
    {  
        if ($request->client) 
        {
            $client_id = $request->client;
        }
        else
        {
            $randomid = mt_rand(100000,999999);

            $add_client = new Client([
                'tbl_clients_unique_id' => $randomid,
                'tbl_clients_first_name' => $request->get('cname'),
                'tbl_clients_middle_name' => '',
                'tbl_clients_last_name' => '',
                'tbl_clients_email' => $request->get('email'),
                'tbl_clients_country_code' => $request->get('country_code'),
                'tbl_clients_mobile' => $request->get('cphone'),
                'tbl_clients_gender' => $request->get('gender'),
                'tbl_clients_image' => '',
                'tbl_clients_address' => '',
                'tbl_clients_password' => '',
                'tbl_clients_user_name' => '',
                'tbl_clients_marital_status' => '0',
                'tbl_clients_location_id' => session()->get('location_id'),
                'tbl_clients_status' => '1',
                'tbl_clients_insertdate' => now(),
            ]);

            $add_client->save();
            $client_id = DB::getPdo()->lastInsertId();
        }

        $imp_service = '';
        for ($i=0; $i < count($request->get('service')); $i++) { 
            $imp_service = implode(',',$request->get('service'));
        }

        $total_amount = $request->get('total_amount') * $request->get('noofperson');

        $appointment = new Appointment([
            'tbl_appointment_user_id' => Auth::user()->id,
            'tbl_appointment_service_id' => $imp_service,
            'tbl_appointment_client_id' => $client_id,
            'tbl_appointment_staff_id' => $request->get('staff'),
            'tbl_appointment_location_id' => session()->get('location_id'),
            'tbl_appointment_date' => $request->get('date'),
            'tbl_appointment_start_time' => $request->get('start_time'),
            'tbl_appointment_end_time' => $request->get('end_time'),
            'tbl_appointment_comments' => $request->get('comments') ? $request->get('comments') : '',
            'tbl_appointment_noofperson' => $request->get('noofperson'),
            'tbl_appointment_total_amount' => $total_amount,
            'tbl_appointment_payment_type' => 'store',
            'tbl_appointment_insertdate' => now(),
        ]);

        if ($appointment->save()) 
        {
            $app_id = DB::getPdo()->lastInsertId();

            $branch_name = DB::table('tbl_locations')->where('tbl_locations_id',session()->get('location_id'))->first();

            $select_staff = DB::table('tbl_staff')->where('tbl_staff_id',$request->staff)->select('tbl_staff_first_name','tbl_staff_last_name')->first();
            $select_client = DB::table('tbl_clients')->where('tbl_clients_id',$client_id)->select('tbl_clients_first_name','tbl_clients_last_name','tbl_clients_email')->first();
            
            $select_services = [];
            for ($i=0; $i < count($request->service); $i++) { 
                $services = DB::table('tbl_services')->where('tbl_services_id',$request->service[$i])->select('tbl_services_name','tbl_services_retail_price')->first();
                $select_services[] = $services->tbl_services_name.' (£'.$services->tbl_services_retail_price.')';
            }

            $data1 = array(
                'staff_name' => $select_staff->tbl_staff_first_name.' '.$select_staff->tbl_staff_last_name,
                'client_name' => $select_client->tbl_clients_first_name.' '.$select_client->tbl_clients_last_name,
                'app_date' => $request->get('date'),
                'app_start_time' => $request->get('start_time'),
                'app_end_time' => $request->get('end_time'),
                'services' => $select_services,
                'noofperson' => $request->noofperson,
                'appname' => "Appointment on ".date('Y-m-d')." ".$request->start_time,
                'payment_status' => 'store',
                'app_id' => $app_id,
                'comment' => $request->get('comments'),
                'total_amount' => $total_amount,
                'branch_name' => $branch_name->tbl_locations_name,
            );
            
            $credential = array(
                'from' => 'noreplyappadorn@gmail.com',
                'to' => $select_client->tbl_clients_email,
                'subject' => $select_client->tbl_clients_first_name.' '.$select_client->tbl_clients_last_name.' your booking confirmation at Adorn Beauty '.$branch_name->tbl_locations_name.' branch',
            );

            Mail::send('appointment.appointment_details_mail', $data1, function ($message) use ($credential){

                $message->from($credential['from']);
                $message->to($credential['to'])->subject($credential['subject']);
            });

            $credential_admin = array(
                'from' => 'noreplyappadorn@gmail.com',
                'to' => $branch_name->tbl_locations_email,
                'subject' => $select_client->tbl_clients_first_name.' '.$select_client->tbl_clients_last_name.' your booking confirmation at Adorn Beauty '.$branch_name->tbl_locations_name.' branch',
            );

            Mail::send('appointment.appointment_details_admin', $data1, function ($message) use ($credential_admin){

                $message->from($credential_admin['from']);
                $message->to($credential_admin['to'])->subject($credential_admin['subject']);
            });

            $notification = array(
                'message' => 'Appointment Inserted Successfully!!!', 
                'alert-type' => 'success',
            );
        }
        else {
            $notification = array(
                'message' => 'Appointment Not Inserted Successfully!!!', 
                'alert-type' => 'danger',
            );
        }
        
        return Redirect::back()->with($notification);  
    }
     
 
    public function edit(Request $request)
    {   
        if ($request->client) 
        {
            $client_id = $request->client;
        }
        else
        {
            $randomid = mt_rand(100000,999999);

            $add_client = new Client([
                'tbl_clients_unique_id' => $randomid,
                'tbl_clients_first_name' => $request->get('cname'),
                'tbl_clients_middle_name' => '',
                'tbl_clients_last_name' => '',
                'tbl_clients_email' => $request->get('email'),
                'tbl_clients_country_code' => $request->get('country_code'),
                'tbl_clients_mobile' => $request->get('cphone'),
                'tbl_clients_gender' => $request->get('gender'),
                'tbl_clients_image' => '',
                'tbl_clients_permanent_address' => '',
                'tbl_clients_current_address' => '',
                'tbl_clients_password' => '',
                'tbl_clients_user_name' => '',
                'tbl_clients_location_id' => session()->get('location_id'),
                'tbl_clients_status' => '1',
                'tbl_clients_insertdate' => now(),
            ]);

            $add_client->save();
            $client_id = DB::getPdo()->lastInsertId();
        }

        $imp_service = '';
        for ($i=0; $i < count($request->service); $i++) 
        { 
            $imp_service = implode(',',$request->service);
        }

        $total_amount = $request->total_amount * $request->noofperson;

        $appointment = Appointment::find($request->app_id);
        
        $appointment->tbl_appointment_service_id = $imp_service;
        $appointment->tbl_appointment_client_id = $client_id;
        $appointment->tbl_appointment_staff_id = $request->staff;
        $appointment->tbl_appointment_date = $request->date;
        $appointment->tbl_appointment_start_time = $request->start_time;
        $appointment->tbl_appointment_end_time = $request->end_time;        
        $appointment->tbl_appointment_comments = $request->comments ? $request->comments : '';
        $appointment->tbl_appointment_noofperson = $request->noofperson;
        $appointment->tbl_appointment_total_amount = $total_amount;

        if ($appointment->save()) {


            $notification = array(
                'message' => 'Appointment Updated Successfully!!!', 
                'alert-type' => 'success',
            );
        }
        else {
            $notification = array(
                'message' => 'Appointment Not Updated Successfully!!!', 
                'alert-type' => 'danger',
            );
        }
        
        return Redirect::back()->with($notification);  
    } 
 
 
    public function delete(Request $request)
    {
        //print_r($request->all());exit();
        $event = Appointment::where('tbl_appointment_id',$request->app_id)->delete();
        DB::table('tbl_group_appointment')->where('tbl_group_appointment_app_id',$request->app_id)->delete();

        $notification = array(
            'message' => 'Appointment Deleted Successfully!!!', 
            'alert-type' => 'success',
        );
   
        return Redirect::back()->with($notification);  
    } 

    public function date_update(Request $request)
    {
        //print_r($request->all());exit;

        $appointment = Appointment::find($request->id);
        $appointment->tbl_appointment_date = $request->date;

        if ($appointment->save()) 
        {
            $update_group_booking = DB::table('tbl_group_appointment')->where('tbl_group_appointment_app_id',$request->id)->update(['tbl_group_appointment_date'=>$request->date]);
            
            $notification = array(
                'message' => 'Appointment Updated Successfully!!!', 
                'alert-type' => 'success',
            );
        }
        else {
            $notification = array(
                'message' => 'Appointment Not Updated Successfully!!!', 
                'alert-type' => 'danger',
            );
        }

        return $notification;

    }   

    public function SelectServices(Request $request) {

        /*$services = DB::table('tbl_staff_services')->Leftjoin('tbl_service_types','tbl_service_types.tbl_service_types_id','tbl_staff_services.tbl_staff_services_service_id')->Leftjoin('tbl_services','tbl_services.tbl_services_type','tbl_service_types.tbl_service_types_id')->where('tbl_staff_services.tbl_staff_services_staff_id',$request->get('staff_id'))->get();*/
        if ($request->get('staff_id') == 0) 
        {
            $services_types = DB::table('tbl_service_types')->where('tbl_service_types_location_id',$request->get('location_id'))->get();
        }
        else
        {
            $services_types = DB::table('tbl_staff_services')->Leftjoin('tbl_service_types','tbl_service_types.tbl_service_types_id','tbl_staff_services.tbl_staff_services_service_id')->where('tbl_staff_services.tbl_staff_services_staff_id',$request->get('staff_id'))->get();
        }

        $services = array();
        
        foreach ($services_types as $key => $value) 
        {
            
            $services[$value->tbl_service_types_types] = DB::table('tbl_services')->where('tbl_services_type',$value->tbl_service_types_id)->get();
            
        }
        
        /*echo "<pre>";
        print_r($services);exit;*/

        $appointment = DB::table('tbl_appointment')->where('tbl_appointment_staff_id',$request->get('staff_id'))->where('tbl_appointment_date',$request->get('date'))->get();

        $locations = DB::table('tbl_locations')->where('tbl_locations_id',session()->get('location_id'))->first();

        //print_r($request->get('date'));exit;
        
        $occupied_slotss=array();
        $starttimee=array();
        $endtimee=array();
        $startend=array();

        if (!empty($appointment)) {
            foreach ($appointment as $key => $value) {
                /*print_r($value->tbl_appointment_start_time);exit();*/
                $starttimeee = $value->tbl_appointment_start_time;
                $starttime = date("H:i",strtotime($starttimeee));
                $endtimeee = $value->tbl_appointment_end_time;
                $endtime = date("H:i",strtotime($endtimeee));
                /*print_r($starttime);
                print_r($endtime);exit();*/
                //echo $starttime.'--'.$endtime.'//';
                $startend[] = [$starttime,$endtime];
            }
        }
        else {
            $startend[]   = [[$locations->tbl_locations_start_time,$locations->tbl_locations_end_time]];
        }
        

        $opening_hours   = [[$locations->tbl_locations_start_time,$locations->tbl_locations_end_time]];
        $occupied_slots  = $startend;
        //$expected_result = [['08:00','09:30'], ['11:00','12:00'], ['14:00','15:10'], ['16:35','18:00']];
        $valid_timeslots = [];
         
        //print_r($occupied_slots);
        #find empty timeslots during opening hours given occupied slots
         
         function timeToNum($time) {
            preg_match('/(\d\d):(\d\d)/', $time, $matches);
            return 60*$matches[1] + $matches[2];
         }
         
         function numToTime($num) {
            $m  = $num%60;
            $h = intval($num/60) ;
            return ($h>9? $h:"0".$h).":".($m>9? $m:"0".$m);
            
         }
         
         // substraction interval $b from interval $a
         function sub($a,$b) 
         {
             // case A: $b inside $a
             if($a[0]<=$b[0] and $a[1]>=$b[1]) return [ [$a[0],$b[0]], [$b[1],$a[1]] ];
             
             // case B: $b is outside $a
             if($b[1]<=$a[0] or $b[0]>=$a[1]) return [ [$a[0],$a[1]] ];
             
             // case C: $a inside $b
             if($b[0]<=$a[0] and $b[1]>=$a[1]) return [[0,0]]; // "empty interval"
             
             // case D: left end of $b is outside $a
             if($b[0]<=$a[0] and $b[1]<=$a[1]) return [[$b[1],$a[1]]];
             
             // case E: right end of $b is outside $a
             if($b[1]>=$a[1] and $b[0]>=$a[0]) return [[$a[0],$b[0]]];
         }
         
         // flat array and change numbers to time and remove empty (zero length) interwals e.g. [100,100]
         // [[ [167,345] ], [ [433,644], [789,900] ]] to [ ["07:00","07:30"], ["08:00","08:30"], ["09:00","09:30"] ] 
         // (number values are not correct in this example)
         function flatAndClean($interwals) {
             $result = [];
             foreach($interwals as $inter) {
                 foreach($inter as $i) {
                     if($i[0]!=$i[1]) {
                         //$result[] = $i;
                         $result[] = [numToTime($i[0]), numToTime($i[1])];
                     }
                 }
             }
             return $result;
         }
         
         // calculate new_opening_hours = old_opening_hours - occupied_slot
        function cutOpeningHours($op_h, $occ_slot) {
            foreach($op_h as $oh) {
                $ohn = [timeToNum($oh[0]), timeToNum($oh[1])];
                $osn = [timeToNum($occ_slot[0]), timeToNum($occ_slot[1])];
                $subsn[] = sub($ohn, $osn);
            }
            return $subsn;
        }
         
         
         $oph = $opening_hours;
         foreach($occupied_slots as $os) {
             $oph = flatAndClean(cutOpeningHours($oph, $os ));
         }
         
        $valid_timeslots = $oph;
        //print_r($valid_timeslots);exit;
        $t=0;
        foreach ($valid_timeslots as $value)
        {
            # code...
            /*echo '<pre>';
            print_r($value[0]);exit();*/
            //$value[0];
            $ti = strtotime($value[0]);
            $now=date("H:i");
            $tim = strtotime($now);
            //echo $ti.'=-='.$tim;
            if($ti>$tim)
            {
                //echo 'if';
                /*if($value[0]=="00:00")
                {
                    continue;
                    
                }*/
                $newstarttime[]=date("H:i",$ti);
                $newstarttimefrome[]=date("H:i",$ti);
                $timestamp = strtotime(date("H:i",$ti)) + 60*60;
                $newendtime[] = date('H:i', $timestamp);
                //print_r($newendtime);
                break;
            }
            else
            {   
                /*echo 'else';
                print_r('value'.$value[0]);*/
                /*if($value[0]=="00:00")
                {
                    continue;
                    
                }*/
                $newstarttime[]=date("H:i",$tim);
                $newstarttimefrome[]=date("H:i",$tim);
                $timestamp = strtotime(date("H:i",$tim)) + 60*60;
                $newendtime[] = date('H:i', $timestamp);
                
            }
            //break;
            $t++;
         }/*exit();*/
        //print_r($newstarttimefrome[0]);exit;
         $optnss = $valid_timeslots;
         $optns = '';
         $freetime = '';
         //opening_hours
         $newfreetime=[];
         if($optnss == $opening_hours)
         {  
            
            foreach ($optnss as $value)
            {
                 
                $freetimee = $value[0]." To ".$value[1];
                //print_r($freetimee);
            }
         }
         else
         {  
             foreach ($optnss as $value)
             {
                $value[0];
                $ts = strtotime($value[0]);
                $te = strtotime($value[1]);
                $now=date("H:i");
                /*$tim = strtotime($now);
                if($ts>=$tim)
                {
                        if($te>=$tim)
                    {*/

                         $freetime .= date("H:i",$ts)." To ".date("H:i",$te)." , ";

                    /*}
                }*/

             }
            $freetimee=substr($freetime , 0, -2);
        }

        //echo $freetimee;exit;
        $optns .= '<div class="card-alert card gradient-45deg-amber-amber"><div class="card-content white-text"><p><i class="material-icons">warning</i>Free Time of Staff is <strong>'.$freetimee.'</strong>.</p></div></div>';
       $nes = $newstarttimefrome[0];
       $nee = $newendtime[0];
       $us=strtotime($nes);
       $ue=strtotime($nee);
       //print_r($newstarttimefrome[0]);
       //print_r($newendtime[0]);

        //$timestamps = strtotime(date("h:i A",$nee)) + 60*60;
        //print_r($nes);exit;
        if($nes == "")
        {
            //echo "start is null";
             $start = strtotime(date("H:i"));
             $expire = date("H:i", strtotime('+1 hour'));
             $end = strtotime($expire);

        }
        else
        {
             $start = strtotime($nes);
             $end = strtotime($nee);
        }
        $dataarray = [];
        $dataarray[0] = $optns;
        $dataarray[1] = $newstarttime[0];
        $dataarray[2] = $newendtime[0];
        //$dataarray[3] = $sameempyoyee;

        $new_array = array($services,$dataarray);

        echo json_encode($new_array);
    }

    public function ServiceByID(Request $request) {

        $imp_service = '';
        $duration = 0.0;
        $total_amount = 0.0;

        for ($i=0; $i < count($request->get('service_id')); $i++) { 
            $services = DB::table('tbl_services')->where('tbl_services_id','=',$request->get('service_id')[$i])->get();
            /*print_r($services);*/
            $duration = (float)$duration + (float)$services[0]->tbl_services_duration_time;
            $total_amount = $total_amount + $services[0]->tbl_services_retail_price;
        }

        //print_r($total_amount);exit;

        $starttime = $request->get('starttime');
        $time = strtotime($starttime);
        $endTime = date("H:i", strtotime('+'.$duration.' minutes', $time));
        //$start_strtotime = strtotime($request->get('starttime'));

        /*if (strstr($duration, '.', true)) {

            $hr_min = explode('.',$duration);

            if ($hr_min[0] != 0) {
                $hr = '+'.$hr_min[0].' hour';
            }

            if ($hr_min[1] != 0) {
                $min = '+'.$hr_min[1].'0 minutes';
            }
        }
        else{
            $hr = '+'.$duration.' hour';
            $min = '';
        }
        
        
        $endtime =  $endTime;*/
        //$end_strtotime = strtotime($endtime);

        /*$appointment = DB::table('appointment')->where('tbl_appointment_staff_id',$request->get('staff_id'))->where('tbl_appointment_date',$request->get('date'))->where(function ($query) use ($start_strtotime,$end_strtotime){
                $query->whereBetween('tbl_appointment_start_strtotime',[$start_strtotime,$end_strtotime])->orWhereBetween('tbl_appointment_end_strtotime',[$start_strtotime,$end_strtotime]);})->count();*/

        if ($request->get('app_id') == '') 
        {
            $appointment = DB::table('tbl_appointment')->where('tbl_appointment_staff_id',$request->get('staff_id'))->where('tbl_appointment_date',$request->get('date'))->where(function ($query) use ($starttime,$endTime){
                $query->whereBetween('tbl_appointment_start_time',[$starttime,$endTime])->orWhereBetween('tbl_appointment_end_time',[$starttime,$endTime]);})->count();    
        }
        else
        {
            $appointment = DB::table('tbl_appointment')->where('tbl_appointment_id','!=',$request->get('app_id'))->where('tbl_appointment_staff_id',$request->get('staff_id'))->where('tbl_appointment_date',$request->get('date'))->where(function ($query) use ($starttime,$endTime){
                $query->whereBetween('tbl_appointment_start_time',[$starttime,$endTime])->orWhereBetween('tbl_appointment_end_time',[$starttime,$endTime]);})->count();
        }
        

        //print_r($request->get('date'));exit;
        $new_array = array('count_app' => $appointment,'endtime' => $endTime,'total_amount' => $total_amount);

        echo json_encode($new_array);
    }

    public function ServiceByTime(Request $request)
    {
        $duration = 0.0;

        for ($i=0; $i < count($request->get('service_id')); $i++) { 
            $services = DB::table('tbl_services')->where('tbl_services_id','=',$request->get('service_id')[$i])->get();
            /*print_r($services);*/
            $duration = $duration + number_format((float)$services[0]->tbl_services_duration_time, 2);
            $dur1 = number_format((float)$duration, 2);
        }

        //print_r($dur1);exit;

        $starttime = $request->get('starttime');
        $time = strtotime($starttime);
        $endtime = date("H:i", strtotime('+'.$duration.' minutes', $time));

        /*$duration = $services[0]->tbl_services_duration_time;
        if (strstr($duration, '.', true)) {

            $hr_min = explode('.',$duration);

            if ($hr_min[0] != 0) {
                $hr = '+'.$hr_min[0].' hour';
            }

            if ($hr_min[1] != 0) {
                $min = '+'.$hr_min[1].'0 minutes';
            }
        }
        else{
            $hr = '+'.$duration.' hour';
            $min = '';
        }
        
        
        $endtime =  date('H:i',strtotime($hr.$min,strtotime($starttime)));*/

        //print_r($endtime);exit();   
        echo json_encode($endtime);
    }

    /*public function appointmentlist()
    {
        $appointments = DB::table('appointment')
                ->leftjoin('client','client.tbl_client_id','=','appointment.tbl_appointment_client_id')
                ->Leftjoin('staff','staff.tbl_staff_id','=','appointment.tbl_appointment_staff_id')
                ->select('appointment.*','client.tbl_client_first_name','client.tbl_client_last_name','staff.tbl_staff_first_name','staff.tbl_staff_last_name','staff.tbl_staff_appointment_color_code','appointment.tbl_appointment_service_id','appointment.tbl_appointment_id')
                ->get();
        
        foreach ($appointments as $key => $value) {
            $exp_service = explode(',',$value->tbl_appointment_service_id);
            //print_r($exp_service);
            $count_service = count($exp_service);
            $service = array();
            for ($i=0; $i < $count_service; $i++) { 
                $service[] = DB::table('service')->where('tbl_services_id',$exp_service[$i])->get();
            }
            //echo "<pre>";
            //print_r($service);
            $imp_ser_name = '';

            foreach ($service as $key => $serv_name) {
                foreach ($serv_name as $key => $name) {
                   $imp_ser_name .= $name->tbl_services_name.',';
                }
                
                
            }
            $ser_name[$value->tbl_appointment_id] = $imp_ser_name;
        //print_r($imp_ser_name);
        }
       

        return view('calendar/app_list',compact('appointments','ser_name'));
    } */

    public function appointmentlist()
    {
        $staffs = DB::table('tbl_staff')->where('tbl_staff_status','1')->where('tbl_staff_location_id',session()->get('location_id'))->get();
        return view('appointment/view',compact('staffs'));
    }

    public function stafflist()
    {
        $staffs = DB::table('tbl_staff')->where('tbl_staff_status','1')->where('tbl_staff_location_id',session()->get('location_id'))->get();
        echo json_encode($staffs);
    }

    public function viewdeatils(Request $request)
    {
        //$staff_id = $request->get('staff_id');
        $selected_date = $request->get('selected_date');
        //$selected_time = $request->get('selected_time');
        $newdata = [];
        
        $newdata = DB::table('tbl_appointment')
                ->leftjoin('tbl_clients','tbl_clients.tbl_clients_id','=','tbl_appointment.tbl_appointment_client_id')
                ->Leftjoin('tbl_staff','tbl_staff.tbl_staff_id','=','tbl_appointment.tbl_appointment_staff_id')
                ->where('tbl_appointment.tbl_appointment_date',$selected_date)
                ->where('tbl_appointment.tbl_appointment_location_id',$request->get('location_id'))
                ->select('tbl_appointment.*','tbl_clients.tbl_clients_first_name','tbl_clients.tbl_clients_last_name','tbl_staff.tbl_staff_first_name','tbl_staff.tbl_staff_last_name','tbl_staff.tbl_staff_appointment_color_code','tbl_appointment.tbl_appointment_service_id','tbl_clients.tbl_clients_id','tbl_clients.tbl_clients_mobile','tbl_staff.tbl_staff_id')
                ->get();

        $services = $group_data = $group_services = array();

        foreach ($newdata as $key => $value) 
        {
            $app_service = explode(',',$value->tbl_appointment_service_id);
            foreach ($app_service as $new_key => $new_val) 
            {
                $services[$value->tbl_appointment_id][] = DB::table('tbl_services')->where('tbl_services_id',$new_val)->select('tbl_services_name')->first();
            }

            $group_data[$value->tbl_appointment_id][] = DB::table('tbl_group_appointment')->where('tbl_group_appointment_app_id',$value->tbl_appointment_id)->get();

            foreach ($group_data[$value->tbl_appointment_id] as $grp_key => $grp_value) 
            {
                //print_r($grp_value);
                if (count($grp_value) != 0) 
                {
                    for ($cn_ser=0; $cn_ser < count($grp_value); $cn_ser++) 
                    { 
                        $grp_services = explode(',',$grp_value[$cn_ser]->tbl_group_appointment_service_id);
                        foreach ($grp_services as $new_grp_key => $new_grp_value) 
                        {
                            $group_services[$grp_value[$cn_ser]->tbl_group_appointment_id][] = DB::table('tbl_services')->where('tbl_services_id',$new_grp_value)->select('tbl_services_name')->first();
                        }
                    }
                }
            }
            
        }
        // print_r($group_data);
        // exit;
        $new_array = array('newdata' => $newdata,'services' => $services,'group_data' => $group_data, 'group_services' => $group_services);

        echo json_encode($new_array);
        
    }
}
