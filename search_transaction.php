<HTML>
<?php

# Checks for a cookie to confirm active login
/* if (isset($_COOKIE["Login"]))
    $mylogin = $_COOKIE["Login"];
else
    die("Please login first\n"); */

# Checks for and retrieves keyword input from URL
if (isset($_GET['keyword']))
    $keyword = $_GET['keyword'];
else
    die("Please enter a keyword first.\n");

# Sets up the database connection
include "dbconfig.php";

# Retrieves customer's id from URL
$id = $_GET['customer_id'];

# Retrieves customer's name for display purposes using customer's id
$sql_customer_name = "SELECT name from CPS3740.Customers where id=$id;";
$result = mysqli_query($con, $sql_customer_name);
$row = mysqli_fetch_array($result);
$name = $row['name'];

# If inputted keyword is a *, every record associated with logged in customer displayed
if ($keyword == '*') {
    # Retrieves transaction records (if any) for the logged in customer
    $sql_transactions = "SELECT m.mid mid, m.code code, m.type type, m.amount amount, s.name s_name, m.mydatetime mydatetime, m.note note FROM CPS3740_2023S.Money_tomaselj m, CPS3740.Customers c, CPS3740.Sources s WHERE m.cid = c.id AND s.id = m.sid AND c.id = $id ORDER BY m.mydatetime ASC;";
    $result = mysqli_query($con, $sql_transactions);
    $balance = 0;
    if ($result) {
        if (mysqli_num_rows($result) > 0) {
            echo "The transactions in customer <b>$name</b> records matched keyword <b>$keyword</b> are:<br>";
?>

            <!-- Beginning of display table for customer transaction information -->
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Code</th>
                        <th>Type</th>
                        <th>Amount</th>
                        <th>Source</th>
                        <th>Date Time</th>
                        <th>Note</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    
                    while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

                    ?>

                        <tr>
                            <td><?php echo $row["mid"] ?></td>
                            <td><?php echo $row["code"] ?></td>
                            <?php

                            $type = $row["type"];
                            $amount = $row["amount"];

                            # Displays each transaction type and amount
                            # Adjusts balance variable based on transaction type
                            if ($type == "D") {
                                echo "<td>Deposit</td>";
                                echo "<td><font color=\"blue\">$amount</font></td>";
                                $balance += $amount;
                            } else {
                                echo "<td>Withdraw</td>";
                                echo "<td><font color=\"red\">-$amount</font></td>";
                                $balance -= $amount;
                            }

                            ?>
                            <td><?php echo $row["s_name"] ?></td>
                            <td><?php echo $row["mydatetime"] ?></td>
                            <td><?php echo $row["note"] ?></td>
                        </tr>

                    <?php

                    }
                    echo "</tbody>";
                    echo "</table>";

                    # Displays the current balance of the logged in customer
                    if ($balance >= 0) {
                        echo "Total Balance: <font color=\"blue\">$balance</font>";
                    } else {
                        echo "Total Balance: <font color=\"red\">-$balance</font>";
                    }
                # Else condition for when no records associated with the logged in customer
                } else {
                    die("No record found!");
                }
            } else {
                echo "Something is wrong with SQL:" . mysqli_error($con);
            }
        
        # If inputted keyword is NOT a *, every record associated with logged in customer with a note containing the inputted keyword is displayed
        } else {
            # Retrieves transaction records (if any) for the logged in customer
            $sql_transactions = "SELECT m.mid mid, m.code code, m.type type, m.amount amount, s.name s_name, m.mydatetime mydatetime, m.note note FROM CPS3740_2023S.Money_tomaselj m, CPS3740.Customers c, CPS3740.Sources s WHERE m.cid = c.id AND s.id = m.sid AND c.id = $id AND m.note LIKE '%$keyword%' ORDER BY m.mydatetime ASC;";
            $result = mysqli_query($con, $sql_transactions);
            $balance = 0;
            if ($result) {
                if (mysqli_num_rows($result) > 0) {
                    echo "The transactions in customer <b>$name</b> records matched keyword <b>$keyword</b> are:<br>";
                    ?>

                    <!-- Beginning of display table for customer transaction information -->
                    <table border="1">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Code</th>
                                <th>Type</th>
                                <th>Amount</th>
                                <th>Source</th>
                                <th>Date Time</th>
                                <th>Note</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

                            ?>

                                <tr>
                                    <td><?php echo $row["mid"] ?></td>
                                    <td><?php echo $row["code"] ?></td>
                                    <?php

                                    $type = $row["type"];
                                    $amount = $row["amount"];

                                    # Displays each transaction type and amount
                                    # Adjusts balance variable based on transaction type
                                    if ($type == "D") {
                                        echo "<td>Deposit</td>";
                                        echo "<td><font color=\"blue\">$amount</font></td>";
                                        $balance += $amount;
                                    } else {
                                        echo "<td>Withdraw</td>";
                                        echo "<td><font color=\"red\">-$amount</font></td>";
                                        $balance -= $amount;
                                    }

                                    ?>
                                    <td><?php echo $row["s_name"] ?></td>
                                    <td><?php echo $row["mydatetime"] ?></td>
                                    <td><?php echo $row["note"] ?></td>
                                </tr>

                <?php

                            }
                            echo "</tbody>";
                            echo "</table>";

                            # Displays the current balance of the logged in customer
                            if ($balance >= 0) {
                                echo "Total Balance: <font color=\"blue\">$balance</font>";
                            } else {
                                echo "Total Balance: <font color=\"red\">$balance</font>";
                            }
                        # Else condition for when no records associated with the logged in customer
                        } else {
                            die("No record found!");
                        }
                    } else {
                        echo "Something is wrong with SQL:" . mysqli_error($con);
                    }
                }

                mysqli_free_result($result);
                mysqli_close($con);

                ?>

</HTML>