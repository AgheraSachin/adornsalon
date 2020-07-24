<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Roles extends Model
{
    protected $table = 'tbl_roles';
    public $timestamps = false;
    protected $primaryKey = 'tbl_roles_id';
    protected $fillable = ['tbl_roles_id','tbl_roles_types','tbl_roles_insertdate','tbl_roles_updatedate'];

}
