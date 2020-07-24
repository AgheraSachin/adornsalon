<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Appointment extends Model
{
    protected $table = 'tbl_appointment';
    public $timestamps = false;
    protected $primaryKey = 'tbl_appointment_id';
    protected $fillable = ['tbl_appointment_id','tbl_appointment_user_id','tbl_appointment_service_id','tbl_appointment_client_id','tbl_appointment_staff_id','tbl_appointment_location_id','tbl_appointment_date','tbl_appointment_start_time','tbl_appointment_end_time','tbl_appointment_comments','tbl_appointment_insertdate','tbl_appointment_total_amount','tbl_appointment_noofperson','tbl_appointment_payment_type','tbl_appointment_group'];
}
