<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Admins extends Model
{
    protected $table = 'tbl_admin';
    public $timestamps = false;
    protected $primaryKey = 'id';
    protected $fillable = ['id','name','email','password','remember_token','role_id','location_id'];

}
