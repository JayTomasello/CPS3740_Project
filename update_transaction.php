<HTML>
<?php

# Checks for a cookie to confirm active login
/* if (isset($_COOKIE["Login"]))
    $mylogin = $_COOKIE["Login"];
else
    die("Please login first\n"); */

# Sets up the database connection
include "dbconfig.php";

# Used to track the number of deleted and updated records
$delete_count = 0;
$update_count = 0;

# Loops through component arrays of transaction records
for($i = 0; $i < count($_GET["customer_id"]); $i++)  {
    $source_id[$i] = $_GET["source_id"][$i];
    $mid[$i] = $_GET["mid"][$i];
    $cnote[$i] = $_GET["cnote"][$i];
    
    # Retrieves the unique code for each transaction
    $sql_get_trans_code = "SELECT code FROM CPS3740_2023S.Money_tomaselj WHERE mid=$mid[$i]";
    $result = mysqli_query($con, $sql_get_trans_code);
    $row = mysqli_fetch_array($result);
    $code = $row['code'];
    
    # Executes when delete is checked
    if (isset($_GET["cdelete"][$i])) {
        # Deletes transaction record from the database with the specified code
        $sql_delete = "DELETE FROM CPS3740_2023S.Money_tomaselj WHERE mid=$mid[$i]";
        $result = mysqli_query($con, $sql_delete);
        # Outputs message if transaction record deleted successfully
        if ($result) {
            echo "The Code $code has been deleted from the database.<br>";
            # Incremented every time transaction record is deleted
            $delete_count++;
        } else {
            die("Something is wrong with SQL: " . mysqli_error($con));
        }
    } else {
        # Retrieves the note value for each transaction record
        $sql_get_transaction = "SELECT note FROM CPS3740_2023S.Money_tomaselj WHERE mid=$mid[$i]";
        $result = mysqli_query($con, $sql_get_transaction);
        if ($result) {
            $row = mysqli_fetch_array($result);
            $note = $row['note'];
            # Executes only when note value has been changed
            if ($note != $cnote[$i]) {
                # Updates the mydatetime and note column values for transaction with specified code
                $sql_update_transaction = "UPDATE CPS3740_2023S.Money_tomaselj SET mydatetime = NOW(), note = '$cnote[$i]' WHERE mid=$mid[$i]";
                $result = mysqli_query($con, $sql_update_transaction);
                # Outputs message if transaction record updated successfully
                if ($result) {
                    echo "The Note for code $code has been updated in the database.<br>";
                    # Incremented every time transaction record is updated
                    $update_count++;
                }
            }
        } else {
            die("Something is wrong with SQL: " . mysqli_error($con));
        }
    }
}

# Outputs the number of deleted and updated records
echo "Deleted Records: " . $delete_count . "<br>";
echo "Updated Records: " . $update_count;

mysqli_close($con);

?>

</HTML>