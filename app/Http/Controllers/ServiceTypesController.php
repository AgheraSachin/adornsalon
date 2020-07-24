<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Hash;
//use App\Http\Controllers\PermissionController;

use App\Models\ServiceTypes;

use Auth;

class ServiceTypesController extends Controller
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

    public function index()
    {
        if (Auth::user()->id == 1) 
        {
            $service_types = DB::table('tbl_service_types')->select('tbl_service_types_id','tbl_service_types_types','tbl_service_types_status')->get();    
        }
        else 
        {
            $service_types = DB::table('tbl_service_types')->where('tbl_service_types_location_id',session()->get('location_id'))->select('tbl_service_types_id','tbl_service_types_types','tbl_service_types_status')->get();
        }
        return view('service_types/index',compact('service_types'));
    	
    }

    public function add()
    {
        return view('service_types/add');
    }

    public function create(Request $request)
    {
        /*echo "<pre>";
        print_r($request->all());exit;*/

    	$add_new = new ServiceTypes([
    		'tbl_service_types_types' => $request->type,
            'tbl_service_types_description' => $request->description ? $request->description : '',
            'tbl_service_types_location_id' => session()->get('location_id'),
            'tbl_service_types_insertdate' => now(),
    	]);

    	if ($add_new->save()) {
    		
    		$notification = array(
                'message' => 'Service Types is inserted successfuly!', 
                'alert-type' => 'success',
            );
    	}
    	else
    	{
    		$notification = array(
                'message' => 'Some problem where occured while adding service types!', 
                'alert-type' => 'danger',
            );
    	}

    	return redirect()->route('ServiceTypes')->with($notification);
    }

    public function edit($id)
    {
        $service_type = DB::table('tbl_service_types')->where('tbl_service_types_id',$id)->select('tbl_service_types_id','tbl_service_types_types','tbl_service_types_description')->first();

        return view('service_types/edit',compact('service_type'));  
    }

    public function update(Request $request, $id)
    {
        /*echo "<pre>";
        print_r($request->all());exit;*/

        $update_servicetypes = ServiceTypes::find($id);

        $update_servicetypes->tbl_service_types_types = $request->type;
        $update_servicetypes->tbl_service_types_description = $request->description ? $request->description : '';

        if ($update_servicetypes->save()) {
            
            $notification = array(
                'message' => 'Service Types is updated successfuly!', 
                'alert-type' => 'success',
            );
        }
        else
        {
            $notification = array(
                'message' => 'Some problem where occured while updating service types!', 
                'alert-type' => 'danger',
            );
        }

        return redirect()->route('ServiceTypes')->with($notification);
    }

    public function delete($id)
    {
        DB::table('tbl_service_types')->where('tbl_service_types_id',$id)->delete();

        $notification = array(
            'message' => 'Service Types is Deleted successfuly!', 
            'alert-type' => 'success',
        );

        return redirect()->route('ServiceTypes')->with($notification); 
    }

    public function active($id)
    {
        $active_status = ServiceTypes::where('tbl_service_types_id',$id)->update(['tbl_service_types_status'=>'0']);
        $notification = array(
                'message' => 'ServiceTypes Status Updated Successfully!!!', 
                'alert-type' => 'success',
            );

            return redirect()->route('ServiceTypes')->with($notification);
    }

    public function inactive($id)
    {
        $active_status = ServiceTypes::where('tbl_service_types_id',$id)->update(['tbl_service_types_status'=>'1']);
        $notification = array(
                'message' => 'ServiceTypes Status Updated Successfully!!!', 
                'alert-type' => 'success',
            );

            return redirect()->route('ServiceTypes')->with($notification);
    }
}