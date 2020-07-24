@extends('layouts.app')

@section('content')
    <div id="main">
        <div class="row">
            <div class="breadcrumbs-inline pt-3 pb-1" id="breadcrumbs-wrapper">
                <!-- Search for small screen-->
                <div class="container">
                    <div class="row">
                        <div class="col s10 m6 l6 breadcrumbs-left">
                            <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Appointments</span>
                            </h5>
                            <ol class="breadcrumbs mb-0">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                                </li>
                                <li class="breadcrumb-item active">Appointments
                                </li>
                                <button data-target="add_event" class="btn modal-trigger" id="add"
                                        style="display: none;"></button>
                                <button data-target="edit_event" class="btn modal-trigger" id="edit"
                                        style="display: none;"></button>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col s12">
                <div class="container">
                    <!-- Full Calendar -->
                    <div id="app-calendar">
                        <div class="row">
                            <div class="col s12">
                                <div class="card">
                                    <div class="card-content">
                                        <input type="hidden" name="location" id="location"
                                               value="<?php echo session()->get('location_id'); ?>">
                                        @if (Session::has('message'))
                                            @if(Session::get('alert-type') == 'danger')
                                                <div class="card-alert card gradient-45deg-red-pink">
                                                    <div class="card-content white-text">
                                                        <p>
                                                            <i class="material-icons">error</i>{{ Session::get('message') }}
                                                        </p>
                                                    </div>
                                                    <button type="button" class="close white-text" data-dismiss="alert"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">×</span>
                                                    </button>
                                                </div>
                                            @else
                                                <div class="card-alert card gradient-45deg-green-teal">
                                                    <div class="card-content white-text">
                                                        <p>
                                                            <i class="material-icons">check</i>{{ Session::get('message') }}
                                                        </p>
                                                    </div>
                                                    <button type="button" class="close white-text" data-dismiss="alert"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">×</span>
                                                    </button>
                                                </div>
                                            @endif
                                        @endif
                                        <div id="calendar"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- START RIGHT SIDEBAR NAV -->
                </div>
                <div class="content-overlay"></div>

                <div class="modal fade AddApp" id="add_event" tabindex="-1" role="dialog"
                     aria-labelledby="Appointment Add" aria-hidden="true">
                    <div class="modal-dialog  modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Add Appointment</h5>
                            </div>
                            <form method="POST" action="{{ route('CalendarCreate') }}">
                                <div class="modal-body">
                                    @csrf

                                    <div id="showtime"></div>
                                    <div id="error"></div>

                                    <div class="form-group">
                                        <div class="row">

                                            <div class="col s4">
                                                <label for="date">Date:</label>
                                                <input type="date" id="date" name="date"
                                                       value="<?php echo date('Y-m-d');?>">
                                            </div>

                                            <div class="input-field col s4" style="padding: 0 35px 0 0;">

                                                <!-- <input type="text"  id="client" name="client"> -->
                                                <select id="client" name="client"
                                                        class="validate select2 browser-default">
                                                    <option value="" disabled selected>Choose your option</option>
                                                    <?php
                                                    foreach ($client as $key => $value) { ?>
                                                    <option value="<?php echo $value->tbl_clients_id; ?>"><?php echo $value->tbl_clients_first_name . ' ' . $value->tbl_clients_last_name . '-' . $value->tbl_clients_mobile; ?></option>
                                                    <?php } ?>
                                                </select>
                                                <label for="client">Client:</label>
                                                <a class="mb-6 btn-floating waves-effect waves-light cyan add_new"
                                                   style="position: absolute;margin-left: 10px;margin-top: 10px;height: 30px;width: 33px;">
                                                    <i class="material-icons"
                                                       style="font-size: 1.6rem;line-height: 30px;">add</i>
                                                </a>
                                            </div>

                                            <div class="col s4 input-field dis_none">
                                                <label for="cname">Client Name:</label>
                                                <input type="text" name="cname" id="cname">
                                            </div>

                                            <div class="col s4 input-field dis_none">
                                                <select id="country_code" class="validate select2 browser-default"
                                                        name="country_code">
                                                    <option value="">Choose your option</option>
                                                    <?php
                                                    foreach ($country_codes as $key => $value) { ?>
                                                    <option value="<?php echo $value->tbl_country_code_isd_code;?>"><?php echo $value->tbl_country_code_iso_code . '-' . $value->tbl_country_code_isd_code;?></option>
                                                    <?php } ?>
                                                </select>
                                                <label for="country_code">{{ __('Country Code') }}</label>
                                            </div>

                                            <div class="col s4 input-field dis_none">
                                                <label for="cphone">Client's Contact Number:</label>
                                                <input type="number" name="cphone" id="cphone" minlength="10"
                                                       maxlength="11">
                                            </div>

                                            <div class="col s4 input-field dis_none">
                                                <label for="email">Client Email:</label>
                                                <input type="text" name="email" id="email">
                                            </div>

                                            <div class="col s4 input-field dis_none">
                                                <select id="gender"
                                                        class="validate @error('gender') is-invalid @enderror"
                                                        name="gender">
                                                    <option value="" disabled selected>Choose your option</option>
                                                    <option value="M">Male</option>
                                                    <option value="F">Female</option>
                                                </select>
                                                <label for="gender">ClientGender:</label>
                                            </div>

                                            <div class="col s4 input-field">
                                                <select id="staff" name="staff" class="select2 browser-default"
                                                        required="">
                                                    <option value="" disabled selected>Choose your option</option>
                                                    <?php
                                                    foreach ($staff as $key => $value) { ?>
                                                    <option value="<?php echo $value->tbl_staff_id; ?>"><?php echo $value->tbl_staff_first_name . ' ' . $value->tbl_staff_last_name; ?></option>
                                                    <?php } ?>
                                                </select>
                                                <label for="staff">Staff:<span class="required"> *</span></label>
                                            </div>

                                            <div class="col s4 input-field">
                                                <label for="noofperson">No of Person:<span
                                                            class="required"> *</span></label>
                                                <input type="number" name="noofperson" id="noofperson" placeholder=""
                                                       required="" value="1" min="1">
                                            </div>

                                            <div class="col s4 input-field ">
                                                <label for="start_time">Start Time:</label>
                                                <input type="time" name="start_time" id="start_time"
                                                       placeholder="00:00">
                                            </div>
                                            <div class="col s4 input-field ">
                                                <label for="end_time">End Time:</label>
                                                <input type="time" name="end_time" id="end_time" placeholder="00:00">
                                            </div>


                                            <div class="col s12 input-field">
                                                <select id="service_add" name="service[]" multiple=""
                                                        style="width: 100%;" class="select2 browser-default" required=""
                                                        onchange="checkLink()">
                                                    <option value="" disabled>Choose your services</option>
                                                </select>
                                                <label for="service">Services:<span class="required"> *</span></label>
                                            </div>

                                            <div class="col s4 input-field" style="display: none;">
                                                <label for="total_amount">Total Amount of services:</label>
                                                <input type="number" name="total_amount" id="total_amount"
                                                       placeholder="" step="any">
                                            </div>

                                            <div class="col s12 input-field ">
                                                <label for="comments">Comments:</label>
                                                <textarea class="materialize-textarea" id="comments"
                                                          name="comments"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <p>Grand Total: £<b id="grand_total"></b></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal" id="close_add">
                                        Close
                                    </button>
                                    <button type="submit" class="btn waves-effect waves-light green darken-1"
                                            id="add_app">
                                        {{ __('Submit') }}
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="modal fade EditApp" id="edit_event">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Edit Appointment</h5>
                            </div>
                            <form method="POST" action="{{ route('CalendarUpdate') }}">
                                @csrf
                                <div class="modal-body">
                                    <input type="hidden" name="app_id" id="app_id">

                                    <div id="showtime_edit"></div>
                                    <div id="error" style="font-size: 15px;"></div>

                                    <div class="form-group">
                                        <div class="row">

                                            <div class="col s4">
                                                <label for="date">Date:</label>
                                                <input type="date" id="date_edit" name="date" value="">
                                            </div>

                                            <div class="col s4 input-field" style="padding: 0 35px 0 0;">
                                                <!--  <input type="text"  id="client" name="client"> -->
                                                <select id="client_edit" name="client" class="select2 browser-default">
                                                    <option value="">Select Client</option>
                                                    <?php
                                                    foreach ($client as $key => $value) { ?>
                                                    <option value="<?php echo $value->tbl_clients_id; ?>"><?php echo $value->tbl_clients_first_name . ' ' . $value->tbl_clients_last_name . '-' . $value->tbl_clients_mobile; ?></option>
                                                    <?php } ?>
                                                </select>
                                                <label for="client">Client:</label>
                                                <a class="mb-6 btn-floating waves-effect waves-light cyan add_new"
                                                   style="position: absolute;margin-left: 10px;margin-top: 10px;height: 30px;width: 33px;">
                                                    <i class="material-icons"
                                                       style="font-size: 1.6rem;line-height: 30px;">add</i>
                                                </a>
                                            </div>

                                            <div class="col s4 input-field dis_none">
                                                <label for="cname">Client Name:</label>
                                                <input type="text" name="cname" id="cname_edit">
                                            </div>

                                            <div class="col s4 input-field dis_none">
                                                <select id="country_code_edit" class="validate select2 browser-default"
                                                        name="country_code">
                                                    <option value="">Choose your option</option>
                                                    <?php
                                                    foreach ($country_codes as $key => $value) { ?>
                                                    <option value="<?php echo $value->tbl_country_code_isd_code;?>"><?php echo $value->tbl_country_code_iso_code . '-' . $value->tbl_country_code_isd_code;?></option>
                                                    <?php } ?>
                                                </select>
                                                <label for="country_code">{{ __('Country Code') }}</label>
                                            </div>

                                            <div class="col s4 input-field dis_none">
                                                <label for="cphone">Client's Contact Number:</label>
                                                <input type="text" name="cphone" id="cphone_edit">
                                            </div>

                                            <div class="col s4 input-field dis_none">
                                                <label for="email">Client Email:</label>
                                                <input type="text" name="email" id="email_edit">
                                            </div>

                                            <div class="col s4 input-field dis_none">
                                                <select id="gender_edit"
                                                        class="validate @error('gender') is-invalid @enderror"
                                                        name="gender">
                                                    <option value="" disabled selected>Choose your option</option>
                                                    <option value="M">Male</option>
                                                    <option value="F">Female</option>
                                                </select>
                                                <label for="gender">Client Gender:</label>
                                            </div>

                                            <div class="col s4 input-field">
                                                <select id="staff_edit" name="staff" class="select2 browser-default"
                                                        required="">
                                                    <option value="">Select Staff</option>
                                                    <?php
                                                    foreach ($staff as $key => $value) { ?>
                                                    <option value="<?php echo $value->tbl_staff_id; ?>"><?php echo $value->tbl_staff_first_name . ' ' . $value->tbl_staff_last_name; ?></option>
                                                    <?php } ?>
                                                </select>
                                                <label for="staff">Staff:<span class="required"> *</span></label>
                                            </div>

                                            <div class="col s4 input-field">
                                                <label for="noofperson">No of Person:<span
                                                            class="required"> *</span></label>
                                                <input type="number" name="noofperson" id="noofperson_edit"
                                                       placeholder="" required="" min="1">
                                            </div>

                                            <div class="col s4 input-field">
                                                <label for="start_time">Start Time:</label>
                                                <input type="time" name="start_time" id="start_time_edit"
                                                       placeholder="00:00">
                                            </div>

                                            <div class="col s4 input-field">
                                                <label for="end_time">End Time:</label>
                                                <input type="time" name="end_time" id="end_time_edit"
                                                       placeholder="00:00">
                                            </div>

                                            <div class="col s12 input-field">
                                                <select id="services_edit" name="service[]"
                                                        class="form-control select2 browser-default"
                                                        style="width: 100%;" multiple="" required="">
                                                </select>
                                                <label for="service">Services:<span class="required"> *</span></label>
                                            </div>

                                            <div class="col s4 input-field" style="display: none;">
                                                <label for="total_amount">Total Amount of services:</label>
                                                <input type="number" name="total_amount" id="total_amount_edit"
                                                       placeholder="" step="any">
                                            </div>

                                            <div class="col s12 input-field">
                                                <label for="comments">Comments:</label>
                                                <textarea class="materialize-textarea" id="comments_edit"
                                                          name="comments"
                                                          placeholder="please do comment if any..."></textarea>
                                            </div>

                                        </div>
                                    </div>
                                    <p>Grand Total: £<b id="grand_total_edit"></b></p>
                                </div>
                                <div class="modal-footer">
                                    <div class="col s12">
                                        <div class="row" style="float: right;">
                                            <div class="col s4">
                                                <button type="submit"
                                                        class="btn waves-effect waves-light green darken-1"
                                                        id="edit_app">
                                                    {{ __('Update') }}
                                                </button>
                            </form>
                        </div>
                        <div class="col s4">
                            <form method="POST" action="{{ route('CalendarDelete') }}">
                                @csrf
                                <input type="hidden" name="app_id" id="app_id">
                                <button type="submit" class="btn waves-effect waves-light red accent-2"
                                        onclick="return confirm('Are you sure you want to delete this Data?')">
                                    {{ __('Delete') }}
                                </button>
                            </form>
                        </div>
                        <div class="col s4">
                            <button type="button" class="btn btn-default" data-dismiss="modal" id="close_edit">Close
                            </button>
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

@endsection

@section('content-script')


    <!-- Start of Add Appoitnment -->
    <script type="text/javascript">
        $('.AddApp #staff').change(function () {
            var staff_id = $(this).val();
            var date = $('#date').val();
            //alert(date);
            $.ajax({
                type: "POST",
                url: '{{ URL::route("SelectServices") }}',
                data: {"_token": "{{ csrf_token() }}", staff_id: staff_id, date: date},
                success: function (response) {
                    //console.log(response);
                    var obj = JSON.parse(response);
                    //console.log(obj);
                    var html = '<option value="" disabled>Choose your services</option>';
                    $.each(obj[0], function (index, value) {
                        //console.log(index);
                        var group = $('<optgroup />').attr('label', '#' + index).appendTo('.AddApp #service_add');

                        $.each(value, function (i, services) {
                            $('<option value="' + services.tbl_services_id + '" />').html(services.tbl_services_name).appendTo(group);
                        })
                        //html += '<option value="'+value.tbl_services_id+'">'+value.tbl_services_name+'</option>';
                    });
                    //alert(html);
                    //$('.AddApp #service_add').html('').trigger('change');
                    //$('.AddApp #service_add').html(html);
                    $('.AddApp #showtime').html(obj[1][0]);

                    $('.AddApp #start_time').val(obj[1][1]);
                    $('.AddApp #end_time').val(obj[1][2]);
                }
            });

        });
    </script>
    <script type="text/javascript">
        $('.AddApp #service_add').change(function () {
            var service_id = $(this).val();
            var starttime = $('.AddApp #start_time').val();
            var staff_id = $('.AddApp #staff').val();
            var endtime = $('.AddApp #end_time').val();
            var date = $('.AddApp #date').val();
            var app_id = '';
            $.ajax({
                type: "POST",
                url: '{{ URL::route("SelectServiceByID") }}',
                data: {
                    "_token": "{{ csrf_token() }}",
                    service_id: service_id,
                    starttime: starttime,
                    staff_id: staff_id,
                    date: date,
                    endtime: endtime,
                    app_id: app_id
                },
                success: function (response) {
                    //console.log(response);
                    var obj = JSON.parse(response);
                    //console.log(obj);

                    if (obj['count_app'] != 0) {
                        $('.AddApp #error').html('<div class="card-alert card gradient-45deg-red-pink"> <div class="card-content white-text"> <p> <i class="material-icons">error</i>Please Select Another time slot..This slot is already Occupied!!</p> </div></div>');
                        $('#add_app').attr('disabled', true);
                    } else {
                        $('.AddApp #error').html('');
                        $('#add_app').attr('disabled', false);
                    }
                    var endtime = obj['endtime'].replace(/\"/g, "");
                    $('.AddApp #end_time').val(endtime);
                    $('.AddApp #total_amount').val(obj['total_amount']);

                    var people = $('.AddApp #noofperson').val();
                    var total = $('.AddApp #total_amount').val();
                    var grand_total = people * total;
                    $('.AddApp #grand_total').html(grand_total).toString(2);
                }
            });
        });
    </script>
    <script type="text/javascript">
        $('.AddApp #start_time').change(function () {
            var service_id = $('.AddApp #service_add').val();
            var staff_id = $('#staff').val();
            var starttime = $(this).val();
            var endtime = $('#end_time').val();
            var date = $('#date').val();
            var app_id = '';
            //alert(staff_id);
            $.ajax({
                type: "POST",
                url: '{{ URL::route("SelectServiceByID") }}',
                data: {
                    "_token": "{{ csrf_token() }}",
                    service_id: service_id,
                    starttime: starttime,
                    staff_id: staff_id,
                    date: date,
                    endtime: endtime,
                    app_id: app_id
                },
                success: function (response) {
                    //console.log(response);
                    var obj = JSON.parse(response);
                    if (obj['count_app'] != 0) {
                        $('.AddApp #error').html('<div class="card-alert card gradient-45deg-red-pink"> <div class="card-content white-text"> <p> <i class="material-icons">error</i>Please Select Another time slot..This slot is already Occupied!!</p> </div></div>');
                        $('#add_app').attr('disabled', true);
                    } else {
                        $('.AddApp #error').html('');
                        $('#add_app').attr('disabled', false);
                    }
                    var endtime = obj['endtime'].replace(/\"/g, "");
                    $('.AddApp #end_time').val(endtime);
                }
            });
            $.ajax({
                type: "POST",
                url: '{{ URL::route("SelectServiceTime") }}',
                data: {"_token": "{{ csrf_token() }}", service_id: service_id, starttime: starttime},
                success: function (response) {
                    //console.log(response);
                    var endtime = response.replace(/\"/g, "");
                    $('.AddApp #end_time').val(endtime);
                }
            });
        });
    </script>
    <script type="text/javascript">
        $('.AddApp #noofperson').keyup(function () {

            var people = $(this).val();
            var total = $('.AddApp #total_amount').val();
            var grand_total = people * total;
            //alert('total'+grand_total);
            $('.AddApp #grand_total').html(grand_total).toString(2);
        });
    </script>
    <!-- End of Add Appointment -->



    <!-- Start of Edit Appointment -->
    <script type="text/javascript">
        $('.EditApp #staff_edit').change(function () {
            var staff_id = $(this).val();
            var date = $('.EditApp #date_edit').val();
            //alert(staff_id);
            $.ajax({
                type: "POST",
                url: '{{ URL::route("SelectServices") }}',
                data: {"_token": "{{ csrf_token() }}", staff_id: staff_id, date: date},
                success: function (response) {
                    //console.log(response);
                    var obj = JSON.parse(response);
                    //console.log(obj);
                    var html = '<option value="">Select Service</option>';
                    $.each(obj[0], function (index, value) {
                        //console.log(index);
                        var group = $('<optgroup />').attr('label', '#' + index).appendTo('.EditApp #service_edit');

                        $.each(value, function (i, services) {
                            $('<option value="' + services.tbl_services_id + '" />').html(services.tbl_services_name).appendTo(group);
                        })
                        //html += '<option value="'+value.tbl_services_id+'">'+value.tbl_services_name+'</option>';
                    });
                    //$('.EditApp #service_edit').html(html);
                    $('.EditApp #showtime_edit').html(obj[1][0]);

                    $('.EditApp #start_time_edit').val(obj[1][1]);
                    $('.EditApp #end_time_edit').val(obj[1][2]);
                }
            });

        });
    </script>
    <script type="text/javascript">
        $('.EditApp #services_edit').change(function () {
            var service_id = $(this).val();
            var starttime = $('.EditApp #start_time_edit').val();
            var staff_id = $('.EditApp #staff_edit_edit').val();
            var endtime = $('.EditApp #end_time_edit').val();
            var date = $('.EditApp #date_edit').val();
            var app_id = $('.EditApp #app_id').val();
            //alert(service_id)
            $.ajax({
                type: "POST",
                url: '{{ URL::route("SelectServiceByID") }}',
                data: {
                    "_token": "{{ csrf_token() }}",
                    service_id: service_id,
                    starttime: starttime,
                    staff_id: staff_id,
                    date: date,
                    endtime: endtime,
                    app_id: app_id
                },
                success: function (response) {
                    //console.log(response);
                    var obj = JSON.parse(response);
                    //console.log(obj);
                    if (obj['count_app'] != 0) {

                        $('.EditApp #error').html('<div class="card-alert card gradient-45deg-red-pink"> <div class="card-content white-text"> <p> <i class="material-icons">error</i>Please Select Another time slot..This slot is already Occupied!!</p> </div></div>');
                        $('.EditApp #edit_app').attr('disabled', true);
                    } else {
                        $('.EditApp #error').html('');
                        $('.EditApp #edit_app').attr('disabled', false);
                    }
                    var endtime = obj['endtime'].replace(/\"/g, "");
                    $('.EditApp #end_time_edit').val(endtime);
                    $('.EditApp #total_amount_edit').val(obj['total_amount']);

                    var people = $('.EditApp #noofperson_edit').val();
                    var total = $('.EditApp #total_amount_edit').val();
                    var grand_total = people * total;
                    $('.EditApp #grand_total_edit').html(grand_total).toString(2);
                }
            });
        });
    </script>
    <script type="text/javascript">
        $('.EditApp #start_time_edit').change(function () {
            var service_id = $('.EditApp #services_edit').val();
            var starttime = $(this).val();
            var staff_id = $('.EditApp #staff_edit').val();
            var endtime = $('.EditApp #end_time_edit').val();
            var date = $('.EditApp #date_edit').val();
            var app_id = $('.EditApp #app_id').val();
            $.ajax({
                type: "POST",
                url: '{{ URL::route("SelectServiceByID") }}',
                data: {
                    "_token": "{{ csrf_token() }}",
                    service_id: service_id,
                    starttime: starttime,
                    staff_id: staff_id,
                    date: date,
                    endtime: endtime,
                    app_id: app_id
                },
                success: function (response) {
                    //console.log(response);
                    var obj = JSON.parse(response);
                    //console.log(obj);
                    if (obj['count_app'] != 0) {

                        $('.EditApp #error').html('<div class="card-alert card gradient-45deg-red-pink"> <div class="card-content white-text"> <p> <i class="material-icons">error</i>Please Select Another time slot..This slot is already Occupied!!</p> </div></div>');
                        $('.EditApp #edit_app').attr('disabled', true);
                    } else {
                        $('.EditApp #error').html('');
                        $('.EditApp #edit_app').attr('disabled', false);
                    }
                    var endtime = obj['endtime'].replace(/\"/g, "");
                    $('.EditApp #end_time_edit').val(endtime);
                }
            });
            $.ajax({
                type: "POST",
                url: '{{ URL::route("SelectServiceTime") }}',
                data: {"_token": "{{ csrf_token() }}", service_id: service_id, starttime: starttime},
                success: function (response) {
                    //console.log(response);
                    var endtime = response.replace(/\"/g, "");
                    $('.EditApp #end_time_edit').val(endtime);
                }
            });
        });
    </script>
    <script type="text/javascript">
        $('.EditApp #noofperson_edit').keyup(function () {

            var people = $(this).val();
            var total = $('.EditApp #total_amount_edit').val();
            var grand_total = people * total;
            //alert('total'+grand_total);
            $('.EditApp #grand_total_edit').html(grand_total).toString(2);
        });
    </script>
    <!-- End of Edit Appointment -->


    <script>
        $(document).ready(function () {

            $('.dis_none').hide();
            $('.add_new').click(function () {
                $('.dis_none').toggle();
            });

            $('#staff, #country_code, #services_edit, #client').select2({
                dropdownParent: $('#add_event')
            });

            $('#country_code_edit, #client_edit, #staff_edit').select2({
                dropdownParent: $('#edit_event')
            });

            $('#close_add').click(function () {
                window.location.reload();
            });

            $('#close_edit').click(function () {
                window.location.reload();
            });

            $('.modal').modal({
                dismissible: false,
            });

            /*$('.js-example-basic-multiple').select2({dropdownParent: $("#add_event")});
            $('.js-example-basic-multiple').select2({dropdownParent: $("#edit_event")});*/

            var SITEURL = "{{url('/')}}";

            var location_id = $('#location').val();
            //alert(location_id);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            var url = '{{ route("Calendar", ":id") }}';
            url = url.replace(':id', location_id);

            var calendar = $('#calendar').fullCalendar({
                buttonText: {
                    prev: '<',
                    next: '>',
                },
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                eventLimit: 4,
                editable: true,
                events: url,
                displayEventTime: true,
                eventRender: function (event, element, view) {

                },
                selectable: true,
                selectHelper: true,
                select: function (start, end, allDay) {

                    //alert('click');
                    $("#add").trigger('click');

                    function convert(str) {
                        var date = new Date(str),
                            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
                            day = ("0" + date.getDate()).slice(-2);
                        return [date.getFullYear(), mnth, day].join("-");
                    }

                    //console.log(convert(start));
                    $('.AddApp #date').val(convert(start));
                },

                eventDrop: function (event, delta) {
                    //console.log(event);
                    var start = $.fullCalendar.formatDate(event.start, "Y-MM-DD");
                    //var end = $.fullCalendar.formatDate(event.end, "Y-MM-DD HH:mm:ss");
                    //alert(start);
                    $.ajax({
                        type: "POST",
                        url: '{{ URL::route("CalendarDateUpdate") }}',
                        data: {"_token": "{{ csrf_token() }}", id: event.eid, date: start},
                        success: function (response) {
                            //console.log(response);
                            toastr.success(response.message);
                            //break;
                            //displayMessage(response);
                        }
                    });
                },
                eventClick: function (event) {
                    $("#edit").trigger('click');
                    //console.log(event);
                    $(".EditApp #app_id").val(event.eid);
                    $(".EditApp #date_edit").val(event.date);
                    $(".EditApp #start_time_edit").val(event.start_time);
                    $(".EditApp #end_time_edit").val(event.end_time);
                    $(".EditApp #comments_edit").val(event.comments);
                    $(".EditApp #client_edit").val(event.client_id);
                    $(".EditApp #client_edit").select2({dropdownParent: $('#edit_event')});
                    $(".EditApp #staff_edit").val(event.staff_id);
                    $(".EditApp #staff_edit").select2({dropdownParent: $('#edit_event')});
                    $(".EditApp #noofperson_edit").val(event.noofperson);
                    $(".EditApp #grand_total_edit").html(event.total_amount);
                    $.ajax({
                        type: "POST",
                        url: '{{ URL::route("SelectServices") }}',
                        data: {
                            "_token": "{{ csrf_token() }}",
                            staff_id: event.staff_id,
                            location_id: event.location_id
                        },
                        success: function (response) {
                            //console.log(response);
                            var obj = JSON.parse(response);
                            //console.log(obj);
                            var ser_id = event.service_id;
                            //console.log(ser_id);
                            var serviceid = ser_id.split(',');
                            //console.log(serviceid);
                            //var html = '';
                            var $exampleMulti = $(".EditApp #services_edit").select2();
                            //console.log($exampleMulti);

                            $.each(obj[0], function (index, value) {
                                //console.log(index);
                                var group = $('<optgroup />').attr('label', '#' + index).appendTo('.EditApp #services_edit');

                                $.each(value, function (i, services) {
                                    //console.log(services);
                                    /*if (jQuery.inArray(services.tbl_services_id, serviceid) != -1)
                                    {
                                      alert('if');
                                    }*/
                                    $('<option value="' + services.tbl_services_id + '" />').html(services.tbl_services_name).appendTo(group);
                                });
                                //html += '<option value="'+value.tbl_services_id+'">'+value.tbl_services_name+'</option>';
                            });

                            //console.log(group);
                            //$('.EditApp #services_edit').html(html);
                            $exampleMulti.val(serviceid).trigger('change');
                        }
                    });
                }

            });

        });

        function checkLink() {
            var client_id = $("#client").val();
            var service_id = $("#service_add").val();

            $.ajax({
                type: "POST",
                url: '{{ route("consultForm.link") }}',
                data: {
                    "_token": "{{ csrf_token() }}",
                    'client_id': client_id,
                    'service_id': service_id,
                },
                success: function (response) {
                    console.log(response);
                }
            });
        }
    </script>
@endsection