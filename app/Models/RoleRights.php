<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class RoleRights extends Model
{
    protected $table = 'tbl_role_rights';
    public $timestamps = false;
    protected $primaryKey = 'tbl_role_rights_id';
    protected $fillable = ['tbl_role_rights_id','tbl_role_rights_role_id','tbl_role_rights_page_name','tbl_role_rights_index','tbl_role_rights_add','tbl_role_rights_edit','tbl_role_rights_delete','tbl_role_rights_insertdate','tbl_role_rights_updatedate'];

}
