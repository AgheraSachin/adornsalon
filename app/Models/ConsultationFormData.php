<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class ConsultationFormData extends Model
{
    protected $table = 'tbl_consultationform_data';
    public $timestamps = false;
    protected $primaryKey = 'tbl_consultationform_data_id';
    protected $fillable = ['tbl_consultationform_data_id', 'tbl_consultationform_data_const_id', 'tbl_consultationform_data_client_id', 'tbl_consultationform_data_data', 'tbl_consultationform_data_insertdate', 'tbl_consultationform_data_location_id', 'tbl_service_id', 'url'];

    public function getUrlAttribute($url)
    {
        return 'http://localhost/PHP-PROJECTS/adornsalon/consultant_form/' . $url;
    }

    public function consultFormBuilder()
    {
        return $this->hasOne(ConsultationForm::class, 'tbl_consultation_form_id', 'tbl_consultationform_data_const_id');
    }

    public function client()
    {
        return $this->hasOne(Client::class, 'tbl_clients_id', 'tbl_consultationform_data_client_id');
    }

    public function service(){
        return $this->hasOne(Services::class, 'tbl_services_id', 'tbl_service_id');

    }

}
