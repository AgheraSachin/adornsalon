<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class GroupAppointment extends Model
{
    protected $table = 'tbl_group_appointment';
    public $timestamps = false;
    protected $primaryKey = 'tbl_group_appointment_id';
    protected $fillable = ['tbl_group_appointment_id','tbl_group_appointment_app_id','tbl_group_appointment_service_id','tbl_group_appointment_name','tbl_group_appointment_gender','tbl_group_appointment_date','tbl_group_appointment_starttime','tbl_group_appointment_total_amount','tbl_group_appointment_servicetype_id','tbl_group_appointment_total_amount'];

}
