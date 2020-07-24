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

use App\Models\Locations;

use Auth;

class LocationController extends Controller
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
        /*$action = app('request')->route()->getAction();
        $controllerandmethod = class_basename($action['controller']);
        $action = explode('@', $controllerandmethod);
        
        $controller = $action[0];
        $function = $action[1];

        if (app('App\Http\Controllers\PermissionController')->index() == 1) 
        {
            $notification = array(
                'message' => 'You are not allowed to access of '.$controller.' '.$function.' page!', 
                'alert-type' => 'danger',
            );
            return redirect()->route('home')->with($notification);
        }
        else
        {*/
            $locations = DB::table('tbl_locations')->select('tbl_locations_id','tbl_locations_name','tbl_locations_contact_person','tbl_locations_number','tbl_locations_email','tbl_locations_full_address','tbl_locations_status')->get();
            return view('location/index',compact('locations'));
        /*}*/
    	
    }

    public function add()
    {
        $action = app('request')->route()->getAction();
        $controllerandmethod = class_basename($action['controller']);
        $action = explode('@', $controllerandmethod);
        
        $controller = $action[0];
        $function = $action[1];
        
        if (app('App\Http\Controllers\PermissionController')->index() == 1) 
        {
            $notification = array(
                'message' => 'You are not allowed to access of '.$controller.' '.$function.' page!', 
                'alert-type' => 'danger',
            );
            return redirect()->back()->with($notification);
        }
        else
        {
           return view('location/add');
        }
    	//$roles = DB::table('tbl_roles')->select('tbl_roles_id','tbl_roles_types')->get();
    	
    }

    public function create(Request $request)
    {
        //dd($request->all());

    	$add_new = new Locations([
    		'tbl_locations_name' => $request->location_name,
            'tbl_locations_contact_person' => $request->contant_name,
            'tbl_locations_number' => $request->contant_number ? $request->contant_number : '',
            'tbl_locations_email' => $request->email,
            'tbl_locations_full_address' => $request->address,
            'tbl_locations_start_time' => $request->start_time,
            'tbl_locations_end_time' => $request->end_time,
            'tbl_locations_insertdate' => now(),
    	]);

    	if ($add_new->save()) {
    		
    		$notification = array(
                'message' => 'Location is inserted successfuly!', 
                'alert-type' => 'success',
            );
    	}
    	else
    	{
    		$notification = array(
                'message' => 'Some problem where occured while adding location!', 
                'alert-type' => 'danger',
            );
    	}

    	return redirect()->route('Locations')->with($notification);
    }

    public function edit($id)
    {
        $action = app('request')->route()->getAction();
        $controllerandmethod = class_basename($action['controller']);
        $action = explode('@', $controllerandmethod);
        
        $controller = $action[0];
        $function = $action[1];
        
        if (app('App\Http\Controllers\PermissionController')->index() == 1) 
        {
            $notification = array(
                'message' => 'You are not allowed to access of '.$controller.' '.$function.' page!', 
                'alert-type' => 'danger',
            );
            return redirect()->back()->with($notification);
        }
        else
        {   
            $location = DB::table('tbl_locations')->where('tbl_locations_id',$id)->select('tbl_locations_id','tbl_locations_name','tbl_locations_contact_person','tbl_locations_number','tbl_locations_email','tbl_locations_full_address','tbl_locations_start_time','tbl_locations_end_time')->first();

            return view('location/edit',compact('location'));  
        } 
    }

    public function update(Request $request, $id)
    {
        //dd($request->all());

        $update_location = Locations::find($id);

        $update_location->tbl_locations_name = $request->location_name;
        $update_location->tbl_locations_contact_person = $request->contant_name;
        $update_location->tbl_locations_number = $request->contant_number ? $request->contant_number : '';
        $update_location->tbl_locations_email = $request->email;
        $update_location->tbl_locations_full_address = $request->address;
        $update_location->tbl_locations_start_time = $request->start_time;
        $update_location->tbl_locations_end_time = $request->end_time;

        if ($update_location->save()) {
            
            $notification = array(
                'message' => 'Location is updated successfuly!', 
                'alert-type' => 'success',
            );
        }
        else
        {
            $notification = array(
                'message' => 'Some problem where occured while updating location!', 
                'alert-type' => 'danger',
            );
        }

        return redirect()->route('Locations')->with($notification);
    }

    public function delete($id)
    {
        $action = app('request')->route()->getAction();
        $controllerandmethod = class_basename($action['controller']);
        $action = explode('@', $controllerandmethod);
        
        $controller = $action[0];
        $function = $action[1];
        
        if (app('App\Http\Controllers\PermissionController')->index() == 1) 
        {
            $notification = array(
                'message' => 'You are not allowed to access of '.$controller.' '.$function.' page!', 
                'alert-type' => 'danger',
            );
            return redirect()->back()->with($notification);
        }
        else
        {   
            DB::table('tbl_locations')->where('tbl_locations_id',$id)->delete();

            $notification = array(
                'message' => 'Location is Deleted successfuly!', 
                'alert-type' => 'success',
            );

            return redirect()->route('Locations')->with($notification); 
        } 
    }

    public function change(Request $request)
    {
        session()->put('location_id', $request->dataId);
        session()->put('location_name', $request->dataName);
    }

    public function active($id)
    {
        $active_status = Locations::where('tbl_locations_id',$id)->update(['tbl_locations_status'=>'0']);
        $notification = array(
                'message' => 'Location Status Updated Successfully!!!', 
                'alert-type' => 'success',
            );

            return redirect()->route('Locations')->with($notification);
    }

    public function inactive($id)
    {
        $active_status = Locations::where('tbl_locations_id',$id)->update(['tbl_locations_status'=>'1']);
        $notification = array(
                'message' => 'Location Status Updated Successfully!!!', 
                'alert-type' => 'success',
            );

            return redirect()->route('Locations')->with($notification);
    }
}