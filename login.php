<HTML>
<?php

# Sets up the database connection
include "dbconfig.php";

# Checks for and retrieves username
if (isset($_POST['username']))
    $browser_username = $_POST['username'];
else
    die("Please go to index.html first.");

# Retrieves password
$browser_password = $_POST['password'];

# Retrieves customer details for login and display
$sql_login = "SELECT id, login, password, name, TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS age, img, street, city, zipcode from CPS3740.Customers where login='$browser_username' ";
$result = mysqli_query($con, $sql_login);

if ($result) {
    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_array($result);
        $user_password = $row['password'];

        # Checks inputted password against corresponding password in Customers table
        if ($browser_password == $user_password) {
            $user_name = $row['name'];

            # Sets login cookie for customer
            setcookie("Login", $browser_username, time() + 3600);

            # Link to log customer out
            echo "<a href='logout.php' target=_blank>User logout</a><br>";

            # Customer IP and Browser information
            $ip = $_SERVER['REMOTE_ADDR'];
            $browser_os = $_SERVER['HTTP_USER_AGENT'];
            echo "Your IP: $ip<br>";
            echo "Your Browser and OS: $browser_os<br>";

            # Separates customer's ip into component parts
            $IPv4 = explode(".", $ip);

            # Compares customer's IP address to known Kean IP components
            if (($IPv4[0] == '10') || ($IPv4[0] == '131' && $IPv4[1] == '125')) {
                echo "You are from Kean University.<br>";
            } else {
                echo "You are NOT from Kean University.<br>";
            }

            # Echos customer's name, age, and address information
            echo "Welcome Customer: <b>$user_name</b><br>";
            $age = $row['age'];
            echo "Age: $age<br>";
            $street = $row['street'];
            $city = $row['city'];
            $zipcode = $row['zipcode'];
            echo "Address: $street, $city, $zipcode<br>";

            # Echos customer's uploaded profile image
            echo '<img src="data:image/jpeg;base64,' . base64_encode($row['img']) . '"/><hr>';

            $id = $row['id'];

            # Retrieves transaction records (if any) for the logged in customer
            $sql_transaction = "SELECT m.mid mid, m.code code, m.type type, m.amount amount, s.name name, m.mydatetime mydatetime, m.note note FROM CPS3740_2023S.Money_tomaselj m, CPS3740.Customers c, CPS3740.Sources s WHERE m.cid = c.id AND s.id = m.sid AND c.id = $id ORDER BY m.mydatetime ASC";
            $result = mysqli_query($con, $sql_transaction);
            $balance = 0;

            if ($result) {
                if (mysqli_num_rows($result) > 0) {
                    $count = mysqli_num_rows($result);

                    # Echos the number of transactions associated with the logged in customer
                    echo "There are <b>$count</b> transactions for customer <b>$browser_username</b>:<br>";

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

                                    <td><?php echo $row["name"] ?></td>
                                    <td><?php echo $row["mydatetime"] ?></td>
                                    <td><?php echo $row["note"] ?></td>
                                </tr>

                    <?php

                            }
                            echo "</tbody>";
                            echo "</table>";

                            # Displays balance of the logged in customer
                            if ($balance >= 0) {
                                echo "Total Balance: <font color=\"blue\">$balance</font>";
                            } else {
                                echo "Total Balance: <font color=\"red\">-$balance</font>";
                            }
                        # Else condition for customer having no transaction records
                        } else {
                            echo "No record found for customer: <b>$browser_username</b>";
                        }
                    } else {
                        echo "Something is wrong with SQL:" . mysqli_error($con);
                    }

                    ?>

                    <!-- HTML table to house display, update, add, and search functions -->
                    <br><br>
                    <TABLE border=0>
                        <TR>
                            <TD>
                                <!-- Input form for adding a new transaction -->
                                <form action='add_transaction.php' method='GET'>
                                    <input type='hidden' name='customer_id' value='<?php echo $id ?>'>
                                    <input type='submit' value='Add transaction'>
                                </form>
                            <!-- Link to display and update logged in customer's transactions -->
                            <TD><a href='display_transaction.php?customer_id=<?php echo $id ?>'>Display and update transaction</a>

                        <TR>
                            <TD colspan=2>
                                <!-- Input form to search logged in customer's transactions using keyword -->
                                <form action="search_transaction.php" method="get">
                                    Keyword: <input type="text" name="keyword" required="required">
                                    <input type='hidden' name='customer_id' value='<?php echo $id ?>'>
                                    <input type="submit" value="Search transaction">
                                </form>
                    </TABLE>

        <?php

        # Else condition for wrong password input
        } else {
            die("User $browser_username is in the system, but wrong password!");
        }
    # Else condition for non-existent user
    } else {
        echo "<br>$browser_username does not exist in the database.\n";
    }
} else {
    echo "Something is wrong with SQL:" . mysqli_error($con);
}

mysqli_free_result($result);
mysqli_close($con);

        ?>
        </HTML>