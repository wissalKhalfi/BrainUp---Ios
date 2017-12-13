<?php
$host='localhost';
$username='root';
$pwd='root';
$db="brainUp";
$con=mysqli_connect($host,$username,$pwd,$db) or die('Unable to connect');

mysqli_set_charset($con, 'utf8');

$identifiant = $_GET["identifiant"];
$password = $_GET["password"];

$sqlDoc = "select * from player where username='$identifiant' and password='$password'";
//$queryDoc = mysqli_query( $con , $sqlDoc) ;
$data = array ();
$query=mysqli_query($con,$sqlDoc);

if(mysqli_num_rows($query))
{

  while($row=mysqli_fetch_assoc($query))
  {

    $data['id']=$row['id'];
    $data['username']=$row['username'];
    $data['email']=$row['email'];
    $data['password']=$row['password'];
    $data['country']=$row['country'];
    $data['gender']=$row['gender'];
    $data['birthdate']=$row['birthdate'];
  }

}

header('Content-type: application/json');
echo json_encode($data);
mysqli_close($con); 
?>