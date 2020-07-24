@extends('layouts.app')

@section('content')
<div id="main">
    <div class="row">
        <div class="breadcrumbs-inline pt-3 pb-1" id="breadcrumbs-wrapper">
            <!-- Search for small screen-->
            <div class="container">
                <div class="row">
                    <div class="col s12 m12 l12 breadcrumbs-left">
                        <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Edit Service</span></h5>
                        <ol class="breadcrumbs mb-0">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item"><a href="{{ route('Service') }}">Services</a>
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
                                    <!-- <div class="card-title">
                                        <div class="row">
                                            <div class="col s12 m6 l10">
                                                <h4 class="card-title">Edit Service</h4>
                                            </div>
                                            <div class="col s12 m6 l2">
                                                <a href="javascript:history.back()" class="mb-6 btn waves-effect waves-light gradient-45deg-purple-deep-orange gradient-shadow">Back</a>
                                            </div>
                                        </div>
                                    </div> -->
                                    <div id="view-input-fields">
                                        <div class="row">
                                            <div class="col s12">
                                                <form class="row" method="POST" action="{{route('ServiceUpdate',$edit_service->tbl_services_id) }}">
                                                @method('PATCH')  
                                                @csrf	
                                                    <div class="col s12">
                                                        
                                                        <div class="input-field col s4">
                                                            <input id="name" type="text" class="validate @error('name') is-invalid @enderror" name="name" value="{{$edit_service->tbl_services_name}}" required="">
                                                            <label for="name">{{ __('Service Name') }}<span class="required"> *</span></label>
                                                            @error('name')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="duration_time" type="number" class="validate @error('duration_time') is-invalid @enderror" name="duration_time" value="{{$edit_service->tbl_services_duration_time}}" title="please enter only numeric value" step="any" pattern="^[0–9]$" required="">
                                                            <label for="duration_time">{{ __('Treatment Duration') }}<span class="required"> *</span></label>
                                                            @error('duration_time')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="col s4">
                                                            <div class="file-field input-field">
                                                                <div class="btn">
                                                                    <span>Image</span>
                                                                    <input type="file" id="image" class="form-control @error('image') is-invalid @enderror" name="image">
                                                                    <input type="hidden" name="old_image" id="old_image" value="{{$edit_service->tbl_services_image}}">
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

                                                        <div class="col s4">
                                                            <label for="enable_online">{{ __('Enable Online') }}<span class="required"> *</span></label><br>
                                                            <label>
                                                                <input class="with-gap validate @error('enable_online') is-invalid @enderror" type="radio" id="yes" name="enable_online" value="1" <?php if ($edit_service->tbl_services_enable_online == '1') { echo "checked"; }?> required><span><label for="yes">Yes</label></span>
                                                            </label>
                                                            <label>
                                                            <input class="with-gap validate @error('enable_online') is-invalid @enderror" type="radio" id="no" name="enable_online" value="0" <?php if ($edit_service->tbl_services_enable_online == '0') {
                                                                echo "checked"; }?> ><span><label for="no">No</label></span>
                                                            </label>
                                                            
                                                            @error('enable_online')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="col s4">
                                                            <label for="service_status">{{ __('Service Status') }}<span class="required"> *</span></label><br>
                                                            <label>
                                                                <input class="with-gap @error('service_status') is-invalid @enderror" type="radio" id="expired" name="service_status" value="1" <?php if ($edit_service->tbl_services_status == '1') {
                                                                echo "checked"; }?> required><span><label for="expired">Expired</label></span>
                                                            </label>
                                                            <label>
                                                                <input class="with-gap @error('service_status') is-invalid @enderror" type="radio" id="not_expired" name="service_status" value="0" <?php if ($edit_service->tbl_services_status == '0') { echo "checked"; }?> ><span><label for="not_expired">Not Expired</label></span>
                                                            </label>

                                                            @error('service_status')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <select id="gender" class="validate @error('gender') is-invalid @enderror" name="gender" required="">
                                                                <option value="" disabled>Choose your option</option>
                                                                <option value="M" <?php if ($edit_service->tbl_services_for == 'M') {
                                                                echo "selected";
                                                            }?> >Male</option>
                                                                <option value="F" <?php if ($edit_service->tbl_services_for == 'F') {
                                                                echo "selected";
                                                            }?> >Female</option>
                                                                <option value="O" <?php if ($edit_service->tbl_services_for == 'O') {
                                                                echo "selected";
                                                            }?> >Unisex</option>
                                                            </select>
                                                            <label for="gender">{{ __('Service For') }}<span class="required"> *</span></label>
                                                            @error('gender')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <select id="service_type" class="validate @error('service_type') is-invalid @enderror" name="service_type" required="">
                                                                <option value="" disabled selected>Choose your option</option>
                                                                <?php
                                                                foreach ($service_types as $key => $value) { ?>
                                                                    <option value="{{$value->tbl_service_types_id}}" <?php if ($value->tbl_service_types_id == $edit_service->tbl_services_type) {
                                                                        echo "selected";
                                                                    }?> >{{$value->tbl_service_types_types}}</option>
                                                                <?php }
                                                                ?>
                                                            </select>
                                                            <label for="service_type">{{ __('Service Type') }}<span class="required"> *</span></label>
                                                            @error('service_type')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="commission" type="number" class="validate @error('commission') is-invalid @enderror" name="commission" step="any" value="{{$edit_service->tbl_services_commission}}" required="">
                                                            <label for="commission">{{ __('Commission') }}<span class="required"> *</span></label>
                                                            @error('commission')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="special_price" type="number" class="validate @error('special_price') is-invalid @enderror" name="special_price" step="any" value="{{$edit_service->tbl_services_special_price}}" required="">
                                                            <label for="special_price">{{ __('Special Price') }}<span class="required"> *</span></label>
                                                            @error('special_price')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="retail_price" type="number" class="validate @error('retail_price') is-invalid @enderror" name="retail_price" step="any" value="{{$edit_service->tbl_services_retail_price}}" required="">
                                                            <label for="retail_price">{{ __('Retail Price') }}<span class="required"> *</span></label>
                                                            @error('retail_price')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="tax" type="number" class="validate @error('tax') is-invalid @enderror" name="tax" step="any" value="{{$edit_service->tbl_services_tax}}" required="">
                                                            <label for="tax">{{ __('Tax') }}<span class="required"> *</span></label>
                                                            @error('tax')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <!-- <div class="input-field col s12">
                                                            <textarea id="description" class="materialize-textarea @error('description') is-invalid @enderror" name="description"> {{$edit_service->tbl_services_description}}</textarea>
                                                            <label for="description">{{ __('Description') }}</label>
                                                            @error('description')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div> -->
                                                    </div>

                                                    <div class="col s12">
                                                        <label for="description">{{ __('Description') }}</label>

                                                        <div class="quill-toolbar">
                                                            <span class="ql-formats">
                                                                <select class="ql-header browser-default">
                                                                    <option value="1">Heading</option>
                                                                    <option value="2">Subheading</option>
                                                                    <option selected>Normal</option>
                                                                </select>
                                                                <select class="ql-font browser-default">
                                                                    <option selected>Sailec Light</option>
                                                                    <option value="sofia">Sofia Pro</option>
                                                                    <option value="slabo">Slabo 27px</option>
                                                                    <option value="roboto">Roboto Slab</option>
                                                                    <option value="inconsolata">Inconsolata</option>
                                                                    <option value="ubuntu">Ubuntu Mono</option>
                                                                </select>
                                                            </span>
                                                            <span class="ql-formats">
                                                                <button class="ql-bold"></button>
                                                                <button class="ql-italic"></button>
                                                                <button class="ql-underline"></button>
                                                            </span>
                                                            <span class="ql-formats">
                                                                <button class="ql-list" value="ordered"></button>
                                                                <button class="ql-list" value="bullet"></button>
                                                            </span>
                                                            <span class="ql-formats">
                                                                <button class="ql-link"></button>
                                                                <button class="ql-image"></button>
                                                                <button class="ql-video"></button>
                                                            </span>
                                                            <span class="ql-formats">
                                                                <button class="ql-formula"></button>
                                                                <button class="ql-code-block"></button>
                                                            </span>
                                                            <span class="ql-formats">
                                                                <button class="ql-clean"></button>
                                                            </span>
                                                        </div>

                                                        <div class="editor">
                                                            {!! $edit_service->tbl_services_description !!}
                                                        </div> 

                                                        <input type="hidden" name="description" id="description" class="description">
                                                    </div>

                                                    <div class="col s4" style="margin-top: 10px;">
                                                    	<button type="submit" class="mb-6 btn waves-effect waves-light gradient-45deg-purple-deep-orange gradient-shadow" id="btn-submit">Submit</button>
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
