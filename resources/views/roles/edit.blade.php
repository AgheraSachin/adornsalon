@extends('layouts.app')

@section('content')
<div id="main">
    <div class="row">
        <div class="breadcrumbs-inline pt-3 pb-1" id="breadcrumbs-wrapper">
            <!-- Search for small screen-->
            <div class="container">
                <div class="row">
                    <div class="col s12 m12 l12 breadcrumbs-left">
                        <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Edit Roles</span></h5>
                        <ol class="breadcrumbs mb-0">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item"><a href="{{ route('Roles') }}">Roles</a>
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
                                                <form class="row" method="POST" action="{{ route('RolesUpdate',$role->tbl_roles_id) }}">
                                                @method('PATCH')  
                                                @csrf	
                                                    <div class="col s12">
                                                        
                                                        <div class="input-field col s6">
                                                            <input id="type" type="text" class="validate @error('type') is-invalid @enderror" name="type" value="{{$role->tbl_roles_types}}">
                                                            <label for="type">Name</label>
                                                            @error('type')
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