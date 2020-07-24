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

class PermissionController extends Controller
{
	public function index()
	{
		$action = app('request')->route()->getAction();
        $controllerandmethod = class_basename($action['controller']);
        $action = explode('@', $controllerandmethod);
        
        $controller = $action[0];
        $function = $action[1];
        /*print_r($controller);
        exit;*/
        //$this->calledMethods = strtolower($this->router->fetch_method());
        
        $get_data = '';

        if($function == 'index')
        {
            $get_data = 'tbl_role_rights_index';
        }
        elseif ($function == 'delete') 
        {
            $get_data = 'tbl_role_rights_delete';
        }
        elseif ($function == 'edit') 
        {
            $get_data = 'tbl_role_rights_edit';
        }
        elseif ($function == 'add') 
        {
            $get_data = 'tbl_role_rights_add';
        }
        else
        {
            $get_data = '*';
        }

        $admin = DB::table('tbl_admin')->where('id',Auth::user()->id)->select('role_id')->first();

        $permission_data = DB::table('tbl_role_rights')->where('tbl_role_rights_role_id',$admin->role_id)->where('tbl_role_rights_page_name',$controller)->select($get_data)->get();

        //print_r($permission_data);exit;

        if($function == 'index')
        {
            $views = 'index';
        }else if($function == 'add')
        {
            $views = 'add';
        }
        else if($function == 'edit')
        {
            $views = 'edit';
        }
        else if($function == 'delete')
        {
            $views = 'delete';
        }       
        
        //$this->load->library('user_agent');

        if(sizeof($permission_data) != 0)
        {
            //print_r($permission_data);exit;
            foreach ($permission_data[0] as $key => $value) 
            {
                $string = $key;
                $pieces = explode('_', $string);
                $last_word = array_pop($pieces);
                
                if($last_word == $views)
                {
                    if($value == 0)
                    {
                        return 1;
                    }
                    else
                    {
                    	return 0;
                    }
                }
            }
        }
	}
}
