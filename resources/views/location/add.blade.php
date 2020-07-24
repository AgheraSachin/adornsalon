@extends('layouts.app')

@section('content')
<div id="main">
    <div class="row">
        <div class="breadcrumbs-inline pt-3 pb-1" id="breadcrumbs-wrapper">
            <!-- Search for small screen-->
            <div class="container">
                <div class="row">
                    <div class="col s12 m12 l12 breadcrumbs-left">
                        <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Add Location</span></h5>
                        <ol class="breadcrumbs mb-0">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item"><a href="{{ route('Locations') }}">Locations</a>
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
                                                <form class="row" method="POST" action="{{ route('LocationsStore') }}">
                                                @csrf	
                                                    <div class="col s12">
                                                        
                                                        <div class="input-field col s4">
                                                            <input id="location_name" type="text" class="validate @error('location_name') is-invalid @enderror" name="location_name">
                                                            <label for="location_name">Location Name</label>
                                                            @error('location_name')
						                                        <span class="invalid-feedback" role="alert">
						                                            <strong>{{ $message }}</strong>
						                                        </span>
						                                    @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="contant_name" type="text" class="validate @error('contant_name') is-invalid @enderror" name="contant_name">
                                                            <label for="contant_name">Contact Person Name</label>
                                                            @error('contant_name')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="contant_number" type="text" class="validate @error('contant_number') is-invalid @enderror" name="contant_number">
                                                            <label for="contant_number">Contact Number</label>
                                                            @error('contant_number')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="email" type="text" class="validate @error('email') is-invalid @enderror" name="email">
                                                            <label for="email">Email</label>
                                                            @error('email')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="start_time" type="text" class="validate @error('start_time') is-invalid @enderror timepicker" name="start_time">
                                                            <label for="start_time">{{ __('Start Time') }}</label>
                                                            @error('start_time')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="end_time" type="text" class="validate @error('end_time') is-invalid @enderror timepicker" name="end_time">
                                                            <label for="end_time">{{ __('End Time') }}</label>
                                                            @error('end_time')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                        <div class="input-field col s8">
                                                            <textarea id="address" class="materialize-textarea @error('address') is-invalid @enderror" name="address"></textarea>
                                                            <label for="address">{{ __('Full Address') }}</label>
                                                            @error('address')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>

                                                    </div>
                                                    <div class="col s12">
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
    $(document).ready(function() {
        $('.timepicker').timepicker();
    });
</script>
@endsection