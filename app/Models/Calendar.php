<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Calendar extends Model
{
    protected $table = 'tbl_events';
    public $timestamps = false;
    protected $primaryKey = 'tbl_events_id';
    protected $fillable = ['tbl_events_id','tbl_events_title','tbl_events_startdate','tbl_events_enddate','tbl_events_insertdate'];

}
