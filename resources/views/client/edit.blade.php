@extends('layouts.app')

@section('content')
<div id="main">
    <div class="row">
        <div class="breadcrumbs-inline pt-3 pb-1" id="breadcrumbs-wrapper">
            <!-- Search for small screen-->
            <div class="container">
                <div class="row">
                    <div class="col s12 m12 l12 breadcrumbs-left">
                        <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Edit Clients</span></h5>
                        <ol class="breadcrumbs mb-0">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item"><a href="{{ route('Client') }}">Clients</a>
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
                                                <form class="row" method="POST" action="{{ route('ClientUpdate',$edit_client->tbl_clients_id) }}">
                                                @method('PATCH')  
                                                @csrf	
                                                    <div class="col s12">
                                                        
                                                        <div class="input-field col s4">
                                                            <input id="first_name" type="text" class="validate @error('first_name') is-invalid @enderror" name="first_name" value="{{$edit_client->tbl_clients_first_name}}" required="">
                                                            <label for="first_name">{{ __('First Name') }}<span class="required"> *</span></label>
                                                            @error('first_name')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="middle_name" type="text" class="validate @error('middle_name') is-invalid @enderror" name="middle_name" value="{{$edit_client->tbl_clients_middle_name}}">
                                                            <label for="middle_name">{{ __('Middle Name') }}</label>
                                                            @error('middle_name')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="last_name" type="text" class="validate @error('last_name') is-invalid @enderror" name="last_name" value="{{$edit_client->tbl_clients_last_name}}" required="">
                                                            <label for="last_name">{{ __('Last Name') }}<span class="required"> *</span></label>
                                                            @error('last_name')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="username" type="text" class="validate @error('username') is-invalid @enderror" name="username" value="{{$edit_client->tbl_clients_user_name}}" required="">
                                                            <label for="username">{{ __('UserName') }}<span class="required"> *</span></label>
                                                            @error('username')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="col s4">
                                                            <div class="file-field">
                                                                <div class="btn">
                                                                    <span>Image</span>
                                                                    <input type="file" id="image" class="form-control @error('image') is-invalid @enderror" name="image">
                                                                    <input type="hidden" name="old_image" id="old_image" value="{{$edit_client->tbl_clients_image}}">
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
                                                            <input id="email" type="email" class="validate @error('email') is-invalid @enderror" name="email" value="{{$edit_client->tbl_clients_email}}" required="">
                                                            <label for="email">{{ __('Email') }}<span class="required"> *</span></label>
                                                            @error('email')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>
                                                        <div class="input-field col s4">
                                                            <input id="password" type="text" class="validate @error('password') is-invalid @enderror" name="password">
                                                            <input type="hidden" name="old_password" id="old_password" value="{{$edit_client->tbl_clients_password}}">
                                                            <label for="password">{{ __('Password') }}</label>
                                                            @error('password')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <select id="country_code" class="validate @error('country_code') is-invalid @enderror  select2 browser-default" name="country_code" required="">
                                                                <option value="" disabled>Choose your option</option>
                                                                <?php
                                                                    foreach ($country_codes as $key => $value) { ?>
                                                                        <option value="<?php echo $value->tbl_country_code_isd_code;?>" <?php if ($value->tbl_country_code_isd_code == $edit_client->tbl_clients_country_code) {
                                                                            echo "selected";
                                                                        }?> ><?php echo $value->tbl_country_code_iso_code.'-'.$value->tbl_country_code_isd_code;?></option>
                                                                <?php } ?>
                                                            </select>
                                                            <label for="country_code">{{ __('Country Code') }}<span class="required"> *</span></label>
                                                            @error('country_code')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="mobile" type="text" class="validate @error('mobile') is-invalid @enderror" name="mobile" value="{{$edit_client->tbl_clients_mobile}}" required=""  minlength="10" maxlength="11">
                                                            <label for="mobile">{{ __('Mobile') }}<span class="required"> *</span></label>
                                                            @error('mobile')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="telephone" type="text" class="validate @error('telephone') is-invalid @enderror" name="telephone" value="{{$edit_client->tbl_clients_telephone}}">
                                                            <label for="telephone">{{ __('Telephone') }}</label>
                                                            @error('telephone')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <select id="gender" class="validate @error('gender') is-invalid @enderror" name="gender" required="">
                                                                <option value="M" <?php if ($edit_client->tbl_clients_gender == 'M') {
                                                                    echo "selected";
                                                                }?> >Male</option>
                                                                <option value="F" <?php if ($edit_client->tbl_clients_gender == 'F') {
                                                                    echo "selected";
                                                                }?> >Female</option>
                                                            </select>
                                                            <label for="gender">{{ __('Gender') }}<span class="required"> *</span></label>
                                                            @error('gender')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="birthday" type="text" class="datepicker validate @error('birthday') is-invalid @enderror" name="birthday" value="{{$edit_client->tbl_clients_birthday}}" required="">
                                                            <label for="birthday">{{ __('Birthday') }}<span class="required"> *</span></label>
                                                            @error('birthday')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <select id="marital_status" class="validate @error('marital_status') is-invalid @enderror" name="marital_status">
                                                                <option value="1" <?php if ($edit_client->tbl_clients_marital_status == '1') {
                                                                    echo "selected";
                                                                }?> >Married</option>
                                                                <option value="0" <?php if ($edit_client->tbl_clients_marital_status == '0') {
                                                                    echo "selected";
                                                                }?> >Single</option>
                                                            </select>
                                                            <label for="marital_status">{{ __('Marital Status') }}</label>
                                                            @error('price')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4 anniversary_date">
                                                            <input id="anniversary_date" type="text" class="datepicker validate @error('anniversary_date') is-invalid @enderror" name="anniversary_date" value="{{$edit_client->tbl_clients_anniversary_date}}">
                                                            <label for="anniversary_date">{{ __('Anniversary Date') }}</label>
                                                            @error('anniversary_date')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s8">
                                                            <textarea id="address" class="materialize-textarea @error('address') is-invalid @enderror" name="address">{{$edit_client->tbl_clients_address}}</textarea>
                                                            <label for="address">{{ __('Permanent Address') }}</label>
                                                            @error('address')
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

@section('content-script')
<script type="text/javascript">
    $(document).ready(function()
    {
        $('.datepicker').datepicker();
        if ($('#marital_status').val() == 1) 
        {
            $('.anniversary_date').show();
        }
        else
        {
            $('.anniversary_date').hide();
        }

        $('#marital_status').change(function() {
            if ($(this).val() == 1) 
            {
                $('.anniversary_date').show();
            }
            else
            {
                $('.anniversary_date').hide();
            }
        });
    })
</script>
@endsection
