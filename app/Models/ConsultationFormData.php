<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class ConsultationFormData extends Model
{
    protected $table = 'tbl_consultationform_data';
    public $timestamps = false;
    protected $primaryKey = 'tbl_consultationform_data_id';
    protected $fillable = ['tbl_consultationform_data_id','tbl_consultationform_data_const_id','tbl_consultationform_data_client_id','tbl_consultationform_data_data','tbl_consultationform_data_insertdate','tbl_consultationform_data_location_id'];

}
