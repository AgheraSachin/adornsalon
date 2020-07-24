<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

use App\Models\Services;
use App\Models\Staff;
use App\Models\StaffService;
use App\Models\Locations;
use App\Models\Appointment;
use App\Models\ServiceTypes;
use App\Models\Client;
use App\Models\GroupAppointment;

//adornsalon md5 encryption in client-id ie. d23b94135dd2363a9351561234a1ef32

class ApiController extends Controller
{
    public function responsedata($data, $status = 200) {
        header("HTTP/1.1 " . $status . " " . $this->requestStatus($status));
        
        return json_encode(array("code"=>$status,"data"=>$data));
    }

    public function requestStatus($code) {
        $status = array(
            301 => 'Duplicate',
            200 => 'OK',
            401 => 'Unauthorized',
            403 => 'Forbidden',
            404 => 'Not Found',
            405 => 'Method Not Allowed',
            500 => 'Internal Server Error',
        );
        return ($status[$code])?$status[$code]:$status[500];
    }

    public function cleanHeaders($array) {
        foreach( $array as $key => $value ) {
            if( $value  == "''" || $value  == '' )
                unset( $array[ $key ] );
        }
        if(@$array['Content-Type'] != 'application/json') {
            return $this->responsedata('content-type not allowed', 405);
        } else {
            $required = array(
                'client-id',
            );
            if(!(count(array_intersect($required, array_keys($array))) == count($required))) {
                return $this->responsedata('missing header parameters', 403);
            }
            else
            {
                return $array;
            }
        }
    }


    public function cleanRequest($data) {
        $clean_input = Array();
        if (is_array($data)) {
            foreach ($data as $k => $v) {
                $clean_input[$k] = $this->cleanRequest((array)$v);
            }
        } else {
            $clean_input = trim(strip_tags($data));
        }
        return $clean_input;
    }

    public function validateRequest($required,$array) {
        //print_r($array);
        if(empty($required)) {
            return $this->responsedata('system error', 500);
        }
        if(!isset($array['header']) || !isset($array['payload'])) {
            return $this->responsedata('missing mandatory parameters', 403);
        }
        //print_r($required);exit;
        /*if(!(count(array_intersect(array_keys($required), array_keys($array['header']))) == count($required))) {
            echo response('missing payload parameters', 403);exit;
        }*/
    }

    public function objectToArray($obj) {
        if(is_object($obj)) $obj = (array) $obj;
        if(is_array($obj)) {
            $new = array();
            foreach($obj as $key => $val) {
                $new[$key] = $this->objectToArray($val);
            }
        }
        else $new = $obj;
        return $new;
    }

    public function random_password() 
    {
      $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%&*_';
      $password = array(); 
      $alpha_length = strlen($alphabet) - 1; 
      for ($i = 0; $i < 8; $i++) 
      {
          $n = rand(0, $alpha_length);
          $password[] = $alphabet[$n];
      }
      return implode($password); 
    }

    public function index(Request $request)
    {
        $method = $_SERVER['REQUEST_METHOD'];

        if ($method != 'POST') {
                return $this->responsedata('Invalid Method', 405);
        }
        $headers = $this->cleanHeaders(getallheaders());
        
        //$clientid = $headers['client-id'];

        $modalname = $request->apiname;
        $apitype = $request->apitype;

        if ($modalname == 'staff' && $apitype == 'get') 
        {
            $staff = Staff::where("tbl_staff_location_id","=",$request->location)->where('tbl_staff_status','1')->get();
            $location = Locations::where('tbl_locations_id',$request->location)->first();
            
            $new_array = array('staff' => $staff,'location' => $location);
            if($new_array!='[]')
            {
                return $this->responsedata($new_array, 200);
            }
            else
            {
                return $this->responsedata('Data not found...', 403);
            }
        }

        if ($modalname == 'services' && $apitype == 'get') 
        {
            $services = Services::where("tbl_services_location_id","=",$request->location)->get();
            if($services!='[]')
            {
                return $this->responsedata($services, 200);
            }
            else
            {
                return $this->responsedata('Data not found...', 403);
            }
        }

        if ($modalname == 'locations' && $apitype == 'get') 
        {
            $locations = Locations::get();
            if($locations!='[]')
            {
                return $this->responsedata($locations, 200);
            }
            else
            {
                return $this->responsedata('Data not found...', 403);
            }
        }

        if ($modalname == 'servicetype' && $apitype == 'get') 
        {
            $servicetype = ServiceTypes::where('tbl_service_types_location_id',$request->location)->where('tbl_service_types_status',1)->get();
            if($servicetype!='[]')
            {
                return $this->responsedata($servicetype, 200);
            }
            else
            {
                return $this->responsedata('Data not found...', 403);
            }   
        }

        if ($modalname == 'staffservicetype' && $apitype == 'get') 
        {
            $staffservicetype = StaffService::Leftjoin('tbl_service_types','tbl_service_types.tbl_service_types_id','=','tbl_staff_services.tbl_staff_services_service_id')->where('tbl_staff_services_staff_id',$request->staff)->get();
            //$staffservicetype = StaffService::Leftjoin('tbl_services','tbl_services.tbl_services_id','=','tbl_staff_services.tbl_staff_services_service_id')->Leftjoin('tbl_service_types','tbl_service_types.tbl_service_types_id','=','tbl_services_type')->where('tbl_staff_services_staff_id',$request->staff)->get();
            if($staffservicetype!='[]')
            {
                return $this->responsedata($staffservicetype, 200);
            }
            else
            {
                return $this->responsedata('Data not found...', 403);
            }   
        }

        if ($modalname == 'stafftype' && $apitype == 'get') 
        {
          $gender = $request->gender;
          $servicetype = ServiceTypes::join('tbl_services','tbl_services.tbl_services_type','tbl_service_types.tbl_service_types_id')->where('tbl_service_types_id',$request->service_type)->where('tbl_services_enable_online',0)->where(function ($query) use ($gender) {
                $query->where('tbl_services_for',$gender)
                      ->orWhere('tbl_services_for','O');
            })
            ->get();
            
            if($servicetype!='[]')
            {
                return $this->responsedata($servicetype, 200);
            }
            else
            {
                return $this->responsedata('Data not found...', 403);
            }   
        }

        if ($modalname == 'saffservices' && $apitype == 'get') 
        {
          $group_services = array();
          if ($request->group_app == '1') 
          {
            /*print_r(count($request->group_data));
            print_r($request->all());exit;*/
            for ($i=0; $i < count($request->group_data); $i++) { 
                //print_r($request->group_data['services'.$i]);
                $ser = $request->group_data[$i];
                foreach ($ser as $key => $value) {
                    $group_services[$i][$key] = DB::table('tbl_services')->where('tbl_services_id',$value)->select('tbl_services_id','tbl_services_name','tbl_services_retail_price')->first(); 
                }
            }
          }

          $services = array();
          $duration_time = 0.0;
          for ($i=0; $i < count($request->services); $i++) 
          { 
              $servicess = Services::where('tbl_services_id',$request->services[$i])->first();

              if (!empty($servicess)) 
              {
                $duration_time = $duration_time + $servicess->tbl_services_duration_time;  

                $services[$i] = $servicess; 
              }
              else
              {
                $duration_time = '60';
              }
              /*$duration_time = $duration_time + $servicess->tbl_services_duration_time;  
              $services[$i] = $servicess;*/
          }

          //print_r($request->all());/*
         // print_r($request->date);*/
          $var = $request->date;
          $date = str_replace('/', '-', $var);
          $app_date = date('Y-m-d', strtotime($date));
          //exit();
          $appointment = DB::table('tbl_appointment')->where('tbl_appointment_staff_id',$request->staff)->where('tbl_appointment_date',$app_date)->get();
         // print_r($appointment);
          $locations = DB::table('tbl_locations')->where('tbl_locations_id',$request->location)->first();

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
                   
                  $freetimee[] = $value[0]." To ".$value[1];
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
              $freetimee[] = substr($freetime , 0, -2);
          }

         $nes = $newstarttimefrome[0];
         $nee = $newendtime[0];
         $us=strtotime($nes);
         $ue=strtotime($nee);
         
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
          $dataarray[0] = $freetimee;
          $dataarray[1] = $duration_time;
          /*$dataarray[2] = $newendtime[0];
          $dataarray[3] = $duration_time;
          //$dataarray[3] = $sameempyoyee;*/

          $new_array = array($services,$dataarray,$group_services);

          $check_app = DB::table('tbl_appointment')->Leftjoin('tbl_clients','tbl_clients.tbl_clients_id','tbl_appointment.tbl_appointment_client_id')->where('tbl_clients_email',$request->email)->whereDate('tbl_appointment_date',$app_date)->first();

          if(!empty($check_app))
          {
             return $this->responsedata('Appointment already Booked today', 403);
          }
          else if($new_array!='[]')
          {
              return $this->responsedata($new_array, 200);
          }
          else
          {
              return $this->responsedata('Data not found...', 403);
          }
        }

        if ($modalname == 'servicebyid' && $apitype == 'get') 
        {
            $imp_service = '';
            $duration = 0.0;

            for ($i=0; $i < count($request->service); $i++) { 
                $services = Services::where('tbl_services_id','=',$request->service[$i])->get();
                /*print_r($services);*/
                $duration = (float)$duration + (float)$services[0]->tbl_services_duration_time;
            }

            $starttime = $request->start_time;
            //$start_strtotime = strtotime($request->get('starttime'));

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
            
            
            $endtime =  date('H:i',strtotime($hr.$min,strtotime($starttime)));
            $end_strtotime = strtotime($endtime);

            /*$appointment = DB::table('appointment')->where('tbl_appointment_staff_id',$request->get('staff_id'))->where('tbl_appointment_date',$request->get('date'))->where(function ($query) use ($start_strtotime,$end_strtotime){
                    $query->whereBetween('tbl_appointment_start_strtotime',[$start_strtotime,$end_strtotime])->orWhereBetween('tbl_appointment_end_strtotime',[$start_strtotime,$end_strtotime]);})->count();*/

            if ($request->app_id == '') 
            {
                $appointment = DB::table('tbl_appointment')->where('tbl_appointment_staff_id',$request->staff)->where('tbl_appointment_date',$request->date)->where(function ($query) use ($starttime,$endtime){
                    $query->whereBetween('tbl_appointment_start_time',[$starttime,$endtime])->orWhereBetween('tbl_appointment_end_time',[$starttime,$endtime]);})->count();    
            }
            else
            {
                $appointment = DB::table('tbl_appointment')->where('tbl_appointment_id','!=',$request->app_id)->where('tbl_appointment_staff_id',$request->staff_id)->where('tbl_appointment_date',$request->date)->where(function ($query) use ($starttime,$endtime){
                    $query->whereBetween('tbl_appointment_start_time',[$starttime,$endtime])->orWhereBetween('tbl_appointment_end_time',[$starttime,$endtime]);})->count();
            }
            

            //print_r($request->get('date'));exit;
            $new_array = array('count_app' => $appointment,'endtime' => $endtime);
            if($new_array!='[]')
            {
                return $this->responsedata($new_array, 200);
            }
            else
            {
                return $this->responsedata('Data not found...', 403);
            }
        }


        if ($modalname == 'appointment' && $apitype == 'store') 
        {
            $check_client = DB::table('tbl_clients')->where('tbl_clients_email',$request->data['cemail'])->first();

            if (!empty($check_client)) 
            {
                $client_id = $check_client->tbl_clients_id;
            }
            else
            {
                $randomid = mt_rand(100000,999999);

                $add_client = new Client([
                    'tbl_clients_unique_id' => $randomid,
                    'tbl_clients_first_name' => $request->data['group_data']['group_name'][0],
                    'tbl_clients_middle_name' => '',
                    'tbl_clients_last_name' => '',
                    'tbl_clients_email' => $request->data['cemail'],
                    'tbl_clients_mobile' => $request->data['mobile'],
                    'tbl_clients_gender' => $request->data['group_data']['group_gender'][0],
                    'tbl_clients_image' => '',
                    'tbl_clients_address' => '',
                    'tbl_clients_password' => '',
                    'tbl_clients_user_name' => '',
                    'tbl_clients_location_id' => $request->location,
                    'tbl_clients_status' => '1',
                    'tbl_clients_insertdate' => now(),
                ]);

                $add_client->save();
                $client_id = DB::getPdo()->lastInsertId();
            }

            $imp_service = '';
            for ($i=0; $i < count($request->data['group_data']['group_services'][0]); $i++) { 
                $imp_service = implode(',',$request->data['group_data']['group_services'][0]);
            }

            $selectedTime = $request->data['start_time'];
            $endTime = strtotime("+".$request->data['duration']." minutes", strtotime($selectedTime));
           // echo date('h:i:s', $endTime);

            $end_time =  date('H:i:s', $endTime); 

           // $app_date = date("Y-m-d",strtotime($request->data['date']));
            //echo ;
            $var = $request->data['date'];
            $date = str_replace('/', '-', $var);
            $app_date = date('Y-m-d', strtotime($date));
            //exit();
            $new_aapointment = new Appointment([
                'tbl_appointment_service_id' => $imp_service,
                'tbl_appointment_client_id' => $client_id,
                'tbl_appointment_user_id' => '0',
                'tbl_appointment_staff_id' => $request->staff ? $request->staff : '0',
                'tbl_appointment_location_id' => $request->location,
                'tbl_appointment_date' => $app_date,
                'tbl_appointment_start_time' => $request->data['start_time'],
                'tbl_appointment_end_time' => $end_time,
                'tbl_appointment_comments' => $request->data['comments'] ? $request->data['comments'] : '',
                'tbl_appointment_total_amount' => $request->data['total_amount'],
                'tbl_appointment_payment_type' => $request->data['payment_type'],
                'tbl_appointment_group' => $request->data['group'],
                'tbl_appointment_insertdate' => now(),
            ]);

            if($new_aapointment->save())  
            {   
              $appointment_id = DB::getPdo()->lastInsertId();
              if ($request->data['group'] == '1') 
              {
                //print_r($request->data['group_data']['group_name']);
                for ($i=0; $i < count($request->data['group_data']['group_name']); $i++) 
                {
                  $group_services = '';
                  for ($ser=0; $ser < count($request->data['group_data']['group_services'][$i]); $ser++) { 
                      $group_services = implode(',',$request->data['group_data']['group_services'][$i]);
                  }
                  if ($i != 0) 
                  {
                      $add_group = new GroupAppointment([
                        'tbl_group_appointment_app_id' => $appointment_id,
                        'tbl_group_appointment_service_id' => $group_services,
                        'tbl_group_appointment_name' => $request->data['group_data']['group_name'][$i],
                        'tbl_group_appointment_gender' => $request->data['group_data']['group_gender'][$i],
                        'tbl_group_appointment_date' => $app_date,
                        'tbl_group_appointment_starttime' => $request->data['start_time'],
                      ]);
                      $add_group->save();
                  }
                }
              }
              $new_array = array('comments' => 'Data is inserted...','inserted_id' => $appointment_id);
              return $this->responsedata($new_array, 200);
            }
            else
            {
              $new_array = array('comments' => 'Data is not inserted...','inserted_id' => '');
              return $this->responsedata($new_array, 403);
            }
        }

        if ($modalname == 'appointment' && $apitype == 'list') 
        {
          $group_data = array();
          $appointment_list = Appointment::where('tbl_appointment_client_id',$request->client_id)->get();
          foreach ($appointment_list as $key => $value) 
          {
            $group_data[$value->tbl_appointment_id] = DB::table('tbl_group_appointment')->where('tbl_group_appointment_app_id',$value->tbl_appointment_id)->get();
          }
          $responsedata = array('appointment_list' => $appointment_list, 'group_data' =>$group_data);
            if($responsedata!='[]')
            {
                return $this->responsedata($responsedata, 200);
            }
            else
            {
                return $this->responsedata('Data not found...', 403);
            }   
        }

        if ($modalname == 'appointment' && $apitype == 'delete') 
        {
          $appointment_list = Appointment::where('tbl_appointment_id',$request->app_id)->delete();
          $group_app = DB::table('tbl_group_appointment')->where('tbl_group_appointment_app_id',$request->app_id)->delete();
            if($appointment_list!='[]')
            {
                return $this->responsedata('Data is deleted successfully...', 200);
            }
            else
            {
                return $this->responsedata('Data is not deleted successfully...', 403);
            }   
        }

        if ($modalname == 'appointment' && $apitype == 'update') 
        {
          $check_client = DB::table('tbl_clients')->where('tbl_clients_email',$request->data['cemail'])->first();

          if (!empty($check_client)) 
          {
              $client_id = $check_client->tbl_clients_id;
          }
          else
          {
              $randomid = mt_rand(100000,999999);

              $add_client = new Client([
                  'tbl_clients_unique_id' => $randomid,
                  'tbl_clients_first_name' => $request->data['group_data']['group_name'][0],
                  'tbl_clients_middle_name' => '',
                  'tbl_clients_last_name' => '',
                  'tbl_clients_email' => $request->data['cemail'],
                  'tbl_clients_mobile' => $request->data['mobile'],
                  'tbl_clients_gender' => $request->data['group_data']['group_gender'][0],
                  'tbl_clients_image' => '',
                  'tbl_clients_address' => '',
                  'tbl_clients_password' => '',
                  'tbl_clients_user_name' => '',
                  'tbl_clients_location_id' => $request->location,
                  'tbl_clients_status' => '1',
                  'tbl_clients_insertdate' => now(),
              ]);

              $add_client->save();
              $client_id = DB::getPdo()->lastInsertId();
          }

          $imp_service = '';
          for ($i=0; $i < count($request->data['group_data']['group_services'][0]); $i++) { 
              $imp_service = implode(',',$request->data['group_data']['group_services'][0]);
          }

          $selectedTime = $request->data['start_time'];
          $endTime = strtotime("+".$request->data['duration']." minutes", strtotime($selectedTime));
         
          $end_time =  date('H:i:s', $endTime); 
          $var = $request->data['date'];
          $date = str_replace('/', '-', $var);
          $app_date = date('Y-m-d', strtotime($date));

          $appointment = Appointment::find($request->app_id);
      
          $appointment->tbl_appointment_service_id = $imp_service;
          $appointment->tbl_appointment_client_id = $client_id;
          $appointment->tbl_appointment_staff_id = $request->staff ? $request->staff : '0';
          $appointment->tbl_appointment_date = $app_date;
          $appointment->tbl_appointment_start_time = $request->data['start_time'];
          $appointment->tbl_appointment_end_time = $end_time;        
          $appointment->tbl_appointment_comments = $request->comments ? $request->comments : '';
          $appointment->tbl_appointment_total_amount = $request->data['total_amount'];
          $appointment->tbl_appointment_payment_type = $request->data['payment_type'];
          $appointment->tbl_appointment_group = $request->data['group'];
          if($appointment->save())  
            {   
              if ($request->data['group'] == '1') 
              {
                DB::table('tbl_group_appointment')->where('tbl_group_appointment_app_id',$request->app_id)->delete();
                //print_r($request->data['group_data']['group_name']);
                for ($i=0; $i < count($request->data['group_data']['group_name']); $i++) 
                {
                  $group_services = '';
                  for ($ser=0; $ser < count($request->data['group_data']['group_services'][$i]); $ser++) { 
                      $group_services = implode(',',$request->data['group_data']['group_services'][$i]);
                  }
                  if ($i != 0) 
                  {
                      $add_group = new GroupAppointment([
                        'tbl_group_appointment_app_id' => $request->app_id,
                        'tbl_group_appointment_service_id' => $group_services,
                        'tbl_group_appointment_name' => $request->data['group_data']['group_name'][$i],
                        'tbl_group_appointment_gender' => $request->data['group_data']['group_gender'][$i],
                        'tbl_group_appointment_date' => $app_date,
                        'tbl_group_appointment_starttime' => $request->data['start_time'],
                      ]);
                      $add_group->save();
                  }
                }
              }
              $new_array = array('comments' => 'Data is updated...');
              return $this->responsedata($new_array, 200);
            }
            else
            {
              $new_array = array('comments' => 'Data is not updated...');
              return $this->responsedata($new_array, 403);
            }
        }


        if ($modalname == 'client' && $apitype == 'login') 
        {        
            $validuser = DB::table('tbl_clients')->where("tbl_clients_email","=",$request->email)
                            ->get();

            if ($validuser!='[]') 
            {
                //echo "Valid email";
                $pass = $validuser[0]->tbl_clients_password;
                //print_r($pass);exit;
                if (Hash::check($request->password,$pass)) 
                {                    
                    return $this->responsedata($validuser,200);
                }
                else
                {
                    return $this->responsedata('Enter Valid Password...',403);
                }
            }
            else
            {
                return $this->responsedata('Enter Valid Email...',403);
            }
        }

        if ($modalname == 'client' && $apitype == 'register') 
        {
            $check_data = Client::where('tbl_clients_email',$request->data['email'])->first();

            if (!empty($check_data)) 
            {
                return $this->responsedata('Client Data is Duplicate...', 301);
            }
            else
            {
                $randomid = mt_rand(100000,999999);

                $add_client = new Client([
                    'tbl_clients_unique_id' => $randomid,
                    'tbl_clients_first_name' => $request->data['first_name'],
                    'tbl_clients_middle_name' => $request->data['middle_name'] ? $request->data['middle_name'] : '',
                    'tbl_clients_last_name' => $request->data['last_name'] ? $request->data['last_name'] : '',
                    'tbl_clients_email' => $request->data['email'],
                    'tbl_clients_password' => Hash::make($request->data['password']),
                    'tbl_clients_mobile' => $request->data['mobile'],
                    'tbl_clients_gender' => $request->data['gender'],
                    'tbl_clients_image' => '',
                    'tbl_clients_address' => '',
                    'tbl_clients_user_name' => '',
                    'tbl_clients_location_id' => $request->data['location'],
                    'tbl_clients_status' => '1',
                    'tbl_clients_insertdate' => now(),
                ]);

                if($add_client->save())
                {
                    $data1 = array(
                        'uniqid' => $randomid,
                        'userid' => $request->data['email'],
                        'password' => $request->data['password'],
                    );
                    //print_r($data1);exit();
                    $credential = array(
                        'from' => 'noreplyappadorn@gmail.com',
                        'to' => $request->data['email'],
                        'subject' => 'Thank you for registration',
                    );

                    Mail::send('after_signin_mail', $data1, function ($message) use ($credential){

                        $message->from($credential['from']);
                        $message->to($credential['to'])->subject($credential['subject']);
                    });
                    return $this->responsedata('Client Data is inserted...', 200);
                }
                else
                {
                    return $this->responsedata('Client Data is not inserted...', 403);
                }
            }
            
        }

        if ($modalname == 'client' && $apitype == 'forgotpassword') 
        {
            $check_email = DB::table('tbl_clients')->where('tbl_clients_email',$request->email)->first();
            if (!empty($check_email)) 
            {
                $update_password = DB::table('tbl_clients')->where('tbl_clients_email',$request->email)->update(['tbl_clients_password' => Hash::make($this->random_password())]); 

                $data1 = array(
                    'password' => $this->random_password(),
                );
                //print_r($data1);exit();
                $credential = array(
                    'from' => 'noreplyappadorn@gmail.com',
                    'to' => $check_email->tbl_clients_email,
                    'subject' => 'Your New Genrated Password',
                );

                Mail::send('new_password', $data1, function ($message) use ($credential){

                    $message->from($credential['from']);
                    $message->to($credential['to'])->subject($credential['subject']);
                });

                return $this->responsedata('password mail has been sent...',200);
            }
            else
            {
                return $this->responsedata('This email address does not match in our records...',403);
            }
        }

        if ($modalname == 'client' && $apitype == 'resetpassword') 
        {
            $check_email = DB::table('tbl_clients')->where('tbl_clients_email',$request->email)->first();
            if (!empty($check_email)) 
            {
                if (Hash::check($request->new_password,$check_email->tbl_clients_password)) 
                {
                    return $this->responsedata('This is the old password please change...',403);
                }
                else
                {
                    $update_password = DB::table('tbl_clients')->where('tbl_clients_email',$request->email)->update(['tbl_clients_password' => Hash::make($request->new_password)]);
                    return $this->responsedata('Your password has been updated...',200);
                }
            }
            else
            {
                return $this->responsedata('This email address does not match in our records...',403);
            }
        }
    }
}
