<?php

namespace App\Http\Controllers;


use App\Models\Client;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;
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
        $saved_form = [];
        foreach ($request->input('service_id') as $key => $val) {
            if (!ConsultationFormData::where(['tbl_service_id' => $val, 'tbl_consultationform_data_client_id' => $request->input('client_id')])->exists()) {
                $consult_form_id = ConsultationForm::where('tbl_consultation_form_service_id', $val)->get();
                $saved_form[] = ConsultationFormData::create(['tbl_service_id' => $val, 'tbl_consultationform_data_client_id' => $request->input('client_id'), 'url' => substr(md5(time()), 0, 8), 'tbl_consultationform_data_const_id' => $consult_form_id[0]->tbl_consultation_form_id, 'tbl_consultationform_data_insertdate' => now(),]);
            }
        }

        $results = ConsultationFormData::where('tbl_consultationform_data_client_id', $request->input('client_id'))->whereIn('tbl_service_id', $request->input('service_id'))->where('url', '!=', '')->get();
        return \response()->json(['status' => true, 'data' => $results], 200);
    }

    public function getConsultFormData($url)
    {
        $consult_form = ConsultationFormData::with('consultFormBuilder')->where('url', $url)->get();
//        dd($consult_form->toArray());
        return view('consultation_form.consult_form')->with(['consult_form' => $consult_form[0]]);
    }

    public function saveDate(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'sign' => 'required',
        ]);
        if ($validator->fails()) {
            return Redirect::back()->withInput()->withErrors($validator->errors()->messages());
        }
        $image_parts = explode(";base64,", $request->input('sign'));
        $image_base64 = base64_decode($image_parts[1]);
        $filename = time() . '.png';
        file_put_contents(public_path('signatures/') . $filename, $image_base64);
        if (ConsultationFormData::where(['tbl_consultationform_data_id' => $request->input('form_id'), 'tbl_consultationform_data_data' => null])->exists()) {
            unset($input['sign']);
            unset($input['_token']);
            unset($input['client_id']);
            unset($input['form_id']);
            unset($input['url']);
            ConsultationFormData::where('tbl_consultationform_data_id', $request->input('form_id'))->update(['tbl_consultationform_data_data' => json_encode($input)]);
        } else {
            $client_id = $input['client_id'];
            unset($input['sign']);
            unset($input['_token']);
            unset($input['client_id']);
            unset($input['form_id']);
            unset($input['url']);
            $old = ConsultationFormData::where('tbl_consultationform_data_id', $request->input('form_id'))->get();
            ConsultationFormData::create(['tbl_service_id' => $old[0]->tbl_service_id, 'tbl_consultationform_data_client_id' => $client_id, 'tbl_consultationform_data_data' => json_encode($input), 'url' => '', 'tbl_consultationform_data_const_id' => $old[0]->tbl_consultationform_data_const_id, 'tbl_consultationform_data_insertdate' => now()]);
        }
        return \redirect('consulation_form_appointment_list');
    }

    public function getList()
    {
        $result = DB::table('tbl_consultationform_data')
            ->leftJoin('tbl_services', 'tbl_services.tbl_services_id', '=', 'tbl_consultationform_data.tbl_service_id')
            ->leftJoin('tbl_clients', 'tbl_clients.tbl_clients_id', '=', 'tbl_consultationform_data.tbl_consultationform_data_client_id')
            ->groupBy('tbl_consultationform_data.tbl_consultationform_data_client_id', 'tbl_consultationform_data.tbl_service_id')
            ->select('tbl_services.tbl_services_name', 'tbl_clients.tbl_clients_first_name', 'tbl_clients.tbl_clients_last_name', 'tbl_consultationform_data.*')
            ->get();


        return view('consultation_form.list_consultation', compact('result'));
    }

    public function historyView($client_id, $service_id)
    {
        $history = ConsultationFormData::with('consultFormBuilder')->where(['tbl_consultationform_data_client_id' => $client_id, 'tbl_service_id' => $service_id])->get()->toArray();
//        dd($history);
        return view('consultation_form.history-view')->with(['history' => $history]);

    }
}
