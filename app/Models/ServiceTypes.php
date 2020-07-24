<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class ServiceTypes extends Model
{
    protected $table = 'tbl_service_types';
    public $timestamps = false;
    protected $primaryKey = 'tbl_service_types_id';
    protected $fillable = ['tbl_service_types_id','tbl_service_types_types','tbl_service_types_description','tbl_service_types_insertdate','tbl_service_types_updatedate','tbl_service_types_location_id','tbl_service_types_status'];

}
