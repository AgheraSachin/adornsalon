<!-- BEGIN: SideNav-->
    <aside class="sidenav-main nav-expanded nav-lock nav-collapsible sidenav-light navbar-full sidenav-active-rounded">
        <div class="brand-sidebar">
            <h1 class="logo-wrapper"><a class="brand-logo darken-1" href="{{ route('home') }}"><img src="{{ asset('public/images/logo/icon-logo.png') }}" alt="materialize logo" /><span class="logo-text hide-on-med-and-down sidebar-text">Adorn Beauty</span></a><a class="navbar-toggler" href="#"><i class="material-icons">radio_button_checked</i></a></h1>
        </div>

        <ul class="sidenav sidenav-collapsible leftside-navigation collapsible sidenav-fixed menu-shadow" id="slide-out" data-menu="menu-navigation" data-collapsible="menu-accordion">
            
            <?php
            $admin = DB::table('tbl_admin')->where('id',Auth::user()->id)->select('role_id')->first();

            $permission_data = DB::table('tbl_role_rights')->where('tbl_role_rights_role_id',$admin->role_id)->get();

            if (sizeof($permission_data) != 0) 
            {
                foreach ($permission_data as $key => $value) 
                {
                    if ($value->tbl_role_rights_page_name == 'AdminController' && $value->tbl_role_rights_index != 0) 
                    { ?>
                        <li class="{{ (request()->is('admins*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('admins*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('admins') }}"><i class="material-icons">group</i><span class="menu-title" data-i18n="Admins">Admins</span></a>
                        </li>
                    <?php }

                    if ($value->tbl_role_rights_page_name == 'LocationController' && $value->tbl_role_rights_index != 0) 
                    { ?>
                        <li class="{{ (request()->is('locations*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('locations*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('Locations') }}"><i class="material-icons">location_on</i><span class="menu-title" data-i18n="Contacts">Locations</span></a>
                        </li>
                    <?php }  
                    
                    if ($value->tbl_role_rights_page_name == 'RoleController' && $value->tbl_role_rights_index != 0) 
                    { ?>
                        <li class="{{ (request()->is('roles*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('roles*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('Roles') }}"><i class="material-icons">brightness_low</i><span class="menu-title" data-i18n="Contacts">Roles</span></a>
                        </li>
                    <?php }  

                    if ($value->tbl_role_rights_page_name == 'RoleRightsController' && $value->tbl_role_rights_index != 0) 
                    { ?>
                        <li class="{{ (request()->is('role_rights*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('role_rights*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('RoleRights') }}"><i class="material-icons">brightness_high</i><span class="menu-title" data-i18n="Contacts">Role Rights</span></a>
                        </li>
                    <?php }  

                    if ($value->tbl_role_rights_page_name == 'ServiceController' && $value->tbl_role_rights_index != 0) 
                    { ?>
                        <li class="{{ (request()->is('service*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('service*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('Service') }}"><i class="material-icons">content_cut</i><span class="menu-title" data-i18n="Contacts">Services</span></a>
                        </li>
                    <?php }   

                    if ($value->tbl_role_rights_page_name == 'ServiceTypesController' && $value->tbl_role_rights_index != 0) 
                    { ?>
                        <li class="{{ (request()->is('ser_types*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('ser_types*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('ServiceTypes') }}"><i class="material-icons">spa</i><span class="menu-title" data-i18n="Contacts">Service Types</span></a>
                        </li>
                    <?php } 

                    if ($value->tbl_role_rights_page_name == 'ServicePackageController' && $value->tbl_role_rights_index != 0) 
                    { ?>
                        <li class="{{ (request()->is('package*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('package*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('ServicePackage') }}"><i class="material-icons">queue</i><span class="menu-title" data-i18n="Contacts">Service Package</span></a>
                        </li>
                    <?php }  

                    if ($value->tbl_role_rights_page_name == 'ClientController' && $value->tbl_role_rights_index != 0) 
                    { ?>
                        <li class="{{ (request()->is('client*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('client*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('Client') }}"><i class="material-icons">person_add</i><span class="menu-title" data-i18n="Contacts">Clients</span></a>
                        </li>
                    <?php }  

                    if ($value->tbl_role_rights_page_name == 'StaffController' && $value->tbl_role_rights_index != 0) 
                    { ?>
                        <li class="{{ (request()->is('staff*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('staff*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('Staff') }}"><i class="material-icons">group_add</i><span class="menu-title" data-i18n="Contacts">Staff</span></a>
                        </li>
                    <?php }  

                    if ($value->tbl_role_rights_page_name == 'AppointmentController' && $value->tbl_role_rights_index != 0) 
                    { ?>
                        <li class="{{ (request()->is('calendar*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('calendar*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('Calendar',session()->get('location_id')) }}"><i class="material-icons">today</i><span class="menu-title" data-i18n="Contacts">Book An Appointment</span></a>
                        </li>
                    <?php }

                    if ($value->tbl_role_rights_page_name == 'AppointmentController' && ($value->tbl_role_rights_add != 0 || $value->tbl_role_rights_edit != 0 || $value->tbl_role_rights_delete != 0)) 
                    { ?>
                        <li class="{{ (request()->is('appointment*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('appointment*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('AppointmentIndex') }}"><i class="material-icons">event_note</i><span class="menu-title" data-i18n="Contacts">Appointments</span></a>
                        </li>

                        <li class="{{ (request()->is('group_appointment*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('group_appointment*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('GroupAppView',session()->get('location_id')) }}"><i class="material-icons">event_note</i><span class="menu-title" data-i18n="Contacts">Group Appointments</span></a>
                        </li>
                    <?php }  

                    if ($value->tbl_role_rights_page_name == 'ConsultationFormController' && ($value->tbl_role_rights_add != 0 || $value->tbl_role_rights_edit != 0 || $value->tbl_role_rights_delete != 0)) 
                    { ?>
                        <li class="{{ (request()->is('consultation_form*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('consultation_form*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('ConsultationForm') }}"><i class="material-icons">chrome_reader_mode</i><span class="menu-title" data-i18n="Contacts">Consultation Form</span></a>
                        </li>
                    <?php } 
                }
            }
            else
            { ?>
                <li class="{{ (request()->is('admins*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('admins*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('admins') }}"><i class="material-icons">group</i><span class="menu-title" data-i18n="Admins">Admins</span></a>
                </li>

                <li class="{{ (request()->is('locations*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('locations*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('Locations') }}"><i class="material-icons">location_on</i><span class="menu-title" data-i18n="Contacts">Locations</span></a>
                </li>

                <li class="{{ (request()->is('roles*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('roles*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('Roles') }}"><i class="material-icons">brightness_low</i><span class="menu-title" data-i18n="Contacts">Roles</span></a>
                </li>

                <li class="{{ (request()->is('role_rights*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('role_rights*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('RoleRights') }}"><i class="material-icons">brightness_high</i><span class="menu-title" data-i18n="Contacts">Role Rights</span></a>
                </li>
                
                <li class="{{ (request()->is('service*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('service*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('Service') }}"><i class="material-icons">content_cut</i><span class="menu-title" data-i18n="Contacts">Services</span></a>
                </li>
                
                <li class="{{ (request()->is('ser_types*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('ser_types*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('ServiceTypes') }}"><i class="material-icons">spa</i><span class="menu-title" data-i18n="Contacts">Service Types</span></a>
                </li>

                <li class="{{ (request()->is('package*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('package*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('ServicePackage') }}"><i class="material-icons">queue</i><span class="menu-title" data-i18n="Contacts">Service Package</span></a>
                </li>
                
                <li class="{{ (request()->is('client*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('client*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('Client') }}"><i class="material-icons">person_add</i><span class="menu-title" data-i18n="Contacts">Clients</span></a>
                </li>
                
                <li class="{{ (request()->is('staff*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('staff*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('Staff') }}"><i class="material-icons">group_add</i><span class="menu-title" data-i18n="Contacts">Staff</span></a>
                </li>
                
                <li class="{{ (request()->is('calendar*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('calendar*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('Calendar',session()->get('location_id')) }}"><i class="material-icons">today</i><span class="menu-title" data-i18n="Contacts">Book An Appointment</span></a>
                </li>

                <li class="{{ (request()->is('appointment*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('appointment*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('AppointmentIndex') }}"><i class="material-icons">event_note</i><span class="menu-title" data-i18n="Contacts">Appointments</span></a>
                </li>

                <li class="{{ (request()->is('consultation_form*')) ? 'active' : '' }} bold"><a class="{{ (request()->is('consultation_form*')) ? 'active' : '' }} waves-effect waves-cyan " href="{{ route('ConsultationForm') }}"><i class="material-icons">chrome_reader_mode</i><span class="menu-title" data-i18n="Contacts">Consultation Form</span></a>
                </li>
            <?php } ?>
                
                
        </ul>
        <div class="navigation-background"></div><a class="sidenav-trigger btn-sidenav-toggle btn-floating btn-medium waves-effect waves-light hide-on-large-only" href="#" data-target="slide-out"><i class="material-icons">menu</i></a>
    </aside>
    <!-- END: SideNav-->
