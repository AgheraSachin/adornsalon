@extends('layouts.app')

@section('content')
<div id="main">
    <div class="row">
        <div class="breadcrumbs-inline pt-3 pb-1" id="breadcrumbs-wrapper">
            <!-- Search for small screen-->
            <div class="container">
                <div class="row">
                    <div class="col s10 m6 l6 breadcrumbs-left">
                        <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Appointment Listing</span></h5>
                        <ol class="breadcrumbs mb-0">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item active">Appointment Listing
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
                            <div class="card text-left">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col s12 md12" style="width: 40%;margin: auto 30%;">
                                        Appointment Date:
                                            <input type="date" name="date" id="date" value="<?php echo date('Y-m-d');?>">
                                            <input type="hidden" name="location" id="location" value="<?php echo session()->get('location_id'); ?>">
                                        </div>
                                    </div>
                                    <div class="bordered responsive-table">
                                        <table id="zero_configuration_table" class="display table bordered responsive-table" style="width:100%">
                                           <thead>
                                                <tr>
                                                    <th>Time</th>
                                                    <?php
                                                    $staff_id = '';
                                                    foreach ($staffs as $key => $value) {
                                                        $staff_id .= $value->tbl_staff_id.',';
                                                    ?>
                                                        <input type="hidden" name="staff_id" id="staff_id" value="<?php echo $value->tbl_staff_id;?>">
                                                        <th><?php echo $value->tbl_staff_first_name.' '.$value->tbl_staff_last_name;?></th>
                                                    <?php } ?>
                                                    <th>All</th>
                                                    <input type="hidden" name="staff_count" id="staff_count" value="<?php echo rtrim($staff_id,','); ?>">
                                                </tr>
                                            </thead>                                
                                            <tbody class="filter_data">
                                            </tbody>
                                        </table>
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
    $(document).ready(function() {
        var selected_date = $('#date').val();
        var location_id = $('#location').val();
        var t = 1; 
        var time = 0;
        var html = '';
        for(t=1;t<25;t++)
        {
            if(t>9)
            {
                time = t;
            }
            else
            {
                time = '0'+t;
            }
            html += '<tr><td>'+time+':00</td>';

            var staff_id = $('#staff_count').val();
            var split_id = staff_id.split(',');

            $.each(split_id,function(index,value) {
                html += '<td class="emp_'+value+'-'+time+'"></td>';
            });
            
            html += '<td class="emp_all-'+time+'"></td></tr>';
            //alert(html);
            $('.filter_data').html(html);
        }
         $.ajax({
                type: "POST",
                url: '{{ URL::route("ViewDeatils") }}',
                data: {"_token": "{{ csrf_token() }}","selected_date":selected_date,"location_id":location_id},
                success: function (alldata) {
                    //console.log(alldata);
                    var obj = JSON.parse(alldata);
                    console.log(obj);
                    var obj1 = obj['newdata'];
                    
                    //console.log(obj1);
                    if (obj1.length > 0) 
                    {
                        var i = 0;
                        $.each(obj1,function(index1,value1) {
                            var services_all = obj['services'][value1.tbl_appointment_id];
                            var services_name = '';
                            if(services_all[0] != null)
                            {
                                if (services_all.length > 1) 
                                {
                                    for (ser = 0; ser < services_all.length; ser++) 
                                    {
                                        services_name += services_all[ser]['tbl_services_name']+',';
                                    }
                                    var lastChar = services_name.slice(-1);
                                    if (lastChar == ',') {
                                        services_name = services_name.slice(0, -1);
                                    }
                                }
                                else
                                {
                                    services_name = services_all[0]['tbl_services_name'];
                                }
                            }

                            var group_services = [];
                            var group_data = obj['group_data'][value1.tbl_appointment_id];
                            var group_all_data = '';
                            /*console.log(group_data[0]);*/
                            var grp_in = 1;
                            $.each(group_data[0],function(i1,v1) 
                            {
                                // console.log(v1);
                                if (grp_in == 1) 
                                {
                                    var data_g = '<br><b style="font-size:15px;">Group Data: </b>';
                                }
                                else
                                {
                                    var data_g = '';
                                }
                                var group_name = data_g+'<br>'+grp_in+') <b>Name: </b>'+v1.tbl_group_appointment_name+'<br><b>Services:</b>';
                                /*console.log(group_name);*/
                                group_services[v1.tbl_group_appointment_id] = obj['group_services'][v1.tbl_group_appointment_id];

                                var grp_ser = 0;
                                var group_services_name = '';
                                $.each(group_services[v1.tbl_group_appointment_id],function(gi1,gv1) 
                                {
                                    group_services_name += gv1['tbl_services_name']+',';
                                    grp_ser++;
                                });
                                var lastChar_grp = group_services_name.slice(-1);
                                if (lastChar_grp == ',') {
                                    group_services_name = group_services_name.slice(0, -1);
                                }
                                group_all_data += group_name+group_services_name;
                                grp_in++;
                            });
                            //console.log(group_all_data);

                            var newhtml = '';
                            if (i % 2 === 0) 
                            {
                                newhtml += '<div class="gradient-45deg-yellow-green padding-2 medium-small" style="display:block;color:#000000;" ><b>'+value1.tbl_clients_first_name+' '+value1.tbl_clients_last_name+'</b> (CLNT00'+value1.tbl_clients_id+')<span style="float:right"></span><br> Contact: <b>'+value1.tbl_clients_mobile+'</b><br> Timing: <b>'+value1.tbl_appointment_start_time+'</b> - <b>'+value1.tbl_appointment_end_time+'</b><br><b>Service Name: </b>'+services_name+group_all_data+'</div><br>';
                            }
                            else
                            {
                                newhtml += '<div class="gradient-45deg-light-blue-indigo padding-2 medium-small" style="display:block;color:#000000;" ><b>'+value1.tbl_clients_first_name+' '+value1.tbl_clients_last_name+'</b> (CLNT00'+value1.tbl_clients_id+')<span style="float:right"></span><br> Contact: <b>'+value1.tbl_clients_mobile+'</b><br> Timing: <b>'+value1.tbl_appointment_start_time+'</b> - <b>'+value1.tbl_appointment_end_time+'</b><br><b>Service Name: </b>'+services_name+group_all_data+'</div><br>';
                            }
                            var time_split = value1.tbl_appointment_start_time.split(':');
                            if (value1.tbl_staff_id == null) 
                            {
                                $('.emp_all-'+time_split[0]+'').append(newhtml);
                            }
                            else
                            {
                                $('.emp_'+value1.tbl_staff_id+'-'+time_split[0]+'').append(newhtml);
                            }
                            i++;
                        });
                    }
                }
           });
    });

</script>

<script type="text/javascript">
    $('#date').change(function() {
        var selected_date = $(this).val();
        var location_id = $('#location').val();
        var t = 1; 
        var time = 0;
        var html = '';
        for(t=1;t<25;t++)
        {
            if(t>9)
            {
                time = t;
            }
            else
            {
                time = '0'+t;
            }
            html += '<tr><td>'+time+':00</td>';

            var staff_id = $('#staff_count').val();
            var split_id = staff_id.split(',');

            $.each(split_id,function(index,value) {
                html += '<td class="emp_'+value+'-'+time+'"></td>';
            });
            
            html += '<td class="emp_all-'+time+'"></td></tr>';
            //alert(html);
            $('.filter_data').html(html);
        }
         $.ajax({
                type: "POST",
                url: '{{ URL::route("ViewDeatils") }}',
                data: {"_token": "{{ csrf_token() }}","selected_date":selected_date,"location_id":location_id},
                success: function (alldata) {
                    //console.log(alldata);
                    var obj = JSON.parse(alldata);
                    var obj1 = obj['newdata'];
                    
                    //console.log(obj1);
                    if (obj1.length > 0) 
                    {
                        var i = 0;
                        $.each(obj1,function(index1,value1) {
                            var services_all = obj['services'][value1.tbl_appointment_id];
                            var services_name = '';
                            if(services_all[0] != null)
                            {
                                if (services_all.length > 1) 
                                {
                                    for (ser = 0; ser < services_all.length; ser++) 
                                    {
                                        services_name += services_all[ser]['tbl_services_name']+',';
                                    }
                                    var lastChar = services_name.slice(-1);
                                    if (lastChar == ',') {
                                        services_name = services_name.slice(0, -1);
                                    }
                                }
                                else
                                {
                                    services_name = services_all[0]['tbl_services_name'];
                                }
                            }
                            var group_services = [];
                            var group_data = obj['group_data'][value1.tbl_appointment_id];
                            var group_all_data = '';
                            /*console.log(group_data[0]);*/
                            var grp_in = 1;
                            $.each(group_data[0],function(i1,v1) 
                            {
                                // console.log(v1);
                                if (grp_in == 1) 
                                {
                                    var data_g = '<br><b style="font-size:15px;">Group Data: </b>';
                                }
                                else
                                {
                                    var data_g = '';
                                }
                                var group_name = data_g+'<br>'+grp_in+') <b>Name: </b>'+v1.tbl_group_appointment_name+'<br><b>Services:</b>';
                                /*console.log(group_name);*/
                                group_services[v1.tbl_group_appointment_id] = obj['group_services'][v1.tbl_group_appointment_id];

                                var grp_ser = 0;
                                var group_services_name = '';
                                $.each(group_services[v1.tbl_group_appointment_id],function(gi1,gv1) 
                                {
                                    group_services_name += gv1['tbl_services_name']+',';
                                    grp_ser++;
                                });
                                var lastChar_grp = group_services_name.slice(-1);
                                if (lastChar_grp == ',') {
                                    group_services_name = group_services_name.slice(0, -1);
                                }
                                group_all_data += group_name+group_services_name;
                                grp_in++;
                            });
                            //console.log(value1);
                            var newhtml = '';
                            if (i % 2 === 0) 
                            {
                                newhtml += '<div class="gradient-45deg-yellow-green padding-2 medium-small" style="display:block;color:#000000;" ><b>'+value1.tbl_clients_first_name+' '+value1.tbl_clients_last_name+'</b> (CLNT00'+value1.tbl_clients_id+')<span style="float:right"></span><br> Contact: <b>'+value1.tbl_clients_mobile+'</b><br> Timing: <b>'+value1.tbl_appointment_start_time+'</b> - <b>'+value1.tbl_appointment_end_time+'</b><br><b>Service Name:</b>'+services_name+group_all_data+'</div><br>';
                            }
                            else
                            {
                                newhtml += '<div class="gradient-45deg-light-blue-indigo padding-2 medium-small" style="display:block;color:#000000;" ><b>'+value1.tbl_clients_first_name+' '+value1.tbl_clients_last_name+'</b> (CLNT00'+value1.tbl_clients_id+')<span style="float:right"></span><br> Contact: <b>'+value1.tbl_clients_mobile+'</b><br> Timing: <b>'+value1.tbl_appointment_start_time+'</b> - <b>'+value1.tbl_appointment_end_time+'</b><br><b>Service Name:</b>'+services_name+group_all_data+'</div><br>';
                            }
                            var time_split = value1.tbl_appointment_start_time.split(':');
                            if (value1.tbl_staff_id == null) 
                            {
                                $('.emp_all-'+time_split[0]+'').append(newhtml);
                            }
                            else
                            {
                                $('.emp_'+value1.tbl_staff_id+'-'+time_split[0]+'').append(newhtml);
                            }
                            i++;
                        });
                    }
                }
           });
    });
</script>

@endsection