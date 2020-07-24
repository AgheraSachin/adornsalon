<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Services extends Model
{
    protected $table = 'tbl_services';
    public $timestamps = false;
    protected $primaryKey = 'tbl_services_id';
    protected $fillable = ['tbl_services_id','tbl_services_user_id','tbl_services_name','tbl_services_type','tbl_services_image','tbl_services_duration_time','tbl_services_for','tbl_services_description','tbl_services_enable_online','tbl_services_commission','tbl_services_status','tbl_services_retail_price','tbl_services_special_price','tbl_services_tax','tbl_services_insertdate','tbl_services_location_id'];

}
