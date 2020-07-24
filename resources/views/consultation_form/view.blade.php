@extends('layouts.app')

@section('content')
<!-- BEGIN: Page Main-->
    <div id="main">
        <div class="row">
            <div class="breadcrumbs-inline pt-3 pb-1" id="breadcrumbs-wrapper">
                <!-- Search for small screen-->
                <div class="container">
                    <div class="row">
                        <div class="col s10 m6 l6 breadcrumbs-left">
                            <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Consultation Form View</span></h5>
                            <ol class="breadcrumbs mb-0">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                                </li>
                                <li class="breadcrumb-item"><a href="{{ route('ConsultationForm') }}">Consultation Form</a>
                                </li>
                                <li class="breadcrumb-item active">View
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
                                <div class="card">
                                    <div class="card-content">
                                        <div class="card-title">
                                            <div class="row">
                                                <div class="col s12 m6 l10">
                                                    <h4 class="card-title">View Consultation Form</h4>
                                                </div>
                                                <div class="col s12">
                                                    <a href="javascript:history.back()" class="mb-6 btn waves-effect waves-light gradient-45deg-purple-deep-orange gradient-shadow  pull-right">Back</a>
                                                    <a href="javascript::void(0)" id="btnExport" class="btnExport mb-6 btn waves-effect waves-light gradient-45deg-purple-deep-orange gradient-shadow  pull-right" style="margin-right: 20px;">Export PDF</a>
                                                    <!-- <input type="button" id="btnExport" value="Export PDF" class="btn btn-info mt-2 btnExport" style="margin-right: 20px;" /> -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form_builder" style="margin-top: 25px">
                                            <div class="row">
                                                <div class="col m4 bal_builder">
                                                    <div class="form_builder_area"></div>
                                                </div>
                                                <div class="col m4">
                                                    <div class="col m12">
                                                        <div class="export_pdf">
                                                            <div class="preview"></div> 
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col m4"></div>
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
    <!-- END: Page Main-->
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
                pdfMake.createPdf(docDefinition).download("Form.pdf");
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
              var data = JSON.parse(obj.tbl_consultation_form_data);
              //console.log(data);
              //console.log(data[0].datatype);
                var plain_html='';
                var field = Math.floor(Math.random() * (100000 - 1 + 1) + 57);
                var opt1 = Math.floor(Math.random() * (100000 - 1 + 1) + 57);
                var html = '';
                var form_html='';
               // var value = '';

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
                        
                        if (data.required == 'required') {
                            required = 'required';
                        }
                        html += '<div class="form-group"><label class="control-label">' + label + '</label><input type="number" name="' + name + '" placeholder="' + placeholder + '" class="form-control" ' + required + '/></div>';
                    }
                    if (data_type === 'email') {
                        var placeholder = data.placeholder;
                        var required = '';
                        //value = $(this).val();
                        if (data.required == 'required') {
                            required = 'checked';
                        }
                        
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
                                only_val = '<i class="margin-top-5 margin-left-5 fa fa-times-circle default_red fa-2x remove_more_select" data-field="' + field + '"></i>';
                            }
                            sel_opt_data += '<div data-field="' + field + '" class="row select_row_' + field + '" data-opt="' + opt1 + '"><div class="col-md-4"><div class="form-group"><input type="text" value="'+options+'" class="s_opt form-control"/></div></div><div class="col-md-4"><div class="form-group"><input type="text" value="'+values+'" class="s_val form-control"/></div></div><div class="col-md-4"><i class="margin-top-5 fa fa-plus-circle fa-2x default_blue add_more_select" data-field="' + field + '"></i>'+only_val+'</div></div>';

                        });

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
                                
                            new_otp += '<label class="mt-radio mt-radio-outline"><input data-opt="' + opt1 + '" type="radio" name="radio_' + field + '" value="Value"><p class="r_opt_name_' + opt1 + '">'+options+'</p><span></span></label>';

                            option_html += '<div class="form-check"><label class="form-check-label"><input type="radio" class="form-check-input" name="' + name + '" value="' + values + '"><span>' + options + '</span></label></div>';
                            
                            if(index > 0) {
                                only_val = '<i class="margin-top-5 margin-left-5 fa fa-times-circle default_red fa-2x remove_more_select" data-field="' + field + '"></i>';
                            }
                            
                            sel_opt_data += '<div data-field="' + field + '" class="row select_row_' + field + '" data-opt="' + opt1 + '"><div class="col-md-4"><div class="form-group"><input type="text" value="'+options+'" class="s_opt form-control"/></div></div><div class="col-md-4"><div class="form-group"><input type="text" value="'+values+'" class="s_val form-control"/></div></div><div class="col-md-4"><i class="margin-top-5 fa fa-plus-circle fa-2x default_blue add_more_select" data-field="' + field + '"></i>'+only_val+'</div></div>';
                        });

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

                            new_otp += '<label class="mt-checkbox mt-checkbox-outline"><input data-opt="' + opt1 + '" type="checkbox" name="checkbox_' + field + '" value="Value"><p class="c_opt_name_' + opt1 + '"><span>'+options+'</span></p><span></span></label>';

                            if(index > 0) {
                                only_val = '<i class="margin-top-5 margin-left-5 fa fa-times-circle default_red fa-2x remove_more_select" data-field="' + field + '"></i>';
                            }
                            
                            sel_opt_data += '<div data-field="' + field + '" class="row select_row_' + field + '" data-opt="' + opt1 + '"><div class="col-md-4"><div class="form-group"><input type="text" value="'+options+'" class="s_opt form-control"/></div></div><div class="col-md-4"><div class="form-group"><input type="text" value="'+values+'" class="s_val form-control"/></div></div><div class="col-md-4"><i class="margin-top-5 fa fa-plus-circle fa-2x default_blue add_more_select" data-field="' + field + '"></i>'+only_val+'</div></div>';
                        });

                        html += '<div class="form-group"><label class="control-label">' + label + '</label>' + option_html + '</div>';
                    }
                });

                if (plain_html === 'html') {
                    $('.preview').hide();
                    $('.plain_html').show().find('textarea').val(html);
                } else {
                    $('.plain_html').hide();
                    //$('.preview').addClass('li_' + field + ' form_builder_field').html(html).show();
                    $('.preview').html(html).show();
                    //$('.form_builder_area').html(form_html);
                }
            }

      });
        
    });
</script>
@endsection