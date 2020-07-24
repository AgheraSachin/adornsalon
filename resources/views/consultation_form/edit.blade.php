@extends('layouts.app')

@section('content')

<div id="main">
    <div class="row">
        <div class="breadcrumbs-inline pt-3 pb-1" id="breadcrumbs-wrapper">
            <!-- Search for small screen-->
            <div class="container">
                <div class="row">
                    <div class="col s10 m6 l6 breadcrumbs-left">
                        <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Edit Consultation Form</span></h5>
                        <ol class="breadcrumbs mb-0">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item"><a href="{{ route('ConsultationForm') }}">Consultation Form</a>
                            </li>
                            <li class="breadcrumb-item active">Edit
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
                                                <h4 class="card-title">Edit Consultation Form</h4>
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
                                                                <input type="text" name="title" id="title" required="" placeholder="">
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
    $(document).ready(function() {
        var pageURL = $(location).attr("href");
        var id = pageURL.substring(pageURL.lastIndexOf('/') + 1);
        //alert(id);

        $.ajax({
            type: "POST",
            url: '{{ URL::route("ConsultationFormGetData") }}',
            dataType: 'text',
            data: {"_token": "{{ csrf_token() }}",id},
            success: function(data) 
            {
              //console.log(data);
              var obj = JSON.parse(data);
              //console.log(obj);
              $('#service').val(obj.tbl_consultation_form_service_id);
              $('#service').select2();
              $('#title').val(obj.tbl_consultation_form_title);
              var data = JSON.parse(obj.tbl_consultation_form_data);
              //console.log(data);
              //console.log(data[0].datatype);
                var plain_html='';
                var field = Math.floor(Math.random() * (100000 - 1 + 1) + 57);
                var opt1 = Math.floor(Math.random() * (100000 - 1 + 1) + 57);
                var html = '';
                var form_html='';

                $.each(data,function(index,data){
                    var data_type = data.datatype;
                    //var field = $(this).attr('data-field');
                    var label = data.label;
                    var name = data.name;
                    if (data_type === 'text') {
                        var placeholder = data.placeholder;
                        var required = '';
                        if (data.required == 'required') {
                            required = 'checked';
                        }
                        form_html += '<div class="li_' + field + ' form_builder_field"><div class="all_div"><div class="row li_row"><div class="col m10"><label>Text Field</label></div><div class="col m2"><button type="button" class="btn btn-primary btn-sm remove_bal_field pull-right" data-field="' + field + '"><i class="material-icons dp48">clear</i></button></div></div></div><hr/><div class="row li_row form_output" data-type="text" data-field="' + field + '"><div class="col m12"><div class="form-group"><input type="text" name="label_' + field + '" class="form-control form_input_label" value="'+label+'" data-field="' + field + '"/></div></div><div class="col m12"><div class="form-group"><input type="text" name="placeholder_' + field + '" data-field="' + field + '" class="form-control form_input_placeholder" placeholder="Placeholder" value="'+placeholder+'"/></div></div><div class="col m12"><div class="form-group"><input type="text" name="text_' + field + '" class="form-control form_input_name" placeholder="Name" value="'+name+'"/></div></div><div class="col m12"><div class="form-check"><label class="form-check-label"><input data-field="' + field + '" type="checkbox" class="form-check-input form_input_req" '+required+'><span>Required</span></label></div></div></div></div>';
                        if (data.required == 'required') {
                            required = 'required';
                        }
                        html += '<div class="form-group"><label class="control-label">' + label + '</label><input type="text" name="' + name + '" placeholder="' + placeholder + '" class="form-control" ' + required + '/></div>';
                    }
                    if (data_type === 'number') {
                        var placeholder = data.placeholder;
                        var required = '';
                        if (data.required == 'required') {
                            required = 'checked';
                        }
                        form_html += '<div class="li_' + field + ' form_builder_field"><div class="all_div"><div class="row li_row"><div class="col m10"><label>Number Field</label></div><div class="col m2"><button type="button" class="btn btn-primary btn-sm remove_bal_field pull-right" data-field="' + field + '"><i class="material-icons dp48">clear</i></button></div></div></div><hr/><div class="row li_row form_output" data-type="number" data-field="' + field + '"><div class="col m12"><div class="form-group"><input type="text" name="label_' + field + '" class="form-control form_input_label" value="'+label+'" data-field="' + field + '"/></div></div><div class="col m12"><div class="form-group"><input type="text" name="placeholder_' + field + '" data-field="' + field + '" class="form-control form_input_placeholder" placeholder="Placeholder" value="'+placeholder+'"/></div></div><div class="col m12"><div class="form-group"><input type="text" name="text_' + field + '" class="form-control form_input_name" placeholder="Name" value="'+name+'"/></div></div><div class="col m12"><div class="form-check"><label class="form-check-label"><input data-field="' + field + '" type="checkbox" class="form-check-input form_input_req" '+required+'><span>Required</span></label></div></div></div></div>';
                        if (data.required == 'required') {
                            required = 'required';
                        }
                        html += '<div class="form-group"><label class="control-label">' + label + '</label><input type="number" name="' + name + '" placeholder="' + placeholder + '" class="form-control" ' + required + '/></div>';
                    }
                    if (data_type === 'email') {
                        var placeholder = data.placeholder;
                        var required = '';
                        if (data.required == 'required') {
                            required = 'checked';
                        }
                        form_html += '<div class="li_' + field + ' form_builder_field"><div class="all_div"><div class="row li_row"><div class="col m10"><label>Email Field</label></div><div class="col m2"><button type="button" class="btn btn-primary btn-sm remove_bal_field pull-right" data-field="' + field + '"><i class="material-icons dp48">clear</i></button></div></div></div><hr/><div class="row li_row form_output" data-type="email" data-field="' + field + '"><div class="col m12"><div class="form-group"><input type="text" name="label_' + field + '" class="form-control form_input_label" value="'+label+'" data-field="' + field + '"/></div></div><div class="col m12"><div class="form-group"><input type="text" name="placeholder_' + field + '" data-field="' + field + '" class="form-control form_input_placeholder" placeholder="Placeholder" value="'+placeholder+'"/></div></div><div class="col-md-12"><div class="form-group"><input type="text" name="text_' + field + '" class="form-control form_input_name" placeholder="Name" value="'+name+'"/></div></div><div class="col m12"><div class="form-check"><label class="form-check-label"><input data-field="' + field + '" type="checkbox" class="form-check-input form_input_req" '+required+'><span>Required</span></label></div></div></div></div>';
                        if (data.required == 'required') {
                            required = 'required';
                        }
                        html += '<div class="form-group"><label class="control-label">' + label + '</label><input type="email" name="' + name + '" placeholder="' + placeholder + '" class="form-control" ' + required + '/></div>';
                    }
                    if (data_type === 'textarea') {
                        var placeholder = data.placeholder;
                        var required = '';
                        if (data.required == 'required') {
                            required = 'checked';
                        }
                        form_html += '<div class="li_' + field + ' form_builder_field"><div class="all_div"><div class="row li_row"><div class="col m10"><label>Textarea Field</label></div><div class="col m2"><button type="button" class="btn btn-primary btn-sm remove_bal_field pull-right" data-field="' + field + '"><i class="material-icons dp48">clear</i></button></div></div></div><hr/><div class="row li_row form_output" data-type="textarea" data-field="' + field + '"><div class="col m12"><div class="form-group"><input type="text" name="label_' + field + '" class="form-control form_input_label" value="'+label+'" data-field="' + field + '"/></div></div><div class="col m12"><div class="form-group"><input type="text" name="placeholder_' + field + '" data-field="' + field + '" class="form-control form_input_placeholder" placeholder="Placeholder" value="'+placeholder+'"/></div></div><div class="col m12"><div class="form-group"><input type="text" name="text_' + field + '" class="form-control form_input_name" placeholder="Name" value="'+name+'"/></div></div><div class="col m12"><div class="form-check"><label class="form-check-label"><input data-field="' + field + '" type="checkbox" class="form-check-input form_input_req" '+required+'><span>Required</span></label></div></div></div></div>';
                        if (data.required == 'required') {
                            required = 'required';
                        }
                        html += '<div class="form-group"><label class="control-label">' + label + '</label><textarea rows="5" name="' + name + '" placeholder="' + placeholder + '" class="form-control" ' + required + '/></div>';
                    }
                    if (data_type === 'date') {
                        var required = '';
                        if (data.required == 'required') {
                            required = 'checked';
                        }
                        form_html += '<div class="li_' + field + ' form_builder_field"><div class="all_div"><div class="row li_row"><div class="col m10"><label>Date Field</label></div><div class="col m2"><button type="button" class="btn btn-primary btn-sm remove_bal_field pull-right" data-field="' + field + '"><i class="material-icons dp48">clear</i></button></div></div></div><hr/><div class="row li_row form_output" data-type="date" data-field="' + field + '"><div class="col m12"><div class="form-group"><input type="text" name="label_' + field + '" class="form-control form_input_label" value="'+label+'" data-field="' + field + '"/></div></div><div class="col m12"><div class="form-group"><input type="text" name="text_' + field + '" class="form-control form_input_name" placeholder="Name" value="'+name+'"/></div></div><div class="col m12"><div class="form-check"><label class="form-check-label"><input data-field="' + field + '" type="checkbox" class="form-check-input form_input_req" '+required+'><span>Required</span></label></div></div></div></div>';
                        if (data.required == 'required') {
                            required = 'required';
                        }
                        html += '<div class="form-group"><label class="control-label">' + label + '</label><input type="date" name="' + name + '" class="form-control" ' + required + '/></div>';
                    }
                    if (data_type === 'select') {

                        var option_html = '';
                        var new_otp = '';
                        var sel_opt_data = '';
                        var only_val = '';

                        $.each(data.value,function(index,data) {
                            var options = data.option;
                            var values = data.value;
                            option_html += '<option value="' + values + '">' + options + '</option>';
                            new_otp += '<option data-opt"'+ opt1 + '"value="Value">'+options+'</option>';

                            if(index > 0) {
                                only_val = '<i class="margin-top-5 margin-left-5 material-icons dp48 default_red fa-2x remove_more_select" data-field="' + field + '">add_circle</i>';
                            }
                            sel_opt_data += '<div data-field="' + field + '" class="row select_row_' + field + '" data-opt="' + opt1 + '"><div class="col m4"><div class="form-group"><input type="text" value="'+options+'" class="s_opt form-control"/></div></div><div class="col m4"><div class="form-group"><input type="text" value="'+values+'" class="s_val form-control"/></div></div><div class="col m4"><i class="margin-top-5 material-icons dp48 fa-2x default_blue add_more_select" data-field="' + field + '">add_circle</i>'+only_val+'</div></div>';

                        });
                        
                        form_html += '<div class="li_' + field + ' form_builder_field"><div class="all_div"><div class="row li_row"><div class="col m10"><label>Select Field</label></div><div class="col m2"><button type="button" class="btn btn-primary btn-sm remove_bal_field pull-right" data-field="' + field + '"><i class="material-icons dp48">add_circle</i></button></div></div></div><hr/><div class="row li_row form_output" data-type="select" data-field="' + field + '"><div class="col m12"><div class="form-group"><input type="text" name="label_' + field + '" class="form-control form_input_label" value="'+label+'" data-field="' + field + '"/></div></div><div class="col m12"><div class="form-group"><input type="text" name="text_' + field + '" class="form-control form_input_name" placeholder="Name" value="'+name+'" /></div></div><div class="col m12"><div class="form-group"><select name="select_' + field + '" class="form-control">'+new_otp+'</select></div></div></div><div class="row li_row"><div class="col m12"><div class="field_extra_info_' + field + '">'+sel_opt_data+'</div></div></div></div></div>';

                        html += '<div class="form-group"><label class="control-label">' + label + '</label><select class="form-control" name="' + name + '">' + option_html + '</select></div>';
                    }
                    if (data_type === 'radio') {

                        var option_html = '';
                        var new_otp = '';
                        var sel_opt_data = '';
                        var only_val = '';
                        
                        $.each(data.value,function(index,data) {
                            var options = data.option;
                            var values = data.value;
                                
                            new_otp += '<label class="mt-radio mt-radio-outline"><input data-opt="' + opt1 + '" type="radio" name="radio_' + field + '" value="Value"><p class="r_opt_name_' + opt1 + '"><span>'+options+'</span></p><span></span></label>';

                            option_html += '<div class="form-check"><label class="form-check-label"><input type="radio" class="form-check-input" name="' + name + '" value="' + values + '"><span>' + options + '</span></label></div>';
                            
                            if(index > 0) {
                                only_val = '<i class="margin-top-5 margin-left-5 material-icons dp48 default_red fa-2x remove_more_select" data-field="' + field + '">do_not_disturb_on</i>';
                            }
                            
                            sel_opt_data += '<div data-field="' + field + '" class="row select_row_' + field + '" data-opt="' + opt1 + '"><div class="col m4"><div class="form-group"><input type="text" value="'+options+'" class="s_opt form-control"/></div></div><div class="col m4"><div class="form-group"><input type="text" value="'+values+'" class="s_val form-control"/></div></div><div class="col m4"><i class="margin-top-5 material-icons dp48 fa-2x default_blue add_more_select" data-field="' + field + '">add_circle</i>'+only_val+'</div></div>';
                        });
                        
                        form_html += '<div class="li_' + field + ' form_builder_field"><div class="all_div"><div class="row li_row"><div class="col m10"><label>Radio Button Field</label></div><div class="col m2"><button type="button" class="btn btn-primary btn-sm remove_bal_field pull-right" data-field="' + field + '"><i class="material-icons display">clear</i></button></div></div></div><hr/><div class="row li_row form_output" data-type="select" data-field="' + field + '"><div class="col m12"><div class="form-group"><input type="text" name="label_' + field + '" class="form-control form_input_label" value="'+label+'" data-field="' + field + '"/></div></div><div class="col m12"><div class="form-group"><input type="text" name="text_' + field + '" class="form-control form_input_name" placeholder="Name" value="'+name+'" /></div></div><div class="col m12"><div class="form-group"><div class="mt-radio-list radio_list_' + field + '">'+new_otp+'</div></div></div></div><div class="row li_row"><div class="col m12"><div class="field_extra_info_' + field + '">'+sel_opt_data+'</div></div></div></div></div>';

                        html += '<div class="form-group"><label class="control-label">' + label + '</label>' + option_html + '</div>';
                    }
                    if (data_type === 'checkbox') {

                        var option_html = '';
                        var new_otp = '';
                        var sel_opt_data = '';
                        var only_val = '';

                        $.each(data.value,function(index,data) {
                            var options = data.option;
                            var values = data.value;

                            option_html += '<div class="form-check"><label class="form-check-label"><input type="checkbox" class="form-check-input" name="' + name + '[]" value="' + values + '"><span>' + options + '</span></label></div>';

                            new_otp += '<label class="mt-checkbox mt-checkbox-outline"><input data-opt="' + opt1 + '" type="checkbox" name="checkbox_' + field + '" value="Value"><span><p class="c_opt_name_' + opt1 + '">'+options+'</span></p><span></span></label>';

                            if(index > 0) {
                                only_val = '<i class="margin-top-5 margin-left-5 fa fa-times-circle default_red fa-2x remove_more_select" data-field="' + field + '"></i>';
                            }
                            
                            sel_opt_data += '<div data-field="' + field + '" class="row select_row_' + field + '" data-opt="' + opt1 + '"><div class="col m4"><div class="form-group"><input type="text" value="'+options+'" class="s_opt form-control"/></div></div><div class="col m4"><div class="form-group"><input type="text" value="'+values+'" class="s_val form-control"/></div></div><div class="col m4"><i class="margin-top-5 material-icons dp48 fa-2x default_blue add_more_select" data-field="' + field + '">add_circle</i>'+only_val+'</div></div>';
                        });

                        form_html += '<div class="li_' + field + ' form_builder_field"><div class="all_div"><div class="row li_row"><div class="col m10"><label>Checkbox Field</label></div><div class="col m2"><button type="button" class="btn btn-primary btn-sm remove_bal_field pull-right" data-field="' + field + '"><i class="material-icons dp48">clear</i></button></div></div></div><hr/><div class="row li_row form_output" data-type="select" data-field="' + field + '"><div class="col m12"><div class="form-group"><input type="text" name="label_' + field + '" class="form-control form_input_label" value="'+label+'" data-field="' + field + '"/></div></div><div class="col m12"><div class="form-group"><input type="text" name="text_' + field + '" class="form-control form_input_name" placeholder="Name" value="'+name+'" /></div></div><div class="col m12"><div class="form-group"><div class="mt-radio-list radio_list_' + field + '">'+new_otp+'</div></div></div></div><div class="row li_row"><div class="col m12"><div class="field_extra_info_' + field + '">'+sel_opt_data+'</div></div></div></div></div>';

                        html += '<div class="form-group"><label class="control-label">' + label + '</label>' + option_html + '</div>';
                    }
                });
                    

                if (html.length) {
                    $('.export_html').show();
                    $('.data_store').show();
                    $('.btnExport').show();
                } else {
                    $('.export_html').hide();
                    $('.data_store').hide();
                    $('.btnExport').hide();
                }
                if (plain_html === 'html') {
                    $('.preview').hide();
                    $('.plain_html').show().find('textarea').val(html);
                } else {
                    $('.plain_html').hide();
                    //$('.preview').addClass('li_' + field + ' form_builder_field').html(html).show();
                    $('.preview').html(html).show();
                    $('.form_builder_area').html(form_html);
                }

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

            }
            else if (data_type === 'checkbox') {
                var option_html = '';
                $(this).find('.mt-checkbox').each(function () {
                    var option = $(this).find('p').html();
                    var value = $(this).find('input[type=checkbox]').val();

                    formoptiondata_checkbox.push({option:option,value:value});
                });

                formdata.push({datatype:data_type,label:label,name:name,placeholder:placeholder,required:required,value:formoptiondata_checkbox});

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

      var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
      var pageURL = $(location).attr("href");
      var id = pageURL.substring(pageURL.lastIndexOf('/') + 1);
    
    if (service_id != '' && title != '') 
    {
        $.ajax({
            type: "POST",
            url: '{{ URL::route("ConsultationFormUpdated") }}',
            dataType: 'text',
            data: {"_token": "{{ csrf_token() }}",id,obj_with_title},
            success: function(data) 
            {
                //console.log(data);
                window.location.href = "{{URL::to('consultation_form')}}";
            }
      });
    }      

  });
</script>
@endsection