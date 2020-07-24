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

use App\User;
use App\Models\Admins;

use Auth;

class AdminController extends Controller
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
        $admins = DB::table('tbl_admin')->Leftjoin('tbl_roles','tbl_roles.tbl_roles_id','=','tbl_admin.role_id')->where('id','!=','1')->whereRaw("find_in_set('".session()->get('location_id')."',location_id)")->select('id','name','email','tbl_roles_types')->get();
        return view('admin/index',compact('admins'));
    }

    public function add()
    {
        $locations = DB::table('tbl_locations')->select('tbl_locations_id','tbl_locations_name')->get();
        $roles = DB::table('tbl_roles')->select('tbl_roles_id','tbl_roles_types')->get();
        return view('admin/add',compact('roles','locations'));
    }

    public function create(Request $request)
    {
    	Validator::make($request->all(), [
            'email' => ['unique:tbl_admin,email'],
        ])->validate();

        /*echo "<pre>";
    	print_r($request->all());exit;*/

        for ($i=0; $i < count($request->location); $i++) { 
            $locations = implode(',', $request->location);
        }

        //print_r($locations);exit;

    	$add_new = new Admins([
    		'name' => $request->name,
    		'email' => $request->email,
    		'password' => Hash::make($request->password),
            'role_id' => $request->role_type,
            'location_id' => $locations,
    	]);

    	if ($add_new->save()) {
    		
    		$notification = array(
                'message' => 'Admin is inserted successfuly!', 
                'alert-type' => 'success',
            );
    	}
    	else
    	{
    		$notification = array(
                'message' => 'Some problem where occured while adding admin!', 
                'alert-type' => 'danger',
            );
    	}

    	return redirect()->route('admins')->with($notification);
    }

    public function edit($id)
    {
        $locations = DB::table('tbl_locations')->select('tbl_locations_id','tbl_locations_name')->get();
            $admin = DB::table('tbl_admin')->where('id',$id)->select('id','name','email','password','role_id','location_id')->first();
        $roles = DB::table('tbl_roles')->select('tbl_roles_id','tbl_roles_types')->get();

        return view('admin/edit',compact('admin','roles','locations'));   
    }

    public function update(Request $request, $id)
    {
        if ($request->password != '') 
        {
            $password = Hash::make($request->password);
        }
        else
        {
            $password = $request->old_password;
        }

        /*echo "<pre>";
        print_r($request->location);exit;*/

        for ($i=0; $i < count($request->location); $i++) { 
            $locations = implode(',', $request->location);
        }

        $update_admin = Admins::find($id);

        $update_admin->name = $request->name;
        $update_admin->email = $request->email;
        $update_admin->password = $password;
        $update_admin->role_id = $request->role_type;
        $update_admin->location_id = $locations;

        if ($update_admin->save()) {
            
            $notification = array(
                'message' => 'Admin is updated successfuly!', 
                'alert-type' => 'success',
            );
        }
        else
        {
            $notification = array(
                'message' => 'Some problem where occured while updating admin!', 
                'alert-type' => 'danger',
            );
        }

        return redirect()->route('admins')->with($notification);
    }

    public function delete($id)
    {
        DB::table('tbl_admin')->where('id',$id)->delete();

        $notification = array(
            'message' => 'Admin is Deleted successfuly!', 
            'alert-type' => 'success',
        );

        return redirect()->route('admins')->with($notification); 
    }
}