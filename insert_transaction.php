<HTML>
<?php

# Checks for a cookie to confirm active login
/* if (isset($_COOKIE["Login"]))
    $mylogin = $_COOKIE["Login"];
else
    die("Please login first\n"); */

# Sets up the database connection
include "dbconfig.php";

$code = null;
$type = null;
$amount = null;
$source_id = null;
$cnote = null;

$id = $_GET['customer_id'];

# Each transaction component in checked for
if (isset($_GET['code']))
    $code = $_GET['code'];
else
    die("Please specify a transaction code.");

if (isset($_GET['type']))
    $type = $_GET['type'];
else
    die("Please select a transaction type.");

if (isset($_GET['amount']) && is_numeric($_GET['amount']) && ($_GET['amount'] > 0)) {
    $amount = $_GET['amount'];
    $amount = floatval($amount);
} else {
    die("Please enter a positive number for amount.");
}

if (isset($_GET['source_id'])) {
    $source_id = $_GET['source_id'];
    $source_id = intval($source_id);
} else {
    die("Please specify a transaction source.");
}

if (isset($_GET['cnote']))
    $cnote = $_GET['cnote'];

# Retrieves name of transaction source to verify customer's source input
$sql_sources = "SELECT name from CPS3740.Sources WHERE id=$source_id";
$result = mysqli_query($con, $sql_sources);

if ($result) {
    if (mysqli_num_rows($result) == 0) {
        die("Please specify a VALID transaction source.");
    }
} else {
    die("Something is wrong with SQL: " . mysqli_error($con));
}

# Retrieves transaction amounts and types to calculate customer's balance
$sql_balance_info = "SELECT amount, type from CPS3740_2023S.Money_tomaselj where cid=$id";
$result = mysqli_query($con, $sql_balance_info);
$balance = 0;

if ($result) {
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $type2 = $row['type'];
            $amount2 = $row['amount'];

            # Adjusts balance variable based on transaction type
            if ($type2 == 'D') {
                $balance += $amount2;
            } else {
                $balance -= $amount2;
            }
        }
    }
} else {
    echo "Something is wrong with SQL: " . mysqli_error($con);
}

# Checks for sufficient funds in the case of a withdrawal
if ($type == 'W' && $amount > $balance) {
    die("Insufficient funds to complete withdrawal.");
} else {
    # Inserts new transaction into Money_tomaselj table for logged in customer
    $sql_insert_transaction = "INSERT INTO CPS3740_2023S.Money_tomaselj VALUE(NULL, '$code', $id, '$type', $source_id, $amount, NOW(), '$cnote')";
    $result = mysqli_query($con, $sql_insert_transaction);

    if ($result) {
        echo "Successfully added the transcation.<br>";

        # Retrieves transaction amounts and types to calculate customer's balance
        $sql_balance_info = "SELECT type, amount FROM CPS3740_2023S.Money_tomaselj WHERE cid=$id";
        $result = mysqli_query($con, $sql_balance_info);
        $balance = 0;

        if ($result) {
            while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                $type = $row['type'];
                $amount = $row['amount'];

                # Adjusts balance variable based on transaction type
                if ($type == "D") {
                    $balance += $amount;
                } else {
                    $balance -= $amount;
                }
            }

            # Displays the logged in customer's balance after new transaction inserted
            echo "New balance: $" . $balance;
        } else {
            die("Something is wrong with SQL: " . mysqli_error($con));
        }
    } else {
        die("Something is wrong with SQL: " . mysqli_error($con));
    }
}

mysqli_free_result($result);
mysqli_close($con);

?>

</HTML>