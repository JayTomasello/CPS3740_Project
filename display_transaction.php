<HTML>
<?php

# Checks for a cookie to confirm active login
/* if (isset($_COOKIE["Login"]))
    $mylogin = $_COOKIE["Login"];
else
    die("Please login first\n"); */

# Sets up the database connection
include "dbconfig.php";

# Retrieves customer's id from URL
$id = $_GET['customer_id'];

# Retrieves customer's name for display purposes using customer's id
$sql_customer_name = "SELECT name from CPS3740.Customers where id=$id";
$result = mysqli_query($con, $sql_customer_name);
$row = mysqli_fetch_array($result);
$name = $row['name'];

# Retrieves transaction records (if any) for the logged in customer
$sql_transaction = "SELECT m.mid mid, m.code code, m.type type, m.amount amount, m.sid sid, s.name name, m.mydatetime mydatetime, m.note note FROM CPS3740_2023S.Money_tomaselj m, CPS3740.Customers c, CPS3740.Sources s WHERE m.cid = c.id AND s.id = m.sid AND c.id = $id";
$result = mysqli_query($con, $sql_transaction);
$balance = 0;
$transaction_count = 0;

if ($result) {
    if (mysqli_num_rows($result) > 0) {
        $count = mysqli_num_rows($result);
        echo "<a href='logout.php' target=_blank>User logout</a><br>";
        echo "You can only udpdate <b>Note</b> column.<br>";

        # Begins the form to handle update and delete transaction
        echo "<form action='update_transaction.php' method='get'>";
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
                    <th>Delete</th>
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

                        <td><?php echo $row["name"] ?></td>
                        <td><?php echo $row["mydatetime"] ?></td>

                        <!-- Inputs for updating and deleting transactions -->
                        <input type="hidden" name="customer_id[<?php echo $transaction_count ?>]" value="<?php echo $id ?>">
                        <input type="hidden" name="source_id[<?php echo $transaction_count ?>]" value="<?php echo $row["sid"] ?>">
                        <input type="hidden" name="mid[<?php echo $transaction_count ?>]" value="<?php echo $row["mid"] ?>">
                        <td bgcolor="yellow"><input type="text" value="<?php echo $row["note"] ?>" name="cnote[<?php echo $transaction_count ?>]" style="background-color:yellow;"></td>
                        <td><input type="checkbox" name="cdelete[<?php echo $transaction_count ?>]" value="Y"></td>

                    </tr>

        <?php

                    $transaction_count = $transaction_count + 1;
                }
                echo "</tbody>";
                echo "</TABLE>";

                # Displays the current balance of the logged in customer
                if ($balance >= 0) {
                    echo "Total Balance: <font color=\"blue\">$balance</font>";
                } else {
                    echo "Total Balance: <font color=\"red\">-$balance</font>";
                }

                echo "<br><input type='submit' value='Update Transaction'>";
                echo "</form>";
            } else {
                die("No record found for customer: <b>$name</b>");
            }
        } else {
            echo "Something is wrong with SQL:" . mysqli_error($con);
        }

        mysqli_free_result($result);
        mysqli_close($con);

        ?>

</HTML>