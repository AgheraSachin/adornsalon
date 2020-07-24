<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<table width="70%" border="0" cellspacing="1" cellpadding="1" style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px;">
      <tr> 
        <td><center><img src="{{$message->embed(asset('public/images/logo/mail_logo.png'))}}"></center></td>
      </tr>
      <tr> 
        <td colspan="3" align="center" style="border-bottom:1px solid #CCCCCC;"><h3>YOUR APPOINTMENT BOOKING CONFIRMATION WITH ADORN BEAUTY ({{$branch_name}})</h3></td>
      </tr>
      <br>
      <tr> 
        <td>Dear {{$client_name}}</td>
      </tr>
      <tr> 
        <td>Your Appointment has been booked successfully.</td>
      </tr>
      <tr> 
        <td>&nbsp;</td>
      </tr>
      <tr> 
        <td><h3>Booking Information</h3></td>
      </tr>
      <tr> 
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><b>Appointment Reference Number:</b> {{$app_id}}</td>
      </tr>
      <tr>
        <td><b>Payable Amount:</b> £{{$total_amount}}</td>
      </tr>
      <tr>
        <td><b>Pay AT:</b> {{$branch_name}}</td>
      </tr>
      <tr>
        <td><b>Payment Status:</b> You choose to pay £{{$total_amount}} at Adorn Beauty {{$branch_name}} branch</td>
      </tr>
      <tr>
        <td><h4>Appointment Information</h4></td>
      </tr>
      <tr>
        <td><b>{{$appname}}</b></td>
      </tr>
      <tr>
        <td>
          <?php
          foreach ($services as $key => $value) {
            echo $value;
            echo "<br>";
          }
          ?>
        </td>
      </tr>
      <!-- <tr>
        <td><b>No Of Person {{$noofperson}}</b></td>
      </tr> -->
      <tr>
        <td><b>Extra Comments:</b> {{$comment}}</td>
      </tr>
      <tr> 
        <td valign="top" colspan="3" align="right">Thanks, <br /><a href="http://adorn-beauty.com/">ADORN BEAUTY</a><br /><img src="{{ $message->embed(asset('public/images/logo/sign_logo.jpg')) }}"></td>
      </tr>
      <tr>
          <td><b>Important Information:</b></td>
      </tr>
      <tr>
        <td>
            <b>
            1. Client need to arrive 10 minutes prior to their appointment timings.<br>
            2. During busy period your appointment might get delay upto 10 minutes.<br>
            3. We will wait for your for upto 10 minutes. If you will not turn up, we will simply cancel your appointment. If you turn up after 10 minutes, then we will treat you as a walk-in customer only.<br>
            4. If you have paid in advance and did not turn up, we will collect 10% of booking fees from your total treatment cost. (if you turn up after 10 minutes of your appointment, don’t worry we will take you for your appointment but you will have to cooperate with us and stay clam while you wait for your turn.)<br>
            5. If you are unpaid customer, you will not be allowed to book an appointment next time.<br>
            6. Appointment cancellations will be unchangeable if you cancel you appointment at least 24 hours prior to your booking.<br>
            7. Consultation form is designed to serve you precisely. Any data filled by you in the consultation form will be stored securely and will never be shared with any other organisation.
            </b>
          </td>
      </tr>
    </table>
</body>
</html>