<?php

$con = mysqli_connect("localhost", "root","","formula_1");

$sql_Cparticipants = "SELECT * FROM CONSTRUCTORS;";
$sql_Dparticipants = "SELECT * FROM DRIVERS ORDER BY CNo;";

$display_Constructors = mysqli_query($con,$sql_Cparticipants);
$display_Drivers = mysqli_query($con,$sql_Dparticipants);

if($display_Constructors && $display_Drivers)
{
    echo "<h2 style= 'font-weight : bold; text-align : center'>"."PARTICIPANTS"."</h2>";
    echo "<h4 style= 'font-weight : bold; text-align : center'>"."CONSTRUCTORS"."</h4>";
    echo "<table style= 'margin-left : auto; margin-right : auto; text-align : center'>
    <tr>
    <th>CNo</th>
    <th>CName</th>
    <th>CPodiums</th>
    <th>CWins</th>
    </tr>";

    while($res_Constructors = mysqli_fetch_array($display_Constructors)){
        echo "<tr>";
        echo "<td>".$res_Constructors['CNo']."</td>";
        echo "<td>".$res_Constructors['CName']."</td>";
        echo "<td>".$res_Constructors['CPodiums']."</td>";
        echo "<td>".$res_Constructors['CWins']."</td>";
        echo "</tr>";
    }

    echo "</table>";

    echo "<h4 style= 'font-weight : bold; text-align : center'>"."DRIVERS"."</h4>";
    echo "<table style= 'margin-left : auto; margin-right : auto; text-align : center'>
    <tr>
    <th>CNo</th>
    <th>DNo</th>
    <th>DName</th>
    <th>DPodiums</th>
    <th>DWins</th>
    <th>GPName</th>
    </tr>";

    while($res_Drivers = mysqli_fetch_array($display_Drivers)){
        echo "<tr>";
        echo "<td>".$res_Drivers['CNo']."</td>";
        echo "<td>".$res_Drivers['DNo']."</td>";
        echo "<td>".$res_Drivers['DName']."</td>";
        echo "<td>".$res_Drivers['DPodiums']."</td>";
        echo "<td>".$res_Drivers['DWins']."</td>";
        echo "<td>".$res_Drivers['GPName']."</td>";
        echo "</tr>";
    }

    echo "</table>";
}

mysqli_close($con);
?>