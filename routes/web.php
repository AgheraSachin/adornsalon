<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});

Route::post('forgotpassword', 'Auth\ForgotPasswordController@forgotpassword')->name('ForgotPassword');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');


//Admins
Route::get('admins', 'AdminController@index')->name('admins');
Route::get('admins/add', 'AdminController@add')->name('AdminAdd');
Route::post('admins/store', 'AdminController@create')->name('AdminStore');
Route::get('admins/edit/{id}', 'AdminController@edit')->name('AdminEdit');
Route::patch('admins/update/{id}', 'AdminController@update')->name('AdminUpdate');
Route::get('admins/delete/{id}', 'AdminController@delete')->name('AdminDelete');

//Roles
Route::get('roles', 'RoleController@index')->name('Roles');
Route::get('roles/add', 'RoleController@add')->name('RolesAdd');
Route::post('roles/store', 'RoleController@create')->name('RolesStore');
Route::get('roles/edit/{id}', 'RoleController@edit')->name('RolesEdit');
Route::patch('roles/update/{id}', 'RoleController@update')->name('RolesUpdate');
Route::get('roles/delete/{id}', 'RoleController@delete')->name('RolesDelete');

//Role Rights
Route::get('role_rights', 'RoleRightsController@index')->name('RoleRights');
Route::post('role_rights/store', 'RoleRightsController@store')->name('RoleRightsStore');
Route::post('role_rights/role_data', 'RoleRightsController@role_data')->name('RoleRightsRoleData');

//Service Types
Route::get('ser_types', 'ServiceTypesController@index')->name('ServiceTypes');
Route::get('ser_types/add', 'ServiceTypesController@add')->name('ServiceTypesAdd');
Route::post('ser_types/create', 'ServiceTypesController@create')->name('ServiceTypesStore');
Route::get('ser_types/edit/{id}', 'ServiceTypesController@edit')->name('ServiceTypesEdit');
Route::patch('ser_types/update/{id}', 'ServiceTypesController@update')->name('ServiceTypesUpdate');
Route::get('ser_types/delete/{id}', 'ServiceTypesController@delete')->name('ServiceTypesDelete');
Route::get('ser_types/active/{id}', 'ServiceTypesController@active')->name('ServiceTypeStatusActive');
Route::get('ser_types/inactive/{id}', 'ServiceTypesController@inactive')->name('ServiceTypeStatusInactive');

//Locations
Route::get('locations', 'LocationController@index')->name('Locations');
Route::get('locations/add', 'LocationController@add')->name('LocationsAdd');
Route::post('locations/create', 'LocationController@create')->name('LocationsStore');
Route::get('locations/edit/{id}', 'LocationController@edit')->name('LocationsEdit');
Route::patch('locations/update/{id}', 'LocationController@update')->name('LocationsUpdate');
Route::get('locations/delete/{id}', 'LocationController@delete')->name('LocationsDelete');
Route::post('location_change', 'LocationController@change')->name('ChangeLocation');
Route::get('locations/active/{id}', 'LocationController@active')->name('LocationStatusActive');
Route::get('locations/inactive/{id}', 'LocationController@inactive')->name('LocationStatusInactive');

//Services for appointment
Route::get('service', 'ServiceController@index')->name('Service');
Route::get('service/add', 'ServiceController@add')->name('ServiceAdd');
Route::post('service/create', 'ServiceController@create')->name('ServiceStore');
Route::get('service/edit/{id}', 'ServiceController@edit')->name('ServiceEdit');
Route::patch('service/update/{id}', 'ServiceController@update')->name('ServiceUpdate');
Route::get('service/delete/{id}', 'ServiceController@delete')->name('ServiceDelete');

//Services Package
Route::get('package', 'ServicePackageController@index')->name('ServicePackage');
Route::get('package/add', 'ServicePackageController@add')->name('ServicePackageAdd');
Route::post('package/create', 'ServicePackageController@create')->name('ServicePackageStore');
Route::get('package/edit/{id}', 'ServicePackageController@edit')->name('ServicePackageEdit');
Route::patch('package/update/{id}', 'ServicePackageController@update')->name('ServicePackageUpdate');
Route::get('package/delete/{id}', 'ServicePackageController@delete')->name('ServicePackageDelete');

//Clients for Appointment
Route::get('client', 'ClientController@index')->name('Client');
Route::get('client/add', 'ClientController@add')->name('ClientAdd');
Route::post('client/create', 'ClientController@create')->name('ClientStore');
Route::get('client/edit/{id}', 'ClientController@edit')->name('ClientEdit');
Route::patch('client/update/{id}', 'ClientController@update')->name('ClientUpdate');
Route::get('client/delete/{id}', 'ClientController@delete')->name('ClientDelete');
Route::get('client/active/{id}', 'ClientController@active')->name('ClientStatusActive');
Route::get('client/inactive/{id}', 'ClientController@inactive')->name('ClientStatusInactive');

//Staff for Appointment
Route::get('staff', 'StaffController@index')->name('Staff');
Route::get('staff/add', 'StaffController@add')->name('StaffAdd');
Route::post('staff/create', 'StaffController@create')->name('StaffStore');
Route::get('staff/edit/{id}', 'StaffController@edit')->name('StaffEdit');
Route::patch('staff/update/{id}', 'StaffController@update')->name('StaffUpdate');
Route::get('staff/delete/{id}', 'StaffController@delete')->name('StaffDelete');
Route::get('staff/active/{id}', 'StaffController@active')->name('StaffStatusActive');
Route::get('staff/inactive/{id}', 'StaffController@inactive')->name('StaffStatusInactive');

//Appointment
Route::get('calendar/{id}', 'AppointmentController@index')->name('Calendar');
Route::post('calendar/create', 'AppointmentController@add')->name('CalendarCreate');
Route::post('calendar/update', 'AppointmentController@edit')->name('CalendarUpdate');
Route::post('calendar/delete', 'AppointmentController@delete')->name('CalendarDelete');
Route::post('calendar/date_update', 'AppointmentController@date_update')->name('CalendarDateUpdate');
Route::post('calendar/staff_service', 'AppointmentController@SelectServices')->name('SelectServices');
Route::post('calendar/service_id', 'AppointmentController@ServiceByID')->name('SelectServiceByID');
Route::post('calendar/service_time', 'AppointmentController@ServiceByTime')->name('SelectServiceTime');

Route::get('appointment/list', 'AppointmentController@appointmentlist')->name('AppointmentIndex');
Route::post('appointment/staff_list', 'AppointmentController@stafflist')->name('StaffListApp');
Route::post('appointment/viewdeatils', 'AppointmentController@viewdeatils')->name('ViewDeatils');

Route::get('group_appointment/{id}', 'GroupAppointmentController@index')->name('GroupAppView');
Route::post('group_appointment/servicetypes', 'GroupAppointmentController@servicetypes_services')->name('ServicetypesServices');
Route::post('group_appointment/create', 'GroupAppointmentController@add')->name('GroupAppAdd');
Route::post('group_appointment/ser_amount', 'GroupAppointmentController@service_amount')->name('ServiceGrpAmount');
Route::post('group_appointment/update', 'GroupAppointmentController@edit')->name('GroupAppEdit');

//Consultation Form

Route::get('consultation_form', 'ConsultationFormController@index')->name('ConsultationForm');
Route::get('consultation_form/add', 'ConsultationFormController@add')->name('ConsultationFormAdd');
Route::post('consultation_form/create', 'ConsultationFormController@create')->name('ConsultationFormStore');
Route::get('consultation_form/edit/{id}', 'ConsultationFormController@edit')->name('ConsultationFormEdit');
Route::post('consultation_form/get_data', 'ConsultationFormController@getData')->name('ConsultationFormGetData');
Route::post('consultation_form/update', 'ConsultationFormController@update')->name('ConsultationFormUpdated');
Route::get('consultation_form/delete/{id}', 'ConsultationFormController@delete')->name('ConsultationFormDelete');
Route::get('consultation_form/view/{id}', 'ConsultationFormController@view')->name('ConsultationFormView');

Route::post('consultation_form/add_data', 'ConsultationFormController@adddata')->name('ConsultationFormAddData');
Route::get('consultation_form/view_added_data/{id}', 'ConsultationFormController@viewadddata')->name('ConsultationFormViewAddData');
Route::get('partidata/{id}/{formid}', 'ConsultationFormController@partidata')->name('ConsultationFormPartiData');
Route::post('consultation_form/get_parti_data', 'ConsultationFormController@getpatidata')->name('ConsultationFormGetPartiData');

Route::post('client_consult_form_link', 'ConsultationFormController@getConsultFormLink')->name('consultForm.link');
