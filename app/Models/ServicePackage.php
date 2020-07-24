<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class ServicePackage extends Model
{
    protected $table = 'tbl_service_package';
    public $timestamps = false;
    protected $primaryKey = 'tbl_service_package_id';
    protected $fillable = ['tbl_service_package_id','tbl_service_package_user_id','tbl_service_package_unique_id','tbl_service_package_name','tbl_service_package_service_id','tbl_service_package_price','tbl_service_package_special_price','tbl_service_package_description','tbl_service_package_special_note','tbl_service_package_months','tbl_service_package_image','tbl_service_package_status','tbl_service_package_insertdate','tbl_service_package_location_id'];

}
