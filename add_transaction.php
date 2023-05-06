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

# Retrieves transaction amounts and types to calculate customer's balance
$sql_balance_info = "SELECT amount, type from CPS3740_2023S.Money_tomaselj where cid=$id";
$result = mysqli_query($con, $sql_balance_info);
$balance = 0;

if ($result) {
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $type = $row['type'];
            $amount = $row['amount'];

            # Adjusts balance variable based on transaction type
            if ($type == 'D') {
                $balance += $amount;
            } else {
                $balance -= $amount;
            }
            
        }
    }
} else {
    echo "Something is wrong with SQL: " . mysqli_error($con);
}

?>

<a href='logout.php'>User logout</a>
<br>
<br>
<font size=4><b>Add Transaction</b></font>
<br>
<!-- Displays the logged in customer's current balance -->
<b><?php echo $name ?></b> current balance is <b><?php echo $balance ?></b>.
<br>
<!-- Beginning of new transaction information form -->
<form name="input" action="insert_transaction.php" method="get" required="required">
    <input type='hidden' name='customer_id' value='<?php echo $id ?>'>
    Transaction code: <input type="text" name="code" required="required">
    <br><input type='radio' name='type' value='D'>Deposit
    <input type='radio' name='type' value='W' 3>Withdraw
    <br> Amount: <input type="text" name="amount" required="required"><input type='hidden' name='customer_id' value=<?php echo $id ?>>
    <br>Select a Source: <SELECT name='source_id'>
        <?php

        # Retrieves ids and names of transaction sources to populate dropdown menu (select) element
        $sql_sources = "SELECT id, name from CPS3740.Sources";
        $result = mysqli_query($con, $sql_sources);

        # Creates dropdown menu (select) element populated with transaction source options
        if ($result) {
            echo "<option value=''></option>";
            while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                $id = $row['id'];
                $name = $row['name'];
                echo "<option value=$id>$name</option>";
            }
        } else {
            echo "Something is wrong with SQL: " . mysqli_error($con);
        }

        ?>
    </SELECT>
    <BR>Note: <input type='text' name='cnote'>
    <br>
    <input type='submit' value='Submit'>
</form>
</form>

</HTML>