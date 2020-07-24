@extends('layouts.app')

@section('content')
<div id="main">
    <div class="row">
        <div class="breadcrumbs-inline pt-3 pb-1" id="breadcrumbs-wrapper">
            <!-- Search for small screen-->
            <div class="container">
                <div class="row">
                    <div class="col s12 m12 l12 breadcrumbs-left">
                        <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Edit Service Package</span></h5>
                        <ol class="breadcrumbs mb-0">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item"><a href="{{ route('ServicePackage') }}">Service Packages</a>
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
                                                <form class="row" method="POST" action="{{route('ServicePackageUpdate',$edit_service_package->tbl_service_package_id) }}">
                                                @method('PATCH')  
                                                @csrf   
                                                    <div class="col s12">
                                                        
                                                        <div class="input-field col s4">
                                                            <input id="name" type="text" class="validate @error('name') is-invalid @enderror" name="name" value="{{$edit_service_package->tbl_service_package_name}}" required="">
                                                            <label for="name">{{ __('Service Name') }}<span class="required"> *</span></label>
                                                            @error('name')
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
                                                                    <input type="hidden" name="old_image" value="{{$edit_service_package->tbl_service_package_image}}" id="old_image">
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
                                                            <select id="service_id" class="validate @error('service_id') is-invalid @enderror select2 browser-default" name="service_id[]" multiple="" required="">
                                                                <option value="" disabled>Choose your option</option>
                                                                <?php
                                                                $exp_services = explode(',', $edit_service_package->tbl_service_package_service_id);
                                                                    foreach ($services as $key => $value) { ?>
                                                                        <option value="<?php echo $value->tbl_services_id;?>" <?php if (in_array($value->tbl_services_id, $exp_services)) { echo "selected"; } ?> ><?php echo $value->tbl_services_name;?></option>
                                                                <?php } ?>
                                                            </select>
                                                            <label for="service_id">{{ __('Select Service') }}<span class="required"> *</span></label>
                                                            @error('service_id')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="col s4">
                                                            <label for="service_package_status">{{ __('Service Status') }}<span class="required"> *</span></label><br>
                                                            <label>
                                                                <input class="with-gap @error('service_package_status') is-invalid @enderror" type="radio" id="expired" name="service_package_status" value="1" <?php if ($edit_service_package->tbl_service_package_status == 1) {
                                                                echo "checked"; }?> required><span><label for="expired">Expired</label></span>
                                                            </label>
                                                            <label>
                                                                <input class="with-gap @error('service_package_status') is-invalid @enderror" type="radio" id="not_expired" name="service_package_status" value="0"  <?php if ($edit_service_package->tbl_service_package_status == 0) {
                                                                echo "checked"; }?> ><span><label for="not_expired">Not Expired</label></span>
                                                            </label>
                                                            @error('service_package_status')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="special_price" type="number" class="validate @error('special_price') is-invalid @enderror" name="special_price" step="any" value="{{$edit_service_package->tbl_service_package_special_price}}" required="">
                                                            <label for="special_price">{{ __('Special Price') }}<span class="required"> *</span></label>
                                                            @error('special_price')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="price" type="number" class="validate @error('price') is-invalid @enderror" name="price" step="any" value="{{$edit_service_package->tbl_service_package_price}}" required="">
                                                            <label for="price">{{ __('Retail Price') }}<span class="required"> *</span></label>
                                                            @error('price')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="month" type="number" class="validate @error('month') is-invalid @enderror" name="month" value="{{$edit_service_package->tbl_service_package_months}}" required="">
                                                            <label for="month">{{ __('Months') }}<span class="required"> *</span></label>
                                                            @error('month')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s6">
                                                            <textarea id="note" class="materialize-textarea @error('note') is-invalid @enderror" name="note">{{$edit_service_package->tbl_service_package_special_note}}</textarea>
                                                            <label for="note">{{ __('Special Note') }}</label>
                                                            @error('note')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <!-- <div class="input-field col s12">
                                                            <textarea id="description" class="materialize-textarea @error('description') is-invalid @enderror" name="description">{{$edit_service_package->tbl_service_package_description}}</textarea>
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
                                                            {!! $edit_service_package->tbl_service_package_description !!}
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