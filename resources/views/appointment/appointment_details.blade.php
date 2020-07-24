<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<p>Hello, {{$client_name}}</p>
<p>Thank You for Booking Appointment</p>
<p>Your Appointment Details is given below</p>
<p>Date: {{$app_date}}</p>
<p>Time: {{$app_start_time.'-'.$app_end_time}}</p>
<p>Staff Name: {{$staff_name}}</p>
<p>Treatment Name: {{rtrim($select_services,',')}}</p>
</body>
</html>