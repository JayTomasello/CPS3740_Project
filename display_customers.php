<HTML>
<?php

# Sets up the database connection
include "dbconfig.php";

# Retrieves the information associated with each record in the Customers table
$sql_customer_info = "SELECT id, login, password, name, gender, DOB, street, city, state, zipcode from CPS3740.Customers";
$result = mysqli_query($con, $sql_customer_info);

if ($result) {
    if (mysqli_num_rows($result) > 0) {
        echo "The following customers are in the bank system:<br>";
?>

        <!-- Beginning of display table for customer information -->
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>login</th>
                    <th>password</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>DOB</th>
                    <th>Street</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Zipcode</th>
                </tr>
            </thead>
            <tbody>
                <?php
                while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

                ?>

                    <tr>
                        <td><?php echo $row["id"] ?></td>
                        <td><?php echo $row["login"] ?></td>
                        <td><?php echo $row["password"] ?></td>
                        <td><?php echo $row["name"] ?></td>
                        <td><?php echo $row["gender"] ?></td>
                        <td><?php echo $row["DOB"] ?></td>
                        <td><?php echo $row["street"] ?></td>
                        <td><?php echo $row["city"] ?></td>
                        <td><?php echo $row["state"] ?></td>
                        <td><?php echo $row["zipcode"] ?></td>
                    </tr>

        <?php

                }
                echo "</tbody>";
                echo "</table>";
            
            # Else condition for 0 entries in the Customers table
            } else {
                die("No customer records found!");
            }
        } else {
            echo "Something is wrong with SQL:" . mysqli_error($con);
        }

        mysqli_free_result($result);
        mysqli_close($con);

        ?>

</HTML>