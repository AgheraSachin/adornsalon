<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

use App\User;

class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
    */

    use SendsPasswordResetEmails;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    public function showLinkRequestForm()
    {
        return view('auth.forgotpassword');
    }

    public function random_password() 
    {
      $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%&*_';
      $password = array(); 
      $alpha_length = strlen($alphabet) - 1; 
      for ($i = 0; $i < 8; $i++) 
      {
          $n = rand(0, $alpha_length);
          $password[] = $alphabet[$n];
      }
      return implode($password); 
    }

    public function forgotpassword(Request $request)
    {
        $check_user = DB::table('tbl_admin')->where('email',$request->email)->first();

        if (!empty($check_user)) 
        {
            $genrate_password = $this->random_password();

            //print_r($genrate_password);exit();

            $update_password = User::where('email',$request->email)->get();

            //print_r($genrate_password);exit();

            $update_password[0]->password = Hash::make($genrate_password);

            if ($update_password[0]->save()) {
                $data = array(
                    'password' => $genrate_password,
                );

                $credential = array(
                    'from' => 'noreplyappadorn@gmail.com',
                    'to' => $update_password[0]->email,
                    'subject' => 'Your New Genrated Password',
                );


                Mail::send('new_password', $data, function ($message) use ($credential){

                    $message->from($credential['from']);
                    $message->to($credential['to'])->subject($credential['subject']);
                });
                $notification = array(
                    'message' => 'Your password is send to your mail!', 
                    'alert-type' => 'success',
                );

                /*$email = 'Your password is send to your mail.';*/
                return redirect()->route('password.request')->with($notification);
            }
        }
        else 
        {
            $notification = array(
                'message' => 'This email does not match our records, Please enter another!', 
                'alert-type' => 'danger',
            );
            return redirect()->route('password.request')->with($notification);
        }
    }
}
