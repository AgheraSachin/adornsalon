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

use App\Models\RoleRights;

use Auth;

class RoleRightsController extends Controller
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
        $role_rights = DB::table('tbl_role_rights')->get();
            
        $roles = DB::table('tbl_roles')->select('tbl_roles_id','tbl_roles_types')->get();

        return view('role_rights/index',compact('role_rights','roles'));
    }

    public function store(Request $request)
    {
        /*echo "<pre>";
        print_r($request->all());exit;*/
        $newdata = [];
        $data = [];
        $vali = '';
        $vald = '';
        $vale = '';
        $vala = '';
        $i = 0;

        DB::table('tbl_role_rights')->where('tbl_role_rights_role_id',$request->role_type)->delete();

        foreach ($request->controller as $key => $value) 
        {
            if(!empty($request->$key))
            {   
                if (array_key_exists("index", $request->$key))
                {
                    $vali = '1';
                }
                else
                {
                    $vali = '0';
                }


                if (array_key_exists("edit", $request->$key))
                {
                    $vale = '1';
                }
                else
                {
                    $vale = '0';
                }

                if (array_key_exists("add", $request->$key))
                {
                    $vala = '1';
                }
                else
                {
                    $vala = '0';
                }

                if (array_key_exists("delete", $request->$key))
                {
                    $vald = '1';
                }
                else
                {
                    $vald = '0';
                }

                $add_role_rights[$i] = new RoleRights([
                    'tbl_role_rights_role_id' => $request->role_type,
                    'tbl_role_rights_page_name' => $key,
                    'tbl_role_rights_index' => $vali,
                    'tbl_role_rights_add' => $vala,
                    'tbl_role_rights_edit' =>  $vale,
                    'tbl_role_rights_delete' => $vald,
                    'tbl_role_rights_insertdate' => now(),
                ]);

                $add_role_rights[$i]->save();
            }
            else
            {
                $add_role_rights[$i] = new RoleRights([
                    'tbl_role_rights_role_id' => $request->role_type,
                    'tbl_role_rights_page_name' => $key,
                    'tbl_role_rights_index' => '0',
                    'tbl_role_rights_add' => '0',
                    'tbl_role_rights_edit' =>  '0',
                    'tbl_role_rights_delete' => '0',
                    'tbl_role_rights_insertdate' => now(),
                ]);

                $add_role_rights[$i]->save();
            }

        $i++;          
        }

    	$notification = array(
            'message' => 'Role Rights is inserted successfuly!', 
            'alert-type' => 'success',
        );

    	return redirect()->route('RoleRights')->with($notification);
    }

    public function role_data(Request $request)
    {
        $role_data = DB::table('tbl_role_rights')->where('tbl_role_rights_role_id',$request->role_id)->get();

        $data['editdata'] = $role_data;

        echo json_encode($data);
    }
}