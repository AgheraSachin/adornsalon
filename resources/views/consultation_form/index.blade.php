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
                            <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Consultation Form</span></h5>
                            <ol class="breadcrumbs mb-0">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                                </li>
                                <li class="breadcrumb-item active">Consultation Form
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
                                        <h4 class="card-title col-md-6">Consultation Form
                                        <a class="mb-6 btn waves-effect waves-light gradient-45deg-purple-deep-orange gradient-shadow float-right" href="{{ route('ConsultationFormAdd') }}">Add</a></h4>
                                        
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
                                            <div class="col s12">
                                                <table id="page-length-option" class="display">
                                                    <thead>
                                                        <tr>
                                                        	<th>ID</th>
                                                        	<th>Service Name</th>
		                                                    <th>Title</th>
		                                                    <th>Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
		                                                @foreach($forms as $form)
		                                                <tr>
		                                                    <td>{{$form->tbl_consultation_form_id}}</td>
		                                                    <td>{{$form->tbl_services_name}}</td>
		                                                    <td>{{$form->tbl_consultation_form_title}}</td>
		                                                    <td>
		                                                    	<a href="{{ route('ConsultationFormEdit', $form->tbl_consultation_form_id) }}" class="mb-6 btn-floating waves-effect waves-light green darken-1">
	                                                                <i class="material-icons">edit</i>
	                                                            </a>
	                                                            <a href="{{ route('ConsultationFormDelete', $form->tbl_consultation_form_id) }}" class="mb-6 btn-floating waves-effect waves-light red accent-2">
	                                                                <i class="material-icons">delete</i>
	                                                            </a>
	                                                            <a href="{{ route('ConsultationFormView', $form->tbl_consultation_form_id) }}" class="mb-6 btn-floating waves-effect waves-light blue accent-2">
	                                                                <i class="material-icons">remove_red_eye</i>
	                                                            </a>
		                                                    </td>
		                                                </tr>
		                                                @endforeach
                                                    </tbody>
                                                </table>
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