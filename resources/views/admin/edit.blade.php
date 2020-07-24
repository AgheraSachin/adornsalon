@extends('layouts.app')

@section('content')
<div id="main">
    <div class="row">
        <div class="breadcrumbs-inline pt-3 pb-1" id="breadcrumbs-wrapper">
            <!-- Search for small screen-->
            <div class="container">
                <div class="row">
                    <div class="col s12 m12 l12 breadcrumbs-left">
                        <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Edit Admins</span></h5>
                        <ol class="breadcrumbs mb-0">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item"><a href="{{ route('admins') }}">Admins</a>
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
                                                <form class="row" method="POST" action="{{ route('AdminUpdate',$admin->id) }}">
                                                @method('PATCH')  
                                                @csrf	
                                                    <div class="col s12">
                                                        
                                                        <div class="input-field col s4">
                                                            <input placeholder="Enter name" id="name" type="text" class="validate @error('name') is-invalid @enderror" name="name" value="{{$admin->name}}" required="">
                                                            <label for="name">Name<span class="required"> *</span></label>
                                                            @error('name')
						                                        <span class="invalid-feedback" role="alert">
						                                            <strong>{{ $message }}</strong>
						                                        </span>
						                                    @enderror
                                                        </div>

                                                        <div class="input-field col s4">
                                                            <input id="email" type="email" class="validate @error('email') is-invalid @enderror" name="email"  value="{{$admin->email}}" required="">
                                                            <label for="email">Email<span class="required"> *</span></label>
                                                            @error('email')
						                                        <span class="invalid-feedback" role="alert">
						                                            <strong>{{ $message }}</strong>
						                                        </span>
						                                    @enderror
                                                        </div>

                                                        <div class="input-field col s3">
                                                            <input id="password" type="text" class="validate @error('password') is-invalid @enderror" name="password"  value="" placeholder="">
                                                            <label for="password">Password</label>
                                                            <input type="hidden" name="old_password" id="old_password" value="{{$admin->password}}">
                                                            @error('password')
						                                        <span class="invalid-feedback" role="alert">
						                                            <strong>{{ $message }}</strong>
						                                        </span>
						                                    @enderror
                                                        </div>

                                                        <div class="col s1">
	                                                    	<a class="mb-6 btn-floating waves-effect waves-light gradient-45deg-purple-deep-orange gradient-shadow" href="javascript:void(0)"onClick="generate();">
					                                            <i class="material-icons">vpn_key</i>
					                                        </a>
	                                                    </div>

	                                                    <div class="col s4">
	                                                    	<label for="role_type">Role Type<span class="required"> *</span></label>
	                                                    	<select id="role_type" name="role_type" class="validate" required="">
	                                                    		<option value="">select Type</option>
	                                                    		<?php
	                                                    		foreach ($roles as $key => $role) { ?>
	                                                    			<option value="{{$role->tbl_roles_id}}" <?php if ($admin->role_id == $role->tbl_roles_id) {
                                                                        echo "selected";
                                                                    }?> >{{$role->tbl_roles_types}}</option>
	                                                    		<?php }
	                                                    		?>
	                                                    	</select>
	                                                    </div>

                                                        <div class="col s4">
                                                            <label for="location">Select Location<span class="required"> *</span></label>
                                                            <select id="location" name="location[]" class="validate select2 browser-default" required="" multiple="">
                                                                <option value="">select Locations</option>
                                                                <?php
                                                                $exp_locations = explode(',', $admin->location_id);
                                                                foreach ($locations as $key => $location) { ?>
                                                                    <option value="{{$location->tbl_locations_id}}" <?php if (in_array($location->tbl_locations_id,$exp_locations)) {
                                                                        echo "selected";
                                                                    }?> >{{$location->tbl_locations_name}}</option>
                                                                <?php }
                                                                ?>
                                                            </select>
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

    function randomPassword(length) {
        var chars = "abcdefghijklmnopqrstuvwxyz!@#$%^&*()-+<>ABCDEFGHIJKLMNOP1234567890";
        var pass = "";
        for (var x = 0; x < length; x++) {
            var i = Math.floor(Math.random() * chars.length);
            pass += chars.charAt(i);
        }
        return pass;
      }

    function generate() {
        $('#password').val(randomPassword(8));
    }
</script>
@endsection