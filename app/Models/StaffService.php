<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class StaffService extends Model
{
    protected $table = 'tbl_staff_services';
    public $timestamps = false;
    protected $primaryKey = 'tbl_staff_services_id';
    protected $fillable = ['tbl_staff_services_id','tbl_staff_services_user_id','tbl_staff_services_staff_id','tbl_staff_services_service_id','tbl_staff_services_status','tbl_staff_services_insertdate','tbl_staff_services_location_id'];

}
