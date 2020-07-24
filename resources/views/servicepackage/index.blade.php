@extends('layouts.app')

@section('content')
<!-- BEGIN: Page Main-->
    <?php
    $permission_data = DB::table('tbl_role_rights')->where('tbl_role_rights_role_id',session()->get('role_id'))->where('tbl_role_rights_page_name','ServicePackageController')->select('tbl_role_rights_add','tbl_role_rights_edit','tbl_role_rights_delete')->first();
    ?>
    <div id="main">
        <div class="row">
            <div class="breadcrumbs-inline pt-3 pb-1" id="breadcrumbs-wrapper">
                <!-- Search for small screen-->
                <div class="container">
                    <div class="row">
                        <div class="col s12 m12 l12 breadcrumbs-left">
                            <h5 class="breadcrumbs-title mt-0 mb-0 display-inline hide-on-small-and-down"><span>Service Package</span></h5>
                            <ol class="breadcrumbs mb-0">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a>
                                </li>
                                <li class="breadcrumb-item active">Service Packages
                                </li>
                            </ol>
                            <?php
                            if (!empty($permission_data)) 
                            {
                                if ($permission_data->tbl_role_rights_add != 0) 
                                { ?>
                                    <a class="btn waves-effect waves-light gradient-45deg-purple-deep-orange gradient-shadow float-right" href="{{ route('ServicePackageAdd') }}">Add</a>
                                <?php }
                            }
                            else
                            { ?>
                                <a class="btn waves-effect waves-light gradient-45deg-purple-deep-orange gradient-shadow float-right" href="{{ route('ServicePackageAdd') }}">Add</a>
                            <?php }
                            ?>
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
                                                        	<th>Sr No.</th>
                                                            <th>Image</th>
                                                            <th>Name</th>
                                                            <th>Package ID</th>
                                                            <th>Retail Price</th>
                                                            <th>Special Price</th>
                                                            <th>Months</th>
                                                            <?php
                                                            if (!empty($permission_data)) 
                                                            {
                                                                if ($permission_data->tbl_role_rights_edit != 0 || $permission_data->tbl_role_rights_delete != 0) 
                                                                { 
                                                                    echo "<th>Action</th>";
                                                                }
                                                            }
                                                            else
                                                            {
                                                                echo "<th>Action</th>";
                                                            }
                                                            ?>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php $i = 1; ?>
                                                        @foreach($service_packages as $service_package)
                                                        <tr>
                                                            <td>{{$i}}</td>
                                                            <td>
                                                                <?php if ($service_package->tbl_service_package_image == '') {
                                                                    echo 'No Image';
                                                                }else{ ?>
                                                                    <img src="{{ url('public/services_packages/'.$service_package->tbl_service_package_image) }}" style="height: 50px; width: 50px;"/>
                                                                <?php }?>
                                                            </td>
                                                            <td>{{$service_package->tbl_service_package_name}}</td>
                                                            <td>{{$service_package->tbl_service_package_unique_id}}</td>
                                                            <td>{{$service_package->tbl_service_package_price}}</td>
                                                            <td>{{$service_package->tbl_service_package_special_price}}</td>
                                                            <td>{{$service_package->tbl_service_package_months}}</td>
                                                            <?php
                                                            if (!empty($permission_data)) 
                                                            {
                                                                if ($permission_data->tbl_role_rights_edit != 0 || $permission_data->tbl_role_rights_delete != 0)

                                                                { echo '<td>';
                                                                    if ($permission_data->tbl_role_rights_edit != 0) 
                                                                    { ?>
                                                                        <a href="{{ route('ServicePackageEdit', $service_package->tbl_service_package_id) }}" class="mb-6 btn-floating waves-effect waves-light green darken-1"><i class="material-icons">edit</i></a>
                                                                    <?php }

                                                                    if ($permission_data->tbl_role_rights_delete != 0) 
                                                                    { ?>
                                                                        <a href="{{ route('ServicePackageDelete', $service_package->tbl_service_package_id) }}" class="mb-6 btn-floating waves-effect waves-light red accent-2"><i class="material-icons" onclick="return confirm('Are you sure you want to delete this Data?')">delete</i></a>
                                                                    <?php }
                                                                echo '</td>';
                                                                }
                                                            }
                                                            else
                                                            { ?>
                                                                <td>
                                                                    <a href="{{ route('ServicePackageEdit', $service_package->tbl_service_package_id) }}" class="mb-6 btn-floating waves-effect waves-light green darken-1"><i class="material-icons">edit</i>
                                                                    </a>

                                                                    <a href="{{ route('ServicePackageDelete', $service_package->tbl_service_package_id) }}" class="mb-6 btn-floating waves-effect waves-light red accent-2"><i class="material-icons" onclick="return confirm('Are you sure you want to delete this Data?')">delete</i>
                                                                    </a>
                                                                </td>
                                                            <?php }
                                                            ?>
                                                        </tr>
                                                        <?php $i++; ?>
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