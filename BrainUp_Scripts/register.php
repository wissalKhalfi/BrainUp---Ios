<?php
//Connecting to database
$host = "localhost";
$username = "root";
$password="root";
$conn=mysql_connect($host,$username,$password)
or die("impossible to connect");
//echo "connected successfully";

mysql_select_db('brainUp');

$username = $_GET["username"];
$email = $_GET["email"];
$password = $_GET["password"];
$country = $_GET["country"];
$gender = $_GET["gender"];
$birthdate = $_GET["birthdate"];
$timestamp = strtotime($birthdate); 
$datee=  date("Y-m-d", $timestamp);
//$dateB = CONVERT(datetime, $birthdate) 
$qry ="INSERT INTO player (username,email,password,country,gender,birthdate) values ('$username', '$email','$password','$country','$gender', '$datee')";
//echo $qry;
$retval = mysql_query($qry);


    if($retval == true)
{
    $response["error"] = 0;
    $response["success"] = 1;
    $response["identifiant"] = $identifiant;
    $response["message"] = "You registered In Successfully";

 }
 else {echo "Failed to insert ".mysql_error();}
header('Content-type: application/json');
echo json_encode($response);
mysql_close($con); 
?>
