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

use App\Models\Roles;

use Auth;

class RoleController extends Controller
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
            return redirect()->route('home')->with($notification);
        }
        else
        {
            $roles = DB::table('tbl_roles')->select('tbl_roles_id','tbl_roles_types')->get();
            return view('roles/index',compact('roles'));
        }
    	
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
           return view('roles/add');
        }
    	//$roles = DB::table('tbl_roles')->select('tbl_roles_id','tbl_roles_types')->get();
    	
    }

    public function create(Request $request)
    {
    	Validator::make($request->all(), [
            'type' => ['required'],
        ])->validate();

    	//dd($request->all());

    	$add_new = new Roles([
    		'tbl_roles_types' => $request->type,
            'tbl_roles_insertdate' => now(),
    	]);

    	if ($add_new->save()) {
    		
    		$notification = array(
                'message' => 'Role is inserted successfuly!', 
                'alert-type' => 'success',
            );
    	}
    	else
    	{
    		$notification = array(
                'message' => 'Some problem where occured while adding role!', 
                'alert-type' => 'danger',
            );
    	}

    	return redirect()->route('Roles')->with($notification);
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
            $role = DB::table('tbl_roles')->where('tbl_roles_id',$id)->select('tbl_roles_id','tbl_roles_types')->first();

            return view('roles/edit',compact('role'));  
        } 
    }

    public function update(Request $request, $id)
    {
        $update_role = Roles::find($id);

        $update_role->tbl_roles_types = $request->type;

        if ($update_role->save()) {
            
            $notification = array(
                'message' => 'Role is updated successfuly!', 
                'alert-type' => 'success',
            );
        }
        else
        {
            $notification = array(
                'message' => 'Some problem where occured while updating role!', 
                'alert-type' => 'danger',
            );
        }

        return redirect()->route('Roles')->with($notification);
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
            DB::table('tbl_roles')->where('tbl_roles_id',$id)->delete();
            DB::table('tbl_role_rights')->where('tbl_role_rights_role_id',$id)->delete();

            $notification = array(
                'message' => 'Role is Deleted successfuly!', 
                'alert-type' => 'success',
            );

            return redirect()->route('Roles')->with($notification); 
        } 
    }
}