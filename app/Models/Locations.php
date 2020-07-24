<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Locations extends Model
{
    protected $table = 'tbl_locations';
    public $timestamps = false;
    protected $primaryKey = 'tbl_locations_id';
    protected $fillable = ['tbl_locations_id','tbl_locations_name','tbl_locations_contact_person','tbl_locations_number','tbl_locations_email','tbl_locations_full_address','tbl_locations_insertdate','tbl_locations_start_time','tbl_locations_end_time','tbl_locations_status'];

}
