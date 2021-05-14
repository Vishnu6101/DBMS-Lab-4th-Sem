<?php

$con = mysqli_connect("localhost", "root","","formula_1");

$constructor_no = $_POST['Constructor_No'];
$constructor_name = $_POST['Constructor_Name'];
$driver1_no = $_POST['Driver1_No'];
$driver1_name = $_POST['Driver1_Name'];
$driver2_no = $_POST['Driver2_No'];
$driver2_name = $_POST['Driver2_Name'];
$constructor_driver_no = $_POST['Constructor_No_Driver'];
$gpName = $_POST['GP_Name'];

$sql_constructors = "INSERT INTO `CONSTRUCTORS` (`CNo`, `CName`) VALUES ('$constructor_no', '$constructor_name');";

$sql_drivers = "INSERT INTO `DRIVERS` (`DNo`, `DName`, `CNo`, `GPName`) VALUES 
                        ('$driver1_no', '$driver1_name', '$constructor_driver_no', '$gpName'), 
                        ('$driver2_no', '$driver2_name', '$constructor_driver_no', '$gpName');";

$insert_constructors = mysqli_query($con,$sql_constructors);
$insert_drivers = mysqli_query($con,$sql_drivers);

if($sql_constructors && $sql_drivers)
{
    echo "<h3 style= 'text-align : center; font-weight : bold'>"."TEAM REGISTERED SUCCESSFULLY"."</h3>";
}

mysqli_close($con);
?>