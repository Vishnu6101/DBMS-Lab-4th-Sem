<?php

$con = mysqli_connect("localhost", "root","","formula_1");

if(isset($_POST['Constructor_No']) && isset($_POST['Constructor_Name']) && isset($_POST['C_Podiums']) && isset($_POST['C_Wins']))
{
    $constructor_no = $_POST['Constructor_No'];
    $constructor_name = $_POST['Constructor_Name'];
    $cPodiums = $_POST['C_Podiums'];
    $cWins = $_POST['C_Wins'];

    $update_constructor = "UPDATE `CONSTRUCTORS` SET `CPodiums` = $cPodiums, `CWins` = $cWins WHERE `CNo` = $constructor_no AND `CName` = '$constructor_name';";

    $exec_update_constructor = mysqli_query($con, $update_constructor);

    if($exec_update_constructor)
    {
        echo "<h3 style= 'text-align : center; font-weight : bold'>"."$constructor_name's DETAILS UPDATED SUCCESSFULLY"."</h3>";
    }
}

else if(isset($_POST['Driver_No']) && isset($_POST['Driver_Name']) && isset($_POST['D_Podiums']) && isset($_POST['D_Wins']))
{
    $driver_no = $_POST['Driver_No'];
    $driver_name = $_POST['Driver_Name'];
    $dPodiums = $_POST['D_Podiums'];
    $dWins = $_POST['D_Wins'];

    $update_driver = "UPDATE `DRIVERS` SET `DPodiums` = $dPodiums, `DWins` = $dWins WHERE `DNo` = $driver_no AND `DName` = '$driver_name';";

    $exec_update_driver = mysqli_query($con, $update_driver);

    if($exec_update_driver)
    {
        echo "<h3 style= 'text-align : center; font-weight : bold'>"."$driver_name's DETAILS UPDATED SUCCESSFULLY"."</h3>";
    }
}

mysqli_close($con);
?>