<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Redirect;

use App\Models\Staff;
use App\Models\StaffService;

use Auth;

class StaffController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        /*if (Auth::user()->id == 1) 
        {
            $staffs = DB::table('tbl_staff')
                ->where('tbl_staff_location_id',session()->get('location_id'))
                ->orderBy('tbl_staff_id', 'desc')
                ->get();
        }
        else
        { */  
            $staffs = DB::table('tbl_staff')
                ->where('tbl_staff_location_id',session()->get('location_id'))
                ->orderBy('tbl_staff_id', 'desc')
                ->get();
        /*}*/
        return view('staff/index',compact('staffs'));
    }

    public function add()
    {
        $services_types = DB::table('tbl_service_types')->where('tbl_service_types_location_id',session()->get('location_id'))->where('tbl_service_types_status',1)->select('tbl_service_types_id','tbl_service_types_types')->get();
        return view('staff/add',compact('services_types'));
    }

    public function create(Request $request)
    {
        Validator::make($request->all(), [
            'email' => ['unique:tbl_staff,tbl_staff_email'],
        ])->validate();

       /* echo "<pre>";
        print_r($request->all());exit;*/

       
        $file = $request->file('image');
                
        if ($request->hasFile("image")) {
            $file = $request->file("image");
            $file->move("public/staff/",$file->getClientOriginalName());
            $image = $file->getClientOriginalName();
        }
        else {
            $image = '';
        }
       
        $randomid = mt_rand(100000,999999);

        $insert_staff = new Staff([
            'tbl_staff_first_name' => $request->get('first_name'),
            'tbl_staff_last_name' => $request->get('last_name'),
            'tbl_staff_user_id' => Auth::user()->id,
            'tbl_staff_location_id' => session()->get('location_id'),
            'tbl_staff_unique_id' => $randomid,
            'tbl_staff_email' => $request->get('email'),
            'tbl_staff_mobile' => $request->get('mobile'),
            'tbl_staff_telephone' => $request->get('telephone') ? $request->get('telephone') : '',
            'tbl_staff_image' => $image,
            'tbl_staff_type' => 1,
            'tbl_staff_emmergency_name' => $request->get('emergency_name') ? $request->get('emergency_name') : '',
            'tbl_staff_emmergency_relation' => $request->get('emergency_relation') ? $request->get('emergency_relation') : '',
            'tbl_staff_emmergency_contact' => $request->get('emergency_contact'),
            'tbl_staff_permission_rights' => 1,
            'tbl_staff_enable_online_bookings' => $request->get('enable_online'),
            'tbl_staff_start_date' => date('Y-m-d',strtotime($request->start_date)),
            'tbl_staff_end_date' => date('Y-m-d',strtotime($request->end_date)),
            'tbl_staff_appointment_color_code' => $request->get('color_code'),
            'tbl_staff_service_commission' => $request->get('service_commission'),
            'tbl_staff_product_commission' => $request->get('product_commission'),
            'tbl_staff_voucher_commission' => $request->get('voucher_commission'),
            'tbl_staff_break_time' => $request->get('break_time'),
            'tbl_staff_salary' => $request->get('salary'),
            'tbl_staff_password' => $request->get('password'),
            'tbl_staff_insertdate' => now(),
        ]);

        //print_r($insert_service);exit;
        if ($insert_staff->save()) {

            $id = DB::getPdo()->lastInsertId();

            $count_service = count($request->services);
    
            for ($i=0; $i < $count_service; $i++) { 

                $insert_staff_service = new StaffService([
                    'tbl_staff_services_user_id' => Auth::user()->id,
                    'tbl_staff_services_location_id' => session()->get('location_id'),
                    'tbl_staff_services_staff_id' => $id,
                    'tbl_staff_services_service_id' => $request->get('services')[$i],
                    'tbl_staff_services_insertdate' => now(),
                ]);

                $insert_staff_service->save();
            }
            
            $notification = array(
                'message' => 'staff is Inserted Successfully!!!', 
                'alert-type' => 'success',
            );
        }
        else {
            $notification = array(
                'message' => 'staff is Not Inserted Successfully!!!', 
                'alert-type' => 'danger',
            );
        }
        
        return redirect()->route('Staff')->with($notification);
    }
    
    public function edit($id) 
    {
        $services_types = DB::table('tbl_service_types')->where('tbl_service_types_location_id',session()->get('location_id'))->where('tbl_service_types_status',1)->select('tbl_service_types_id','tbl_service_types_types')->get();
        
        $edit_staff = DB::table('tbl_staff')->where('tbl_staff_id', $id)->first();
        
        $edit_staffservice = DB::table('tbl_staff_services')->where('tbl_staff_services_staff_id', $id)->get();

        $staffservices_types = array();
        foreach ($edit_staffservice as $key => $value) {
            $staffservices_types[] = $value->tbl_staff_services_service_id; 
        }

        /*echo "<pre>";
        print_r($staffservices_types);exit;*/
        
        return view('staff/edit',compact('edit_staff','services_types','edit_staffservice','staffservices_types'));
    }

    public function update(Request $request,$id) 
    {
        //print_r($request->all());exit;

        $file = $request->file('image');
                
        if ($request->hasFile("image")) {
            
            if ($request->old_image != '') {
                unlink(public_path('staff/'.$request->old_image));
            }
            
            $file = $request->file("image");
            $file->move("public/staff/",$file->getClientOriginalName());
        }

        if (empty($request->file('image'))) {
            
            $image = $request->get('old_image');
        }else{
            
           $image = $file->getClientOriginalName();
        }

        if ($request->password == '') {
            $pass = $request->old_password;
        }
        else
        {
            $pass = $request->password;
        }

        //print_r($request->all());exit;
        $update_staff = Staff::find($id);
        
        $update_staff->tbl_staff_first_name = $request->first_name;
        $update_staff->tbl_staff_last_name = $request->last_name;
        $update_staff->tbl_staff_email = $request->email;
        $update_staff->tbl_staff_mobile = $request->mobile;
        $update_staff->tbl_staff_telephone = $request->telephone ? $request->telephone : '';
        $update_staff->tbl_staff_image = $image ? $image : '';
        $update_staff->tbl_staff_type = 1;
        $update_staff->tbl_staff_emmergency_name = $request->emergency_name ? $request->emergency_name : '';
        $update_staff->tbl_staff_emmergency_relation = $request->emergency_relation ? $request->emergency_relation : '';
        $update_staff->tbl_staff_emmergency_contact = $request->emergency_contact;
        $update_staff->tbl_staff_permission_rights = 1;
        $update_staff->tbl_staff_enable_online_bookings = $request->enable_online;
        $update_staff->tbl_staff_start_date = $request->start_date;
        $update_staff->tbl_staff_end_date = $request->end_date;
        $update_staff->tbl_staff_appointment_color_code = $request->color_code;
        $update_staff->tbl_staff_service_commission = $request->service_commission;
        $update_staff->tbl_staff_product_commission = $request->product_commission;
        $update_staff->tbl_staff_voucher_commission = $request->voucher_commission;
        $update_staff->tbl_staff_break_time = $request->break_time;
        $update_staff->tbl_staff_salary = $request->salary;
        $update_staff->tbl_staff_password = $pass;

        if ($update_staff->save()) {
            $notification = array(
                'message' => 'Staff Updated Successfully!!!', 
                'alert-type' => 'success',
            );
        }
        else {
            $notification = array(
                'message' => 'Staff is Not Updated Successfully!!!', 
                'alert-type' => 'danger',
            );
        }

        StaffService::where('tbl_staff_services_staff_id',$id)->delete();

        $count_service = count($request->services);
    
        for ($i=0; $i < $count_service; $i++) { 

            $insert_staff_service = new StaffService([
                'tbl_staff_services_user_id' => Auth::user()->id,
                'tbl_staff_services_location_id' => session()->get('location_id'),
                'tbl_staff_services_staff_id' => $id,
                'tbl_staff_services_service_id' => $request->get('services')[$i],
                'tbl_staff_services_insertdate' => now(),
            ]);

            $insert_staff_service->save();
        }

        return redirect()->route('Staff')->with($notification);
    }

    public function delete($id) 
    {
        $delete_staff_service = StaffService::where('tbl_staff_services_staff_id',$id)->delete();

        $delete_staff = Staff::where('tbl_staff_id',$id)->delete();

        $notification = array(
            'message' => 'staff Deleted Successfully!!!', 
            'alert-type' => 'success',
        );

        return redirect()->route('Staff')->with($notification);
    }

    public function active($id)
    {
        $active_status = Staff::where('tbl_staff_id',$id)->update(['tbl_staff_status'=>'1']);
        $notification = array(
                'message' => 'Staff Status Updated Successfully!!!', 
                'alert-type' => 'success',
            );

            return redirect()->route('Staff')->with($notification);
    }

    public function inactive($id)
    {
        $active_status = Staff::where('tbl_staff_id',$id)->update(['tbl_staff_status'=>'0']);
        $notification = array(
                'message' => 'Staff Status Updated Successfully!!!', 
                'alert-type' => 'success',
            );

            return redirect()->route('Staff')->with($notification);
    }

}
