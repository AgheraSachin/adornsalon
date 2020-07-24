@extends('layouts.app')

@section('content')
<!-- BEGIN: Page Main-->
    <?php
    $permission_data = DB::table('tbl_role_rights')->where('tbl_role_rights_role_id',session()->get('role_id'))->where('tbl_role_rights_page_name','RoleRightsController')->select('tbl_role_rights_add','tbl_role_rights_edit','tbl_role_rights_delete')->first();
    ?>
    <div id="main">
        <div class="row">
            <div class="breadcrumbs-inline pt-3 pb-1" id="breadcrumbs-wrapper">
                <!-- Search for small screen-->
                <div class="container">
                    <div class="row">
                        <div class="col s10 m6 l6 breadcrumbs-left">
                            <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Role Rights</span></h5>
                            <ol class="breadcrumbs mb-0">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                                </li>
                                <li class="breadcrumb-item active">Role Rights
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
                                        @if (Session::has('message'))
							                @if(Session::get('alert-type') == 'danger')
							                <div class="card-alert card gradient-45deg-red-pink">
							                    <div class="card-content white-text">
							                        <p>
							                            <i class="material-icons">error</i>{{ Session::get('message') }}</p>
							                    </div>
							                    <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
							                        <span aria-hidden="true">×</span>
							                    </button>
							                </div>
							                @else
							                <div class="card-alert card gradient-45deg-green-teal">
							                    <div class="card-content white-text">
							                        <p>
							                            <i class="material-icons">check</i>{{ Session::get('message') }}</p>
							                    </div>
							                    <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
							                        <span aria-hidden="true">×</span>
							                    </button>
							                </div>
							                @endif
							            @endif
                                        <div class="row">
                                            <form method="post" action="{{ route('RoleRightsStore') }}">
                                                @csrf
                                                <div class="col s12">
                                                    <div class="col s12">
                                                        <select id="role_type" name="role_type" class="validate" required="">
                                                            <option value="">Select Role Type</option>
                                                            <?php
                                                            foreach ($roles as $key => $role) { ?>
                                                                <option value="{{$role->tbl_roles_id}}">{{$role->tbl_roles_types}}</option>
                                                            <?php }
                                                            ?>
                                                        </select>
                                                    </div> 

                                                    <div class="col s12">
                                                        <div class="col-md-4 form-group mb-3 centerdt">
                                                            check all
                                                            <div class="checked" aria-checked="false" aria-disabled="false" style="position: relative;">
                                                                <label>
                                                                    <input type="checkbox" name="checkall" id="checkall">
                                                                    <span></span>
                                                                </label>
                                                            </div>
                                                        </div> 
                                                    </div>

                                                    <table class="bordered table">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col" rowspan="2">Module Name</th>
                                                                <th scope="col" colspan="4">Permissions</th>
                                                            </tr>
                                                            <tr>
                                                                <th class="text-center">View</th>
                                                                <th class="text-center">Add</th>
                                                                <th class="text-center">Edit</th>
                                                                <th class="text-center">Delete</th>
                                                            </tr>        
                                                        </thead>
                                                        <tbody>
                                                            <?php
                                                                $rightsaccess = array('AdminController' => 'Admin Master','RoleRightsController' => 'Role Rights','RoleController' => 'Role Master','ServiceTypesController' => 'Service Type Master','ServiceController' => 'Service','ServicePackageController' => 'Service Package','ClientController' => 'Client Master','StaffController' => 'Staff Master','AppointmentController' => 'Appointment','LocationController' => 'Location Master');
                                                                foreach ($rightsaccess as $key => $value) {
                                                                ?>
                                                                    <tr>
                                                                        <td>
                                                                            <?php echo $value;?>
                                                                            <input type="hidden" class="controller" name="controller[<?php echo $key; ?>]" id="controller" value="Rights">
                                                                        </td>
                                                                        <td class="text-center">
                                                                              <label>
                                                                                <input type="checkbox" value="1" class="checkbox" name="<?php echo $key; ?>[index]" id="index"/>
                                                                                <span></span>
                                                                              </label>
                                                                        </td>
                                                                        <td class="text-center">
                                                                            <label>
                                                                                <input type="checkbox" value="1" class="checkbox" name="<?php echo $key; ?>[add]" id="add">
                                                                                <span></span>
                                                                            </label>
                                                                        </td>
                                                                        <td class="text-center">
                                                                            <label>
                                                                                <input type="checkbox" value="1" class="checkbox" name="<?php echo $key; ?>[edit]" id="edit">
                                                                                <span></span>
                                                                            </label>
                                                                        </td>
                                                                        <td class="text-center">
                                                                            <label>
                                                                                <input type="checkbox" value="1" class="checkbox" name="<?php echo $key; ?>[delete]" id="delete">
                                                                                <span></span>
                                                                            </label>
                                                                        </td>                
                                                                    </tr>
                                                                <?php
                                                                }
                                                                ?>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <?php
                                                if (!empty($permission_data)) 
                                                {
                                                    if ($permission_data->tbl_role_rights_edit != 0 || $permission_data->tbl_role_rights_edit != 0 || $permission_data->tbl_role_rights_delete != 0)

                                                    { ?>
                                                    <div class="col s4 margin_top_20">
                                                        <button type="submit" class="mb-6 btn waves-effect waves-light gradient-45deg-purple-deep-orange gradient-shadow">Submit</button>
                                                    </div>
                                                    <?php }
                                                }
                                                else
                                                { ?>
                                                    <div class="col s4 margin_top_20">
                                                        <button type="submit" class="mb-6 btn waves-effect waves-light gradient-45deg-purple-deep-orange gradient-shadow">Submit</button>
                                                    </div>
                                                <?php }
                                                ?>
                                            </form>
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
    $(document).ready(function() {

        $('.checkbox').change(function() {
            if ($(this).prop('checked')==true)
            {
                $(this).val(1);
            }
            else
            {
                $(this).val(0);
            }
        });

        /*$("input[name='AdminController[index]']").change(function(){
            if ($(this).val() == '1') 
            {
                $('input[name="AdminController[add]"]').prop("checked", true).trigger("change");
                $('input[name="AdminController[edit]"]').prop("checked", true).trigger("change");
                $('input[name="AdminController[delete]"]').prop("checked", true).trigger("change");
            }
            else
            {
                $('input[name="AdminController[add]"]').prop("checked", false).trigger("change");
                $('input[name="AdminController[edit]"]').prop("checked", false).trigger("change");
                $('input[name="AdminController[delete]"]').prop("checked", false).trigger("change"); 
            }
        });

        $("input[name='RoleRightsController[index]']").change(function(){
            if ($(this).val() == '1') 
            {
                $('input[name="RoleRightsController[add]"]').prop("checked", true).trigger("change");
                $('input[name="RoleRightsController[edit]"]').prop("checked", true).trigger("change");
                $('input[name="RoleRightsController[delete]"]').prop("checked", true).trigger("change");
            }
            else
            {
                $('input[name="RoleRightsController[add]"]').prop("checked", false).trigger("change");
                $('input[name="RoleRightsController[edit]"]').prop("checked", false).trigger("change");
                $('input[name="RoleRightsController[delete]"]').prop("checked", false).trigger("change"); 
            }
        });

        $("input[name='RoleController[index]']").change(function(){
            if ($(this).val() == '1') 
            {
                $('input[name="RoleController[add]"]').prop("checked", true).trigger("change");
                $('input[name="RoleController[edit]"]').prop("checked", true).trigger("change");
                $('input[name="RoleController[delete]"]').prop("checked", true).trigger("change");
            }
            else
            {
                $('input[name="RoleController[add]"]').prop("checked", false).trigger("change");
                $('input[name="RoleController[edit]"]').prop("checked", false).trigger("change");
                $('input[name="RoleController[delete]"]').prop("checked", false).trigger("change"); 
            }
        });*/

    });
    var clubed = '';
    $('#checkall').click(function(){
        if($(this). prop("checked") == true){
             $(".table .checkbox").prop("checked",true);  
             $(".table .checkbox").val(1);
        }
        else
        {
            $(this).prop("checked",false);
            $(".table .checkbox").prop("checked",false);
            $(".table .checkbox").val(0);
        }
    });

    $('#role_type').change(function() {

        var role_id = $(this).val();
        jQuery.ajax({
            type: "POST",
            url: "{{ route('RoleRightsRoleData') }}",
            dataType: 'text',
            data: {"_token": "{{ csrf_token() }}",role_id:role_id},
            success: function(res) 
            {
                var obj = jQuery.parseJSON(res);
                //console.log(obj);
                //alert(res.length)
                if(res.length != 15)
                {
                    var editnewdt = obj.editdata;
                    var jsdataedit = JSON.stringify(editnewdt);
                    //console.log(jsdataedit);

                    $.each(editnewdt, function(k, v) {
                        if(v.tbl_role_rights_add == 1)
                        {
                            $('input[name="'+v.tbl_role_rights_page_name+'[add]"]').prop("checked", true).trigger("change");
                        }
                        if(v.tbl_role_rights_edit == 1)
                        {
                            $('input[name="'+v.tbl_role_rights_page_name+'[edit]"]').prop("checked", true).trigger("change");
                        }
                        if(v.tbl_role_rights_delete == 1)
                        {
                            $('input[name="'+v.tbl_role_rights_page_name+'[delete]"]').prop("checked", true).trigger("change");
                        }
                        if(v.tbl_role_rights_index == 1)
                        {
                            $('input[name="'+v.tbl_role_rights_page_name+'[index]"]').prop("checked", true).trigger("change");
                        }
                    });
                    //$("#infoMessages").hide();
                }
                else
                {  
                     $(".table .checkbox").prop("checked",false);
                }
                    
            }
        });
    });
</script>
@endsection