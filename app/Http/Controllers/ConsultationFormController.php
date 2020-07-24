<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Redirect;

use App\Models\ConsultationForm;
use App\Models\ConsultationFormData;

use Auth;

class ConsultationFormController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {

        if (Auth::user()->id == 1) {
            $forms = DB::table('tbl_consultation_form')
                ->LeftJoin('tbl_services', 'tbl_services.tbl_services_id', '=', 'tbl_consultation_form.tbl_consultation_form_service_id')
                ->select('tbl_consultation_form.*', 'tbl_services.tbl_services_name')
                ->orderBy('tbl_consultation_form_id', 'desc')
                ->get();
        } else {
            $forms = DB::table('tbl_consultation_form')
                ->LeftJoin('tbl_services', 'tbl_services.tbl_services_id', '=', 'tbl_consultation_form.tbl_consultation_form_service_id')
                ->where('tbl_consultation_form_location_id', session()->get('location_id'))
                ->select('tbl_consultation_form.*', 'tbl_services.tbl_services_name')
                ->orderBy('tbl_consultation_form_id', 'desc')
                ->get();
        }
        return view('consultation_form/index', compact('forms'));
    }

    public function add()
    {
        $services = DB::table('tbl_services')->where('tbl_services_location_id', session()->get('location_id'))->select('tbl_services_id', 'tbl_services_name')->get();
        return view('consultation_form/add', compact('services'));
    }

    public function create(Request $request)
    {

        /*echo "<pre>";
        print_r($request->all());exit;*/

        $insert_form_builder = new ConsultationForm([
            'tbl_consultation_form_service_id' => $request->obj_with_title[0]['service_id'],
            'tbl_consultation_form_title' => $request->obj_with_title[0]['title'],
            'tbl_consultation_form_data' => $request->obj_with_title[0]['data'],
            'tbl_consultation_form_location_id' => session()->get('location_id'),
            'tbl_consultation_form_insertdate' => now(),
        ]);
        //print_r($insert_form_builder);exit();
        $insert_form_builder->save();
    }

    public function edit($id)
    {
        $services = DB::table('tbl_services')->where('tbl_services_location_id', session()->get('location_id'))->select('tbl_services_id', 'tbl_services_name')->get();
        return view('consultation_form/edit', compact('services'));
    }

    public function getData(Request $request)
    {

        //print_r($request->id);exit;

        $edit_form = DB::table('tbl_consultation_form')->where('tbl_consultation_form_id', $request->id)->first();

        echo json_encode($edit_form);
    }

    public function update(Request $request)
    {

        /*print_r($request->all());exit;*/

        $update_form = ConsultationForm::find($request->id);

        $update_form->tbl_consultation_form_service_id = $request->obj_with_title[0]['service_id'];
        $update_form->tbl_consultation_form_title = $request->obj_with_title[0]['title'];
        $update_form->tbl_consultation_form_data = $request->obj_with_title[0]['data'];

        $update_form->save();

        $notification = array(
            'message' => 'ConsultationForm Updated Successfully!!!',
            'alert-type' => 'success',
        );

        return $notification;
    }

    public function delete($id)
    {

        $delete_form = ConsultationForm::where('tbl_consultation_form_id', $id)->delete();

        $notification = array(
            'message' => 'ConsultationForm Deleted Successfully!!!',
            'alert-type' => 'success',
        );

        return redirect()->route('ConsultationForm')->with($notification);
    }

    public function view($id)
    {

        return view('consultation_form/view');
    }

    public function adddata(Request $request)
    {

        $formdata = $request->all();
        //print_r( $formdata);
        unset($formdata['_token']);
        unset($formdata['form_id']);
        //print_r( $formdata);
        //exit;
        $userdata = array();
        $json_data = json_encode($formdata);
        $userdata['user_data'] = $json_data;
        //print_r($json_data);

        $data = DB::table('form_builder')
            ->where('tbl_form_builder_id', $request->form_id)
            ->first();

        $userdata['builder_data'] = $data->tbl_form_builder_data;
        /*print_r($userdata);
        exit();*/

        $insert_form_builder_data = new FormBuilderData([

            'tbl_form_builder_data_session_id' => Auth::user()->id,
            'tbl_form_builder_data_form_id' => $request->form_id,
            'tbl_form_builder_data_data' => json_encode($userdata),
            'tbl_form_builder_data_inserted_date' => now(),
        ]);
        //print_r($insert_form_builder_data);exit();
        if ($insert_form_builder_data->save()) {
            $notification = array(
                'message' => 'Form Data Inserted Successfully!!!',
                'alert-type' => 'success',
            );
        } else {
            $notification = array(
                'message' => 'Form Data Not Inserted Successfully!!!',
                'alert-type' => 'danger',
            );
        }

        return redirect()->route('FormBuilderIndex')->with($notification);
    }

    public function viewadddata($id)
    {

        $get_datas = DB::table('form_builder_data')
            ->where('tbl_form_builder_data_session_id', Auth::user()->id)
            ->where('tbl_form_builder_data_form_id', $id)
            ->get();
        //print_r($get_datas);exit;

        return view('form_builder/viewfromdata', compact('get_datas', 'id'));
    }

    public function partidata($id, $form_id)
    {

        return view('form_builder/partidata', compact('id', 'form_id'));
    }

    public function getpatidata(Request $request)
    {

        //print_r($request->id);exit;
        $data = DB::table('form_builder_data')
            ->where('tbl_form_builder_data_id', $request->id)
            // ->LeftJoin('form_builder','form_builder.tbl_form_builder_id','=','form_builder_data.tbl_form_builder_data_form_id')
            ->first();

        echo json_encode($data);


    }

    public function getConsultFormLink(Request $request)
    {
        foreach ($request->input('service_id') as $key => $val) {

        }
    }
}
