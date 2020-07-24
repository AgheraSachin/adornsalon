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
use App\Models\GroupAppointment;


class GroupAppointmentController extends Controller
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
                ->where('tbl_appointment_group','1')
                ->where('tbl_appointment.tbl_appointment_location_id',$location_id)
                ->select('tbl_appointment.*','tbl_clients.tbl_clients_first_name','tbl_clients.tbl_clients_last_name','tbl_staff.tbl_staff_first_name','tbl_staff.tbl_staff_last_name','tbl_staff.tbl_staff_appointment_color_code','tbl_appointment.tbl_appointment_service_id','tbl_appointment.tbl_appointment_noofperson','tbl_appointment.tbl_appointment_total_amount','tbl_appointment.tbl_appointment_location_id')
                ->get();
            /*echo "<pre>";
            print_r($data);exit();*/
            //$data = Appointment::get();
            $inner_array = [];
            $exp_service = $group_data = array();
            foreach ($data as $key => $value) 
            {
                $group_data[$value->tbl_appointment_id] = DB::table('tbl_group_appointment')->where('tbl_group_appointment_app_id',$value->tbl_appointment_id)->get();
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

                $inner_array[] = array("title" => $value->tbl_clients_first_name." ".$value->tbl_clients_last_name,"start" => $value->tbl_appointment_date." ".$value->tbl_appointment_start_time,"end" => $value->tbl_appointment_date." ".$value->tbl_appointment_end_time,"eid" => $value->tbl_appointment_id,"service" => $imp_ser_name,"comments" => $value->tbl_appointment_comments,"date" => $value->tbl_appointment_date,"start_time" => $value->tbl_appointment_start_time,"end_time" => $value->tbl_appointment_end_time,"service_id" => $value->tbl_appointment_service_id,"service_name" => $imp_ser_name,"staff_id" => $value->tbl_appointment_staff_id,"staff_name" => $value->tbl_staff_first_name." ".$value->tbl_staff_last_name,"client_id" => $value->tbl_appointment_client_id,"client_name" => $value->tbl_clients_first_name." ".$value->tbl_clients_last_name,"color" => $value->tbl_staff_appointment_color_code,"noofperson" => $value->tbl_appointment_noofperson,'total_amount' => $value->tbl_appointment_total_amount,'location_id' => $value->tbl_appointment_location_id,'group_data' => $group_data); 
            }
            
            $response = response()->json($inner_array);
            //print_r($response);exit;
            return $response;
        }

        $country_codes = DB::table('tbl_country_code')->get();
        $client = DB::table('tbl_clients')->where('tbl_clients_location_id',session()->get('location_id'))->where('tbl_clients_status','1')->get();
        $staff = DB::table('tbl_staff')->where('tbl_staff_location_id',session()->get('location_id'))->where('tbl_staff_status','1')->get();
       	$service_types = DB::table('tbl_service_types')->where('tbl_service_types_location_id',session()->get('location_id'))->where('tbl_service_types_status',1)->get();
        return view('appointment/group_app',compact('client','staff','country_codes','service_types'));
    }

    public function servicetypes_services(Request $request)
    {
        if ($request->gender) 
        {
            $gender = $request->gender;
            $services = DB::table('tbl_services')->where('tbl_services_type',$request->servicetype)->where(function ($query) use ($gender) {
                $query->where('tbl_services_for',$gender)
                      ->orWhere('tbl_services_for','O');
            })
            ->get();
        }
        else
        {
            $services = DB::table('tbl_services')->where('tbl_services_type',$request->servicetype)->get();
        }
    	echo json_encode($services);
    }

    public function service_amount(Request $request)
    {
        $service_amt = array();

        for ($i=0; $i < count($request->service); $i++) 
        { 
            $service_amt[] = DB::table('tbl_services')->where('tbl_services_id',$request->service[$i])->select('tbl_services_retail_price')->get();
        }
        echo json_encode($service_amt);
    }

    public function add(Request $request)
    {
        $cc = count($request->cname);
        if ($cc > 1) 
        {
            $group_app = 1;
        }
        else
        {
            $group_app = 0;
        }
        echo "<pre>";
        print_r($request->all());exit;

        if ($request->client) 
        {
            $client_id = $request->client;
        }
        else
        {
            $randomid = mt_rand(100000,999999);

            $add_client = new Client([
                'tbl_clients_unique_id' => $randomid,
                'tbl_clients_first_name' => $request->get('cname')[0],
                'tbl_clients_middle_name' => '',
                'tbl_clients_last_name' => '',
                'tbl_clients_email' => $request->get('email'),
                'tbl_clients_country_code' => $request->get('country_code'),
                'tbl_clients_mobile' => $request->get('cphone'),
                'tbl_clients_gender' => $request->get('gender')[0],
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

        $total_amount = $request->get('grand_total') + $request->get('sub_tlt');

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
            'tbl_appointment_noofperson' => 1,
            'tbl_appointment_total_amount' => $total_amount,
            'tbl_appointment_payment_type' => 'store',
            'tbl_appointment_group' => $group_app,
            'tbl_appointment_insertdate' => now(),
        ]);
        if ($appointment->save()) 
        {
            $appointment_id = DB::getPdo()->lastInsertId();
            if ($cc > 1) 
            {
                for ($i=0; $i < count($request->get('cname')); $i++) 
                { 
                    $group_services = '';
                    for ($ser=0; $ser < count($request->grp_service[$i]); $ser++) { 
                        $group_services = implode(',',$request->grp_service[$i]);
                    }
                    if ($request->client) 
                    {
                        $add_group = new GroupAppointment([
                            'tbl_group_appointment_app_id' => $appointment_id,
                            'tbl_group_appointment_servicetype_id' => $request->get('service_type')[$i],
                            'tbl_group_appointment_service_id' => $group_services,
                            'tbl_group_appointment_name' => $request->get('cname')[$i],
                            'tbl_group_appointment_gender' => $request->get('gender')[$i],
                            'tbl_group_appointment_date' => $request->get('date'),
                            'tbl_group_appointment_total_amount' => $request->get('grp_sub_total')[$i],
                            'tbl_group_appointment_starttime' => $request->get('start_time'),
                        ]);
                        $add_group->save(); 
                    }
                    else
                    {
                        if ($i != 0) 
                        {
                            $add_group = new GroupAppointment([
                                'tbl_group_appointment_app_id' => $appointment_id,
                                'tbl_group_appointment_servicetype_id' => $request->get('service_type')[$i],
                                'tbl_group_appointment_service_id' => $group_services,
                                'tbl_group_appointment_name' => $request->get('cname')[$i],
                                'tbl_group_appointment_gender' => $request->get('gender')[$i],
                                'tbl_group_appointment_date' => $request->get('date'),
                                'tbl_group_appointment_total_amount' => $request->get('grp_sub_total')[$i],
                                'tbl_group_appointment_starttime' => $request->get('start_time'),
                            ]);
                            $add_group->save();
                        }
                    }                
                }
            }
            /*else
            {
                
            }*/

            $notification = array(
                'message' => 'Group Appointment Inserted Successfully!!!', 
                'alert-type' => 'success',
            );
        }
        else
        {
            $notification = array(
                'message' => 'Group Appointment Not Inserted Successfully!!!', 
                'alert-type' => 'danger',
            );
        }
        return Redirect::back()->with($notification);  
    }

    public function edit(Request $request)
    {
        /*echo "<pre>";
        print_r($request->all());exit;*/

        if ($request->client) 
        {
            $client_id = $request->client;
        }
        else
        {
            $randomid = mt_rand(100000,999999);

            $add_client = new Client([
                'tbl_clients_unique_id' => $randomid,
                'tbl_clients_first_name' => $request->get('cname')[0],
                'tbl_clients_middle_name' => '',
                'tbl_clients_last_name' => '',
                'tbl_clients_email' => $request->get('email'),
                'tbl_clients_country_code' => $request->get('country_code'),
                'tbl_clients_mobile' => $request->get('cphone'),
                'tbl_clients_gender' => $request->get('gender')[0],
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

        $total_amount = $request->get('grand_total') + $request->get('sub_tlt');

        $appointment = Appointment::find($request->app_id);

        $appointment->tbl_appointment_service_id = $imp_service;
        $appointment->tbl_appointment_client_id = $client_id;
        $appointment->tbl_appointment_staff_id = $request->staff;
        $appointment->tbl_appointment_date = $request->date;
        $appointment->tbl_appointment_start_time = $request->start_time;
        $appointment->tbl_appointment_end_time = $request->end_time;        
        $appointment->tbl_appointment_comments = $request->comments ? $request->comments : '';
        $appointment->tbl_appointment_total_amount = $total_amount;
        
        if ($appointment->save()) 
        {
            DB::table('tbl_group_appointment')->where('tbl_group_appointment_app_id',$request->app_id)->delete();
            for ($i=0; $i < count($request->get('cname')); $i++) 
            { 
                $group_services = '';
                for ($ser=0; $ser < count($request->grp_service[$i]); $ser++) { 
                    $group_services = implode(',',$request->grp_service[$i]);
                }
                if ($request->client) 
                {
                    $add_group = new GroupAppointment([
                        'tbl_group_appointment_app_id' => $request->app_id,
                        'tbl_group_appointment_servicetype_id' => $request->get('service_type')[$i],
                        'tbl_group_appointment_service_id' => $group_services,
                        'tbl_group_appointment_name' => $request->get('cname')[$i],
                        'tbl_group_appointment_gender' => $request->get('gender')[$i],
                        'tbl_group_appointment_date' => $request->get('date'),
                        'tbl_group_appointment_total_amount' => $request->get('grp_sub_total')[$i],
                        'tbl_group_appointment_starttime' => $request->get('start_time'),
                    ]);
                    $add_group->save(); 
                }
                else
                {
                    if ($i != 0) 
                    {
                        $add_group = new GroupAppointment([
                            'tbl_group_appointment_app_id' => $request->app_id,
                            'tbl_group_appointment_servicetype_id' => $request->get('service_type')[$i],
                            'tbl_group_appointment_service_id' => $group_services,
                            'tbl_group_appointment_name' => $request->get('cname')[$i],
                            'tbl_group_appointment_gender' => $request->get('gender')[$i],
                            'tbl_group_appointment_date' => $request->get('date'),
                            'tbl_group_appointment_total_amount' => $request->get('grp_sub_total')[$i],
                            'tbl_group_appointment_starttime' => $request->get('start_time'),
                        ]);
                        $add_group->save();
                    }
                }
                
            }
            $notification = array(
                'message' => 'Group Appointment Updated Successfully!!!', 
                'alert-type' => 'success',
            );
        }
        else
        {
            $notification = array(
                'message' => 'Group Appointment Not Updated Successfully!!!', 
                'alert-type' => 'danger',
            );
        }
        return Redirect::back()->with($notification);  
    }
}