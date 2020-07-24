<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Redirect;

use App\Models\ServicePackage;

use Auth;

class ServicePackageController extends Controller
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
            $service_packages = DB::table('tbl_service_package')
                ->orderBy('tbl_service_package_id', 'desc')
                ->get();
        }
        else
        {
            $service_packages = DB::table('tbl_service_package')
                ->where('tbl_service_package_location_id',session()->get('location_id'))
                ->orderBy('tbl_service_package_id', 'desc')
                ->get();
        }
        return view('servicepackage/index',compact('service_packages'));
    }

    public function add()
    {
        $services = DB::table('tbl_services')->where('tbl_services_location_id',session()->get('location_id'))->get();
        return view('servicepackage/add',compact('services'));
    }

    public function create(Request $request)
    {
        /*echo "<pre>";
        print_r($request->all());exit;*/

        $file = $request->file('image');
                
        if ($request->hasFile("image")) {
            $file = $request->file("image");
            $file->move("public/services_packages/",$file->getClientOriginalName());
            $image = $file->getClientOriginalName();
        }
        else {
            $image = '';
        }

        $services = '';
        for ($i=0; $i < count($request->service_id); $i++) { 
            $services = implode(',',$request->service_id);
        }

        //print_r($services);exit;

        $randomid = mt_rand(10000,99999);

        $unique_id = $request->name.''.$randomid;

        $insert_service_package = new ServicePackage([
            'tbl_service_package_name' => $request->get('name'),
            'tbl_service_package_user_id' => Auth::user()->id,
            'tbl_service_package_location_id' => session()->get('location_id'),
            'tbl_service_package_unique_id' => $unique_id,
            'tbl_service_package_service_id' => $services,
            'tbl_service_package_price' => $request->get('price'),
            'tbl_service_package_special_price' => $request->get('special_price'),
            'tbl_service_package_description' => $request->get('description') ? $request->get('description') : '',
            'tbl_service_package_special_note' => $request->get('note') ? $request->get('note') : '',
            'tbl_service_package_months' => $request->get('month'),
            'tbl_service_package_image' => $image,
            'tbl_service_package_status' => $request->get('service_package_status'),
            'tbl_service_package_insertdate' => now(),
        ]);

        //print_r($insert_service);exit;
        if ($insert_service_package->save()) {
            $notification = array(
                'message' => 'Service Package is Inserted Successfully!!!', 
                'alert-type' => 'success',
            );
        }
        else {
            $notification = array(
                'message' => 'Service Package is Not Inserted Successfully!!!', 
                'alert-type' => 'danger',
            );
        }
        
        return redirect()->route('ServicePackage')->with($notification);
    }
    
    public function edit($id) 
    {
        $edit_service_package = DB::table('tbl_service_package')->where('tbl_service_package_id', $id)->first();
            $services = DB::table('tbl_services')->where('tbl_services_location_id',session()->get('location_id'))->get();
        return view('servicepackage/edit',compact('edit_service_package','services'));
    }

    public function update(Request $request,$id) 
    {
       //print_r($request->all());exit;

        $file = $request->file('image');
                
        if ($request->hasFile("image")) {
            
            if ($request->old_image != '') {
                unlink(public_path('services_packages/'.$request->old_image));
            }
            
            $file = $request->file("image");
            $file->move("public/services_packages/",$file->getClientOriginalName());
        }

        if (empty($request->file('image'))) {
            
            $image = $request->get('old_image');
        }else{
            
           $image = $file->getClientOriginalName();
        }

        $services = '';
        for ($i=0; $i < count($request->service_id); $i++) { 
            $services = implode(',',$request->service_id);
        }

        //print_r($request->all());exit;
        $update_service_package = ServicePackage::find($id);
        
        $update_service_package->tbl_service_package_name = $request->name;
        $update_service_package->tbl_service_package_service_id = $services;
        $update_service_package->tbl_service_package_price = $request->price;
        $update_service_package->tbl_service_package_special_price = $request->special_price;
        $update_service_package->tbl_service_package_description = $request->description ? $request->description : '';
        $update_service_package->tbl_service_package_special_note = $request->note ? $request->note : '';
        $update_service_package->tbl_service_package_months = $request->month;
        $update_service_package->tbl_service_package_image = $image ? $image : '';
        $update_service_package->tbl_service_package_status = $request->service_package_status;

        if ($update_service_package->save()) {
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
        
        return redirect()->route('ServicePackage')->with($notification);
    }

    public function delete($id) 
    {
        $delete_service_package = ServicePackage::where('tbl_service_package_id',$id)->delete();

        $notification = array(
            'message' => 'Service Package Deleted Successfully!!!', 
            'alert-type' => 'success',
        );

        return redirect()->route('ServicePackage')->with($notification);
    }

}
