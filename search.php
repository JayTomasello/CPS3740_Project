<?php

if(isset($_COOKIE["Login"]))
    $mylogin = $_COOKIE["Login"];
else
    die("Please login first\n");

include "dbconfig.php";


$con = mysqli_connect($host, $username, $password, $dbname) 
      or die("<br>Cannot connect to DB:$dbname on $host\n");

if (isset($_GET['keyword']))
    $keyword=$_GET['keyword'];
else
    die("Please run from search.html\n");
$sql ="SELECT * from dreamhome.Staff where fname like '%$keyword%' ";
$result = mysqli_query($con, $sql); 


echo "<br>SQL: $sql\n";


if ($result) {
	if (mysqli_num_rows($result)>0) {
		echo "<TABLE border=1>\n";
		echo "<TR><TH>Fname<TH>Sex<TH>Salary";
	    while($row = mysqli_fetch_array($result)){
	        $fname = $row["fName"];
	        $sex= $row["sex"];
	        $salary=$row["salary"];
	        if ($sex =="F")      
	        	$color="red";
	        else
	        	$color="blue";
	        echo "<TR><TD>$fname<TD><font color='$color'> $sex</font><TD>$salary\n";
	    }
	    echo "</TABLE>\n";
	}
	else
		echo "<br>No record found\n";
}
else {
  echo "Something is wrong with SQL:" . mysqli_error($con);	
}
mysqli_free_result($result);
mysqli_close($con);
?>
