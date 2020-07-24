<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class ConsultationForm extends Model
{
    protected $table = 'tbl_consultation_form';
    public $timestamps = false;
    protected $primaryKey = 'tbl_consultation_form_id';
    protected $fillable = ['tbl_consultation_form_id','tbl_consultation_form_service_id','tbl_consultation_form_title','tbl_consultation_form_data','tbl_consultation_form_insertdate','tbl_consultation_form_location_id'];

}
