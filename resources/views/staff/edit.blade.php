@extends('layouts.app')

@section('content')
<div id="main">
    <div class="row">
        <div class="breadcrumbs-inline pt-3 pb-1" id="breadcrumbs-wrapper">
            <!-- Search for small screen-->
            <div class="container">
                <div class="row">
                    <div class="col s12 m12 l12 breadcrumbs-left">
                        <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Edit Staff</span></h5>
                        <ol class="breadcrumbs mb-0">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item"><a href="{{ route('Staff') }}">Staffs</a>
                            </li>
                            <li class="breadcrumb-item active">Edit
                            </li>
                        </ol>
                        <a class="btn waves-effect waves-light gradient-45deg-purple-deep-orange gradient-shadow float-right" href="javascript:history.back()">Back</a> 
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
                                    <div id="view-input-fields">
                                        <div class="row">
                                            <div class="col s12">
                                                <form class="row" method="POST" action="{{ route('StaffUpdate',$edit_staff->tbl_staff_id) }}">
                                                @method('PATCH')  
                                                @csrf	
                                                    <div class="col s12">
                                                        
                                                        <div class="input-field col s4">
                                                            <input id="first_name" type="text" class="validate @error('first_name') is-invalid @enderror" name="first_name" value="{{$edit_staff->tbl_staff_first_name}}" required="">
                                                            <label for="first_name">{{ __('First Name') }}<span class="required"> *</span></label>
                                                            @error('first_name')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="last_name" type="text" class="validate @error('last_name') is-invalid @enderror" name="last_name" value="{{$edit_staff->tbl_staff_last_name}}" required="">
                                                            <label for="last_name">{{ __('Last Name') }}<span class="required"> *</span></label>
                                                            @error('last_name')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="password" type="text" class="validate @error('password') is-invalid @enderror" name="password">
                                                            <input type="hidden" name="old_password" id="old_password" value="{{$edit_staff->tbl_staff_password}}">
                                                            <label for="password">{{ __('Password') }}</label>
                                                            @error('password')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <!-- <div class="col s4">
                                                            <a class="mb-6 btn-floating waves-effect waves-light gradient-45deg-purple-deep-orange gradient-shadow" href="javascript:void(0)" onClick="generate();">
                                                                <i class="material-icons">add</i>
                                                            </a>
                                                        </div> -->

                                                        <div class="col s4">
                                                            <div class="file-field">
                                                                <div class="btn">
                                                                    <span>Image</span>
                                                                    <input type="file" id="image" class="form-control @error('image') is-invalid @enderror" name="image">
                                                                    <input type="hidden" name="old_image" id="old_image" value="{{$edit_staff->tbl_staff_image}}">
                                                                </div>
                                                                <div class="file-path-wrapper">
                                                                    <input class="file-path validate" type="text">
                                                                </div>
                                                            </div>
                                                            @error('image')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="email" type="email" class="validate @error('email') is-invalid @enderror" name="email" value="{{$edit_staff->tbl_staff_email}}" required="">
                                                            <label for="email">{{ __('Email') }}<span class="required"> *</span></label>
                                                            @error('email')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="mobile" type="text" class="validate @error('mobile') is-invalid @enderror" name="mobile" value="{{$edit_staff->tbl_staff_mobile}}"  minlength="10" maxlength="11" required="">
                                                            <label for="mobile">{{ __('Mobile') }}<span class="required"> *</span></label>
                                                            @error('mobile')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="telephone" type="text" class="validate @error('telephone') is-invalid @enderror" name="telephone" value="{{$edit_staff->tbl_staff_telephone}}">
                                                            <label for="telephone">{{ __('Telephone') }}</label>
                                                            @error('telephone')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="start_date" type="text" class="datepicker validate @error('start_date') is-invalid @enderror" name="start_date" value="{{$edit_staff->tbl_staff_start_date}}" required="">
                                                            <label for="start_date">{{ __('Start Date') }}<span class="required"> *</span></label>
                                                            @error('start_date')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="end_date" type="text" class="datepicker validate @error('end_date') is-invalid @enderror" name="end_date" value="{{$edit_staff->tbl_staff_end_date}}">
                                                            <label for="end_date">{{ __('End Date') }}</label>
                                                            @error('end_date')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="break_time" type="text" class="timepicker validate @error('break_time') is-invalid @enderror" name="break_time" value="{{$edit_staff->tbl_staff_break_time}}" required="">
                                                            <label for="break_time">{{ __('Break Time') }}<span class="required"> *</span></label>
                                                            @error('break_time')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="salary" type="number" class="validate @error('salary') is-invalid @enderror" name="salary" step="any" value="{{$edit_staff->tbl_staff_salary}}" required="">
                                                            <label for="salary">{{ __('Salary') }}<span class="required"> *</span></label>
                                                            @error('salary')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="col s12">
                                                            <div class="input-field">
                                                                <select class="select2 browser-default" multiple="multiple" id="default-select-multi" name="services[]" required="">
                                                                   <?php foreach ($services_types as $key => $value) { 
                                                                    ?>
                                                                        <option value="{{$value->tbl_service_types_id}}" <?php if (in_array($value->tbl_service_types_id,$staffservices_types)) {
                                                                            echo "selected";
                                                                        }?> >{{$value->tbl_service_types_types}}</option>
                                                                    <?php } 
                                                                    ?>
                                                                </select>
                                                                <label for="services">{{ __('Services') }}<span class="required"> *</span></label>
                                                            </div>
                                                            @error('services')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="col s4">
                                                            <input id="color_code" type="color" class="validate @error('color_code') is-invalid @enderror" name="color_code" value="{{$edit_staff->tbl_staff_appointment_color_code}}">
                                                            <label for="color_code">{{ __('Staff Appointment Color Code') }}</label>
                                                            @error('color_code')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="col s4">
                                                            <label for="enable_online">{{ __('Enable Online Bookings') }}<span class="required"> *</span></label><br>
                                                            <label>
                                                                <input class="with-gap validate @error('enable_online') is-invalid @enderror" type="radio" id="yes" name="enable_online" value="1" <?php if ($edit_staff->tbl_staff_enable_online_bookings == 1) { echo "checked"; }?> required/><span><label for="yes">Yes</label></span>
                                                            </label>
                                                            <label>
                                                                <input class="with-gap validate @error('enable_online') is-invalid @enderror" type="radio" id="no" name="enable_online" value="0" <?php if ($edit_staff->tbl_staff_enable_online_bookings == 0) { echo "checked"; }?> /><span><label for="no">No</label></span>
                                                            </label>

                                                            @error('enable_online')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                    </div>

                                                    <div class="col s12">
                                                        <p><center><b>Emmergency Contact Details</b></center></p>

                                                        <div class="input-field col s4">
                                                            <input id="emergency_name" type="text" class="validate @error('emergency_name') is-invalid @enderror" name="emergency_name" value="{{$edit_staff->tbl_staff_emmergency_name}}">
                                                            <label for="emergency_name">{{ __('Name') }}</label>
                                                            @error('emergency_name')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="emergency_contact" type="text" class="validate @error('emergency_contact') is-invalid @enderror" name="emergency_contact" value="{{$edit_staff->tbl_staff_emmergency_contact}}">
                                                            <label for="emergency_contact">{{ __('Contact') }}</label>
                                                            @error('emergency_contact')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="emergency_relation" type="text" class="validate @error('emergency_relation') is-invalid @enderror" name="emergency_relation" value="{{$edit_staff->tbl_staff_emmergency_relation}}">
                                                            <label for="emergency_relation">{{ __('Relation') }}</label>
                                                            @error('emergency_relation')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>
                                                    </div>

                                                    <div class="col s12">
                                                        <p><center><b>Commissions</b></center></p>

                                                        <div class="input-field col s4">
                                                            <input id="service_commission" type="number" class="validate @error('service_commission') is-invalid @enderror" name="service_commission" step="any" value="{{$edit_staff->tbl_staff_service_commission}}">
                                                            <label for="service_commission">{{ __('Service') }}</label>
                                                            @error('service_commission')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="product_commission" type="number" class="validate @error('product_commission') is-invalid @enderror" name="product_commission" step="any" value="{{$edit_staff->tbl_staff_product_commission}}">
                                                            <label for="product_commission">{{ __('Product') }}</label>
                                                            @error('product_commission')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="voucher_commission" type="number" class="validate @error('voucher_commission') is-invalid @enderror" name="voucher_commission" step="any" value="{{$edit_staff->tbl_staff_voucher_commission}}">
                                                            <label for="voucher_commission">{{ __('Voucher') }}</label>
                                                            @error('voucher_commission')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                    </div>

                                                    <div class="col s4">
                                                    	<button type="submit" class="mb-6 btn waves-effect waves-light gradient-45deg-purple-deep-orange gradient-shadow">Submit</button>
                                                    </div>

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
            <div class="content-overlay"></div>
        </div>
    </div>
</div>
@endsection