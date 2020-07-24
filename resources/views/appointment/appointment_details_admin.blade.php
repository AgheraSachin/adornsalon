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
        <td><b>Payment Status:</b> Client choose to pay £{{$total_amount}} at Adorn Beauty {{$branch_name}} branch</td>
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
      <tr>
        <td><b>No Of Person {{$noofperson}}</b></td>
      </tr>
      <tr>
        <td><b>Extra Comments:</b> {{$comment}}</td>
      </tr>
      <tr> 
        <td valign="top" colspan="3" align="right">Thanks, <br /><a href="http://adorn-beauty.com/">ADORN BEAUTY</a><br /><img src="{{ $message->embed(asset('public/images/logo/sign_logo.jpg')) }}"></td>
      </tr>
    </table>
</body>
</html>