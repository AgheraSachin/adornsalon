<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<div class="container">
    @foreach($history as $key=>$val)
        <div style=" border-bottom: 4px dotted blue;">
            <div class="row">
                <h1>{{$val['consult_form_builder']['tbl_consultation_form_title']}}</h1>
                @foreach(json_decode($val['consult_form_builder']['tbl_consultation_form_data']) as $sub_key=>$sub_val)
                    <div class="col-md-12">
                        <label>{{$sub_val->label}}</label>
                        @php($name=$sub_val->name)
                        <span>{{isset(json_decode($history[$key]['tbl_consultationform_data_data'])->$name)?json_decode($history[$key]['tbl_consultationform_data_data'])->$name:isset(json_decode($history[0]['tbl_consultationform_data_data'])->$name)?json_decode($history[0]['tbl_consultationform_data_data'])->$name:''}}</span>
                    </div>
                @endforeach
                <div class="col-md-12">
                    <label>Comment</label>
                    <span>{{isset(json_decode($history[$key]['tbl_consultationform_data_data'])->comment)?json_decode($history[$key]['tbl_consultationform_data_data'])->comment:''}}</span>
                </div>
                <div class="col-md-12">
                    <label>Appointment On</label>
                    <span>{{isset($val['tbl_consultationform_data_insertdate'])?$val['tbl_consultationform_data_insertdate']:''}}</span>
                </div>
            </div>
        </div>
    @endforeach
</div>
