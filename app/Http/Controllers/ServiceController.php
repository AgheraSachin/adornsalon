<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Redirect;

use App\Models\Services;

use Auth;

class ServiceController extends Controller
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
        if (Auth::user()->id == 1) 
        {
            $services = DB::table('tbl_services')
                ->orderBy('tbl_services_id', 'desc')
                ->get();
        }
        else 
        {
            $services = DB::table('tbl_services')
                ->where('tbl_services_location_id',session()->get('location_id'))
                ->orderBy('tbl_services_id', 'desc')
                ->get();
        }
        return view('service/index',compact('services'));
    }

    public function add()
    {
        if (Auth::user()->id == 1) 
        {
            $service_types = DB::table('tbl_service_types')->select('tbl_service_types_id','tbl_service_types_types')->get();
        }
        else 
        {
            $service_types = DB::table('tbl_service_types')->where('tbl_service_types_location_id',session()->get('location_id'))->select('tbl_service_types_id','tbl_service_types_types')->get();
        }
        return view('service/add',compact('service_types'));
    }

    public function create(Request $request)
    {
        /*echo "<pre>";
        print_r($request->all());exit;*/

        $file = $request->file('image');
                
        if ($request->hasFile("image")) {
            $file = $request->file("image");
            $file->move("public/services/",$file->getClientOriginalName());
            $image = $file->getClientOriginalName();
        }
        else {
            $image = '';
        }

        //print_r($file->getClientOriginalName());exit;
        $insert_service = new Services([
            'tbl_services_name' => $request->get('name'),
            'tbl_services_user_id' => Auth::user()->id,
            'tbl_services_location_id' => session()->get('location_id'),
            'tbl_services_image' => $image,
            'tbl_services_type' => $request->get('service_type'),
            'tbl_services_duration_time' => $request->get('duration_time'),
            'tbl_services_for' => $request->get('gender'),
            'tbl_services_description' => $request->get('description') ? $request->get('description') : '',
            'tbl_services_enable_online' => $request->get('enable_online'),
            'tbl_services_commission' => $request->get('commission'),
            'tbl_services_status' => $request->get('service_status'),
            'tbl_services_retail_price' => $request->get('retail_price'),
            'tbl_services_special_price' => $request->get('special_price'),
            'tbl_services_tax' => $request->get('tax'),
            'tbl_services_insertdate' => now(),
        ]);

        //print_r($insert_service);exit;
        if ($insert_service->save()) {
            $notification = array(
                'message' => 'Service Data Inserted Successfully!!!', 
                'alert-type' => 'success',
            );
        }
        else {
            $notification = array(
                'message' => 'Service is Not Inserted Successfully!!!', 
                'alert-type' => 'danger',
            );
        }
        
        return redirect()->route('Service')->with($notification);
    }
    
    public function edit($id) 
    {
        if (Auth::user()->id == 1) 
        {
            $service_types = DB::table('tbl_service_types')->select('tbl_service_types_id','tbl_service_types_types')->get();
        }
        else 
        {
            $service_types = DB::table('tbl_service_types')->where('tbl_service_types_location_id',session()->get('location_id'))->select('tbl_service_types_id','tbl_service_types_types')->get();
        }
        $edit_service = DB::table('tbl_services')->where('tbl_services_id', $id)->first();
        //print_r($edit_student);exit;
        return view('service/edit',compact('edit_service','service_types'));
    }

    public function update(Request $request,$id) 
    {   
        /*echo "<pre>"; 
        print_r($request->all());exit;*/

        $file = $request->file('image');
                
        if ($request->hasFile("image")) {
            
            unlink(public_path('services/'.$request->old_image));
            $file = $request->file("image");
            $file->move("public/services/",$file->getClientOriginalName());
        }

        if (empty($request->file('image'))) {
            
            $image = $request->get('old_image');
        }else{
            
           $image = $file->getClientOriginalName();
        }

        $update_service = Services::find($id);
        
        $update_service->tbl_services_name = $request->name;
        $update_service->tbl_services_image = $image ? $image : '';
        $update_service->tbl_services_type = $request->service_type;
        $update_service->tbl_services_duration_time = $request->duration_time;
        $update_service->tbl_services_for = $request->gender;
        $update_service->tbl_services_description = $request->description ? $request->description : '';
        $update_service->tbl_services_enable_online = $request->enable_online;
        $update_service->tbl_services_commission = $request->commission;
        $update_service->tbl_services_status = $request->service_status;
        $update_service->tbl_services_retail_price = $request->retail_price;
        $update_service->tbl_services_special_price = $request->special_price;
        $update_service->tbl_services_tax = $request->tax;

        if ($update_service->save()) {
            $notification = array(
                'message' => 'Service Updated Successfully!!!', 
                'alert-type' => 'success',
            );
        }
        else {
            $notification = array(
                'message' => 'Service is Not Updated Successfully!!!', 
                'alert-type' => 'danger',
            );
        }
        
        return redirect()->route('Service')->with($notification);
    }

    public function delete($id) 
    {
        $delete_service = Services::where('tbl_services_id',$id)->delete();
        $notification = array(
            'message' => 'Service Deleted Successfully!!!', 
            'alert-type' => 'success',
        );

        return redirect()->route('Service')->with($notification);
    }

}
