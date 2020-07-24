@extends('layouts.app')

@section('content')

<div id="main">
    <div class="row">
        <div class="breadcrumbs-inline pt-3 pb-1" id="breadcrumbs-wrapper">
            <!-- Search for small screen-->
            <div class="container">
                <div class="row">
                    <div class="col s10 m6 l6 breadcrumbs-left">
                        <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Add Consultation Form</span></h5>
                        <ol class="breadcrumbs mb-0">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item"><a href="{{ route('ConsultationForm') }}">Consultation Form</a>
                            </li>
                            <li class="breadcrumb-item active">Add
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="col s12">
            <div class="container">
                <div class="section section-data-tables">                        
                    <!-- Page Length Options -->
                   <div class="row">
                        <div class="col s12">
                            <div id="input-fields" class="card card-tabs">
                                <div class="card-content">
                                    <div class="card-title">
                                        <div class="row">
                                            <div class="col s12 m6 l10">
                                                <h4 class="card-title">Add Consultation Form</h4>
                                            </div>
                                            <div class="col s12 m6 l2">
                                                <a href="javascript:history.back()" class="mb-6 btn waves-effect waves-light gradient-45deg-purple-deep-orange gradient-shadow">Back</a>
                                                <input type="button" id="btnExport" value="Export PDF" class="btn btn-info mt-2 btnExport" style="margin-right: 20px;display: none;" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form_builder">
                                        <div class="row">
                                            <div class="col s3">
                                                <nav class="nav-sidebar">
                                                    <ul class="nav">
                                                        <li class="form_bal_textfield">
                                                            <a href="javascript:;">Text Field <i class="material-icons dp48 float-right">add_circle_outline</i></a>
                                                        </li>
                                                        <li class="form_bal_textarea">
                                                            <a href="javascript:;">Text Area <i class="material-icons dp48 pull-right">add_circle_outline</i></a>
                                                        </li>
                                                        <li class="form_bal_select">
                                                            <a href="javascript:;">Select <i class="material-icons dp48 pull-right">add_circle_outline</i></a>
                                                        </li>
                                                        <li class="form_bal_radio">
                                                            <a href="javascript:;">Radio Button <i class="material-icons dp48 pull-right">add_circle_outline</i></a>
                                                        </li>
                                                        <li class="form_bal_checkbox">
                                                            <a href="javascript:;">Checkbox <i class="material-icons dp48 pull-right">add_circle_outline</i></a>
                                                        </li>
                                                        <li class="form_bal_email">
                                                            <a href="javascript:;">Email <i class="material-icons dp48 pull-right">add_circle_outline</i></a>
                                                        </li>
                                                        <li class="form_bal_number">
                                                            <a href="javascript:;">Number <i class="material-icons dp48 pull-right">add_circle_outline</i></a>
                                                        </li>
                                                        <!-- <li class="form_bal_password">
                                                            <a href="javascript:;">Password <i class="material-icons dp48 pull-right"></i></a>
                                                        </li> -->
                                                        <li class="form_bal_date">
                                                            <a href="javascript:;">Date <i class="material-icons dp48 pull-right">add_circle_outline</i></a>
                                                        </li>
                                                        <!-- <li class="form_bal_button">
                                                            <a href="javascript:;">Button <i class="material-icons dp48 pull-right"></i></a>
                                                        </li> -->
                                                    </ul>
                                                </nav>
                                            </div>
                                            <div class="col m4 bal_builder">
                                                <div class="form_builder_area"></div>
                                            </div>
                                            <div class="col m4">
                                                <div class="col m12">
                                                    <form>
                                                        <div class="export_pdf row">
                                                            <div class="input-field col s6">
                                                                <select id="service" name="service" class="select2 browser-default" required="">
                                                                    <option value="" selected disabled>Select Your Service</option>
                                                                    <?php
                                                                    foreach ($services as $key => $value) { ?>
                                                                        <option value="{{$value->tbl_services_id}}">{{$value->tbl_services_name}}</option>
                                                                    <?php }
                                                                    ?>
                                                                </select>
                                                                <label for="service">Services</label>
                                                            </div>
                                                            <div class="input-field col s6">
                                                                <label for="title">Form Title</label>
                                                                <input type="text" name="title" id="title" required="">
                                                            </div>
                                                            <div class="preview col m12"></div>   
                                                            <div class="col s12">
                                                                <button type="submit" class="mb-6 btn waves-effect waves-light gradient-45deg-purple-deep-orange gradient-shadow data_store">Submit</button>
                                                            </div> 
                                                        </div>
                                                        <div style="display: none;" class="form-group plain_html">
                                                            <textarea rows="50" style="height: 90px!important;"></textarea></div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-overlay"></div>
        </div>
    </div>
</div>
@endsection

@section('content-script')
<script type="text/javascript">
    
    $("body").on("click", "#btnExport", function () {
        html2canvas($('.export_pdf')[0], {
            onrendered: function (canvas) {
                var data = canvas.toDataURL();
                var docDefinition = {
                    content: [{
                        image: data,
                        width: 500
                    }]
                };
                pdfMake.createPdf(docDefinition).download("ConsultationForm.pdf");
            }
        });
    });
</script>
<script type="text/javascript">
  $(document).on('click', '.data_store', function () {

        var el = $('.form_builder_area .form_output');

        var service_id = $('#service').val();
        var title = $('#title').val();
        //alert(service_id);

        var html = '';
        var formdata = [];
        var formoptiondata_select = [];
        var formoptiondata_radio = [];
        var formoptiondata_checkbox = [];

        el.each(function () {
            var data_type = $(this).attr('data-type');
            //var field = $(this).attr('data-field');
            var required = '';
            var value = '';
            var label = $(this).find('.form_input_label').val();
            var name = $(this).find('.form_input_name').val();
            var placeholder = $(this).find('.form_input_placeholder').val();
            var checkbox = $(this).find('.form-check-input');

            
            if (checkbox.is(':checked')) {
                    required = 'required';
                }
            
            // if (data_type === 'button') {
            //     var btn_class = $(this).find('.form_input_button_class').val();
            //     var btn_value = $(this).find('.form_input_button_value').val();
            //     html += '<button name="' + name + '" type="submit" class="' + btn_class + '">' + btn_value + '</button>';
            // }
            if (data_type === 'select') {
                var option_html = '';
                $(this).find('select option').each(function () {
                    var option = $(this).html();
                    var value = $(this).val();
                    //option_html += 'value:' + value + 'option:' + option;
                    formoptiondata_select.push({option:option,value:value});
                });
                formdata.push({datatype:data_type,label:label,name:name,placeholder:placeholder,required:required,value:formoptiondata_select});
                //html += 'Data type:'+ data_type +'Label:'+ label +'Name:'+ name +'placeholder:'+ placeholder +'required:'+ required + 'values:' + option_html;
                //html += '<label class="control-label">' + label + '</label><select class="form-control" name="' + name + '">' + option_html + '</select>';
            }
            else if (data_type === 'radio') {
                var option_html = '';
                $(this).find('.mt-radio').each(function () {
                    var option = $(this).find('p').html();
                    var value = $(this).find('input[type=radio]').val();
                    //option_html += 'name:' + name +  'value:' + value + 'option' + option;
                    formoptiondata_radio.push({option:option,value:value});
                });

                formdata.push({datatype:data_type,label:label,name:name,placeholder:placeholder,required:required,value:formoptiondata_radio});

                //html += 'Data type:'+ data_type +'Label:' + label + 'Values:' + option_html;
                //html += '<div class="form-group"><label class="control-label">' + label + '</label>' + option_html + '</div>';
            }
            else if (data_type === 'checkbox') {
                var option_html = '';
                $(this).find('.mt-checkbox').each(function () {
                    var option = $(this).find('p').html();
                    var value = $(this).find('input[type=checkbox]').val();
                    //option_html += '<label class="form-check-label"><input type="checkbox" class="form-check-input" name="' + name + '[]" value="' + value + '">' + option + '</label>';
                    //option_html += 'name:' + name +  'value:' + value + 'option' + option;

                    formoptiondata_checkbox.push({option:option,value:value});
                });

                formdata.push({datatype:data_type,label:label,name:name,placeholder:placeholder,required:required,value:formoptiondata_checkbox});

                //html += 'Data type:'+ data_type +'Label:' + label + 'Values:' + option_html;
                //html += '<label class="control-label">' + label + '</label>' + option_html + '';
            }
            else
            {
               formdata.push({datatype:data_type,label:label,name:name,placeholder:placeholder,required:required,value:value});
            }
        });
      var obj = JSON.stringify(formdata); 
      var obj_with_title = new Array();
      obj_with_title.push({service_id:service_id,title:title,data:obj});
      //alert(obj);
      //console.log(obj_with_title);
    
    if (service_id != '' && title != '') 
    {
        $.ajax({
            type: "POST",
            url: '{{ URL::route("ConsultationFormStore") }}',
            dataType: 'text',
            data: {"_token": "{{ csrf_token() }}",obj_with_title},
            success: function(data) 
            {
                //console.log(data);
                //console.log('Data Inserted');
                window.location.href = "{{URL::to('consultation_form')}}";
            }
        });
    }      

  });
</script>
@endsection