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
                            <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Consultation Form List</span>
                            </h5>
                            <ol class="breadcrumbs mb-0">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                                </li>
                                <li class="breadcrumb-item active">Consultation Form List
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
                                        <h4 class="card-title col-md-6">Consultation Form List
                                            <div class="row">
                                                <div class="col s12">
                                                    <table id="page-length-option" class="display">
                                                        <thead>
                                                        <tr>
                                                            <th>Client Name</th>
                                                            <th>Service</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        @foreach($result as $form)
                                                            <tr>
                                                                <td>{{$form->tbl_clients_first_name}} {{$form->tbl_clients_last_name}}</td>
                                                                <td>{{$form->tbl_services_name}}</td>
                                                                <td>
                                                                    <a href="{{route('consulation.history',['client_id'=>$form->tbl_consultationform_data_client_id,'service_id'=>$form->tbl_service_id])}}"
                                                                       target="_blanks"
                                                                       class="mb-6 btn-floating waves-effect waves-light blue accent-2">
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