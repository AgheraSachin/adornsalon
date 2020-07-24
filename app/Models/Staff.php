<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Staff extends Model
{
    protected $table = 'tbl_staff';
    public $timestamps = false;
    protected $primaryKey = 'tbl_staff_id';
    protected $fillable = ['tbl_staff_id','tbl_staff_user_id','tbl_staff_first_name','tbl_staff_last_name','tbl_staff_unique_id','tbl_staff_email','tbl_staff_mobile','tbl_staff_telephone','tbl_staff_image','tbl_staff_type','tbl_staff_emmergency_name','tbl_staff_emmergency_relation','tbl_staff_emmergency_contact','tbl_staff_permission_rights','tbl_staff_enable_online_bookings','tbl_staff_start_date','tbl_staff_end_date','tbl_staff_appointment_color_code','tbl_staff_service_commission','tbl_staff_product_commission','tbl_staff_voucher_commission','tbl_staff_break_time','tbl_staff_salary','tbl_staff_password','tbl_staff_status','tbl_staff_insertdate','tbl_staff_location_id'];

}
