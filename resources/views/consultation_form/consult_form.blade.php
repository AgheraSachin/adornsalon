<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="{{asset('public/css/custom/custom.css')}}">
<script src="{{ asset('public/js/vendors.min.js') }}"></script>
<script src="{{ asset('public/js/signature.js') }}"></script>

<div class="container">
    @if($errors->any())
        <ul class="alert alert-danger">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    @endif
    @if(\Illuminate\Support\Facades\Session::has('message'))
        <p class="alert alert-info">{{ \Illuminate\Support\Facades\Session::get('message') }}</p>
    @endif
    <form method="post" action="{{route('consultant.form.save')}}" enctype="multipart/form-data" id="submit_form">
        @csrf
        <input type="hidden" name="client_id" id="client_id"
               value="{{$consult_form->tbl_consultationform_data_client_id}}">
        <input type="hidden" name="form_id" id="form_id"
               value="{{$consult_form->tbl_consultationform_data_id}}">
        <h1>{{isset($consult_form->consultFormBuilder->tbl_consultation_form_title)?$consult_form->consultFormBuilder->tbl_consultation_form_title:''}}</h1>
        <div class="row">
            @foreach(json_decode($consult_form->consultFormBuilder->tbl_consultation_form_data) as $key=>$val)
                @if($val->datatype=='text')
                    @php($name=$val->name)

                    <div class="form-group col-md-12">
                        <label class="control-label col-sm-2">{{$val->label}}</label>
                        <input type="text" name="{{$name}}"
                               value="{{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name)?json_decode($consult_form->tbl_consultationform_data_data)->$name:$val->value}}"
                               placeholder="{{$val->placeholder}}"
                               class="form-control" {{isset($val->required)?'required':''}}
                                {{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name)?'readonly':''}}
                        >
                    </div>
                @endif
                @if($val->datatype=='email')
                    @php($name=$val->name)
                    <div class="form-group col-md-12">
                        <label class="control-label col-sm-2">{{$val->label}}</label>
                        <input type="email" name="{{$name}}"
                               value="{{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name)?json_decode($consult_form->tbl_consultationform_data_data)->$name:$val->value}}"
                               placeholder="{{$val->placeholder}}"
                               class="form-control" {{isset($val->required)?'required':''}}
                                {{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name)?'readonly':''}}
                        ></div>
                @endif
                @if($val->datatype=='textarea')
                    @php($name=$val->name)
                    <div class="form-group col-md-12">
                        <label class="control-label col-sm-2">{{$val->label}}</label>
                        <textarea name="{{$val->name}}"
                                  placeholder="{{$val->placeholder}}"
                                  class="form-control" {{isset($val->required)?'required':''}} {{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name)?'readonly':''}}>{{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name)?json_decode($consult_form->tbl_consultationform_data_data)->$name:$val->value}}</textarea>
                    </div>
                @endif
                @if($val->datatype=='select')
                    <div class="form-group col-md-12">
                        @php($name=$val->name)
                        <label class="control-label col-sm-2">{{$val->label}}</label>
                        <select class="form-control"
                                name="{{$val->name}}" {{isset($val->required)?'required':''}} {{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name)?'disabled':''}}>
                            @foreach($val->value as $op_key=>$p_val)
                                <option value="{{$p_val->value}}" {{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name) && (json_decode($consult_form->tbl_consultationform_data_data)->$name==$p_val->value)?'selected':''}}>{{$p_val->option}}</option>
                            @endforeach
                        </select>
                    </div>
                @endif
                @if($val->datatype=='radio')
                    <div class="form-group col-md-12">
                        <span></span>
                        @php($name=$val->name)
                        @foreach($val->value as $g_key=>$g_val)
                            <div class="radio">
                                <label><input type="radio" name="{{$val->name}}"
                                              {{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name)?'disabled':''}}
                                              value="{{$g_val->value}}" {{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name) && json_decode($consult_form->tbl_consultationform_data_data)->$name==$g_val->value?'checked':''}}>{{$g_val->option}}
                                </label>
                            </div>
                        @endforeach
                    </div>
                @endif
                @if($val->datatype=='checkbox')
                    <div class="form-group col-md-12">
                        <span></span>
                        @php($name=$val->name)
                        @foreach($val->value as $g_key=>$g_val)
                            <div class="checkbox">
                                <label><input type="checkbox" name="{{$val->name}}"
                                              {{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name)?'disabled':''}}
                                              value="{{$g_val->value}}" {{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name) && json_decode($consult_form->tbl_consultationform_data_data)->$name==$g_val->value?'checked':''}}> {{$g_val->option}}
                                </label>
                            </div>
                        @endforeach
                    </div>
                @endif
                @if($val->datatype=='number')
                    @php($name=$val->name)
                    <div class="form-group col-md-12">
                        <label class="control-label col-sm-2">{{$val->label}}</label>
                        <input type="number" name="{{$name}}"
                               value="{{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name)?json_decode($consult_form->tbl_consultationform_data_data)->$name:$val->value}}"
                               placeholder="{{$val->placeholder}}"
                               class="form-control" {{isset($val->required)?'required':''}}
                                {{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name)?'disabled':''}}
                        >
                    </div>
                @endif
                @if($val->datatype=='date')
                    @php($name=$val->name)
                    <div class="form-group col-md-12">
                        <label class="control-label col-sm-2">{{$val->label}}</label>
                        <input type="date" name="{{$val->name}}"
                               value="{{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name)?json_decode($consult_form->tbl_consultationform_data_data)->$name:$val->value}}"
                               class="form-control" {{isset($val->required)?'required':''}}  {{isset(json_decode($consult_form->tbl_consultationform_data_data)->$name)?'disabled':''}}>
                    </div>
                @endif
            @endforeach
            <div class="form-group col-md-12">
                <label class="control-label col-sm-2">Comment</label>
                <textarea name="comment" id="comment" class="form-control" required></textarea>
            </div>
            <div class="form-group col-md-12">
                <label class="control-label col-sm-2">Signature</label>
                <div id="signature-pad" class="signature-pad">
                    <canvas></canvas>
                </div>
                <input type="hidden" name="sign" id="sign">
            </div>
        </div>
        <button type="submit" class="btn btn-info" id="save">Submit</button>
    </form>
</div>
<script type="text/javascript">
    var wrapper = document.getElementById("signature-pad");
    var canvas = wrapper.querySelector("canvas");
    var signaturePad = new SignaturePad(canvas, {
        backgroundColor: 'rgb(255, 255, 255)'
    });

    var saveButton = document.getElementById('save');
    saveButton.addEventListener('click', function (event) {
        if (signaturePad.isEmpty()) {
            $("#sign").val("");
        } else {
            var data = signaturePad.toDataURL("");
            $("#sign").val(data);
        }
    });
</script>