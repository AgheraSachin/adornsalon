<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Hash;

use App\Models\Client;

use Auth;

class ClientController extends Controller
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
            $clients = DB::table('tbl_clients')
                ->orderBy('tbl_clients_id', 'desc')
                ->get();
        }
        else
        {
            $clients = DB::table('tbl_clients')
                ->where('tbl_clients_location_id',session()->get('location_id'))
                ->orderBy('tbl_clients_id', 'desc')
                ->get();
        }
        return view('client/index',compact('clients')); 
    }

    public function add()
    {
        $country_codes = DB::table('tbl_country_code')->get();
        return view('client/add',compact('country_codes'));
    }

    public function create(Request $request)
    {
        Validator::make($request->all(), [
            'email' => ['unique:tbl_clients,tbl_clients_email'],
        ])->validate();
        
        $file = $request->file('image');
                
        if ($request->hasFile("image")) {
            $file = $request->file("image");
            $file->move("public/client/",$file->getClientOriginalName());
            $image = $file->getClientOriginalName();
        }
        else {
            $image = '';
        }
        
        /*echo "<pre>";
        print_r($request->all());exit;*/

        $randomid = mt_rand(100000,999999);

        $insert_client = new Client([
            'tbl_clients_first_name' => $request->get('first_name'),
            'tbl_clients_middle_name' => $request->get('middle_name') ? $request->get('middle_name') : '',
            'tbl_clients_last_name' => $request->get('last_name'),
            'tbl_clients_user_name' => $request->get('username'),
            'tbl_clients_user_id' => Auth::user()->id,
            'tbl_clients_unique_id' => $randomid,
            'tbl_clients_email' => $request->get('email'),
            'tbl_clients_password' => Hash::make($request->get('password')),
            'tbl_clients_country_code' => $request->get('country_code'),
            'tbl_clients_mobile' => $request->get('mobile'),
            'tbl_clients_telephone' => $request->get('telephone') ? $request->get('telephone') : '',
            'tbl_clients_image' => $image,
            'tbl_clients_notification' => 1,
            'tbl_clients_gender' => $request->get('gender'),
            'tbl_clients_referral_source' => 1,
            'tbl_clients_birthday' => date('Y-m-d',strtotime($request->birthday)),
            'tbl_clients_location_id' => session()->get('location_id'),
            'tbl_clients_status' => '1',
            'tbl_clients_address' => $request->address ? $request->address : '',
            'tbl_clients_marital_status' => $request->marital_status ? $request->marital_status : '0',
            'tbl_clients_anniversary_date' => date('Y-m-d',strtotime($request->anniversary_date)),
            'tbl_clients_insertdate' => now(),
        ]);

        //print_r($insert_client);exit;
        if ($insert_client->save()) {
            $notification = array(
                'message' => 'Client is Inserted Successfully!!!', 
                'alert-type' => 'success',
            );
        }
        else {
            $notification = array(
                'message' => 'Client is Not Inserted Successfully!!!', 
                'alert-type' => 'danger',
            );
        }
        
        return redirect()->route('Client')->with($notification);
    }
    
    public function edit($id) 
    {
        $country_codes = DB::table('tbl_country_code')->get();
        $edit_client = DB::table('tbl_clients')->where('tbl_clients_id', $id)->first(); 
        return view('client/edit',compact('edit_client','country_codes'));
    }

    public function update(Request $request,$id) 
    {
        //print_r($request->all());exit;

        $file = $request->file('image');
                
        if ($request->hasFile("image")) {
            
            if ($request->old_image != '') {
                unlink(public_path('client/'.$request->old_image));
            }
            
            $file = $request->file("image");
            $file->move("public/client/",$file->getClientOriginalName());
        }

        if (empty($request->file('image'))) {
            
            $image = $request->get('old_image');
        }else{
            
           $image = $file->getClientOriginalName();
        }

        if ($request->password == '') 
        {
            $pass = $request->old_password;
        }
        else
        {
            $pass = Hash::make($request->get('password'));
        }

        $var = $request->anniversary_date;
        $date = str_replace('/', '-', $var);
        $an_date = date('Y-m-d', strtotime($date));
        //print_r($request->all());exit;
        $update_client = Client::find($id);
        
        $update_client->tbl_clients_first_name = $request->first_name;
        $update_client->tbl_clients_middle_name = $request->middle_name ? $request->middle_name : '';
        $update_client->tbl_clients_last_name = $request->last_name;
        $update_client->tbl_clients_user_name = $request->username;
        $update_client->tbl_clients_email = $request->email;
        $update_client->tbl_clients_password = $pass;
        $update_client->tbl_clients_country_code = $request->country_code;
        $update_client->tbl_clients_mobile = $request->mobile;
        $update_client->tbl_clients_telephone = $request->telephone ? $request->telephone : '';
        $update_client->tbl_clients_image = $image ? $image : '';
        $update_client->tbl_clients_notification = 1;
        $update_client->tbl_clients_gender = $request->gender;
        $update_client->tbl_clients_referral_source = 1;
        $update_client->tbl_clients_birthday = date('Y-m-d',strtotime($request->birthday));
        $update_client->tbl_clients_address = $request->address ? $request->address : '';
        $update_client->tbl_clients_marital_status = $request->marital_status;
        $update_client->tbl_clients_anniversary_date = $an_date;

        if ($update_client->save()) {
            $notification = array(
                'message' => 'Client Updated Successfully!!!', 
                'alert-type' => 'success',
            );
        }
        else {
            $notification = array(
                'message' => 'Client is Not Updated Successfully!!!', 
                'alert-type' => 'danger',
            );
        }
        
        return redirect()->route('Client')->with($notification);
    }

    public function delete($id) 
    {
        $delete_client = Client::where('tbl_clients_id',$id)->delete();

        $notification = array(
            'message' => 'Client Deleted Successfully!!!', 
            'alert-type' => 'success',
        );

        return redirect()->route('Client')->with($notification);    
    }

    public function active($id)
    {
        $active_status = Client::where('tbl_clients_id',$id)->update(['tbl_clients_status'=>'1']);
        $notification = array(
                'message' => 'Client Status Updated Successfully!!!', 
                'alert-type' => 'success',
            );

            return redirect()->route('Client')->with($notification);
    }

    public function inactive($id)
    {
        $active_status = Client::where('tbl_clients_id',$id)->update(['tbl_clients_status'=>'0']);
        $notification = array(
                'message' => 'Client Status Updated Successfully!!!', 
                'alert-type' => 'success',
            );

            return redirect()->route('Client')->with($notification);
    }

}
