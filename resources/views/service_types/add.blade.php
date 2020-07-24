@extends('layouts.app')

@section('content')
<div id="main">
    <div class="row">
        <div class="breadcrumbs-inline pt-3 pb-1" id="breadcrumbs-wrapper">
            <!-- Search for small screen-->
            <div class="container">
                <div class="row">
                    <div class="col s12 m12 l12 breadcrumbs-left">
                        <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Add Service Types</span></h5>
                        <ol class="breadcrumbs mb-0">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item"><a href="{{ route('ServiceTypes') }}">Service Types</a>
                            </li>
                            <li class="breadcrumb-item active">Add
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
                                                <form class="row" method="POST" action="{{ route('ServiceTypesStore') }}">
                                                @csrf

                                                    <div class="col s12">
                                                        <div class="input-field">
                                                        <input id="type" type="text" class="validate @error('type') is-invalid @enderror" name="type" required="">
                                                            <label for="type">Type<span class="required"> *</span></label>
                                                            @error('type')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>
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