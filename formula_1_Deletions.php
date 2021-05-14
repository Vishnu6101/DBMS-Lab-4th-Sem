<?php

$con = mysqli_connect("localhost", "root","","formula_1");

$constructor_no = $_POST['Constructor_No'];
$constructor_name = $_POST['Constructor_Name'];

$sql_delete_constructor = "DELETE FROM `CONSTRUCTORS` WHERE `CNo` = $constructor_no AND `CName` = '$constructor_name';";

$exec_delete_constructor = mysqli_query($con, $sql_delete_constructor);

if($exec_delete_constructor)
{
    echo "<h3 style= 'text-align : center; font-weight : bold'>"."$constructor_name HAS BEEN DELETED SUCCESSFULLY"."</h3>";
}

mysqli_close($con);

?>