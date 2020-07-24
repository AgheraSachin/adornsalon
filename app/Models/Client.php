<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Client extends Model
{
    protected $table = 'tbl_clients';
    public $timestamps = false;
    protected $primaryKey = 'tbl_clients_id';
    protected $fillable = ['tbl_clients_id','tbl_clients_user_id','tbl_clients_first_name','tbl_clients_middle_name','tbl_clients_last_name','tbl_clients_user_name','tbl_clients_unique_id','tbl_clients_email','tbl_clients_mobile','tbl_clients_telephone','tbl_clients_image','tbl_clients_notification','tbl_clients_gender','tbl_clients_referral_source','tbl_clients_birthday','tbl_clients_status','tbl_clients_insertdate','tbl_clients_last_login_at','tbl_clients_location_id','tbl_clients_password','tbl_clients_address','tbl_clients_marital_status','tbl_clients_anniversary_date','tbl_clients_country_code'];

}
