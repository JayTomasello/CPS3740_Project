<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

</head>

<?php
include 'dbconfig.php';
?>

<table border="1">
    <thead>
        <tr>
            <th>staffNo</th>
            <th>fName</th>
            <th>lName</th>
            <th>position</th>
            <th>sex</th>
            <th>DOB</th>
            <th>salary</th>
            <th>branchNo</th>
        </tr>
    </thead>
    <tbody>
        <?php

        $sql = "SELECT staffNo, fName, lName, position, sex, DOB, salary, branchNo FROM dreamhome.Staff";
        $result = @mysqli_query($con, $sql);

        if ($result) {
            if (mysqli_num_rows($result) == 0) {
                echo "<br>No record found.\n";
            } else {
                if ($result) {
                    while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

        ?>

                        <tr>
                            <td><?php echo $row["staffNo"] ?></td>
                            <td><?php echo $row["fName"] ?></td>
                            <td><?php echo $row["lName"] ?></td>
                            <td><?php echo $row["position"] ?></td>
                            <?php

                            $sex = $row["sex"];

                            if ($sex == "M") {
                                echo "<td><font color=\"blue\">$sex</font></td>";
                            } else {
                                echo "<td><font color=\"red\">$sex</font></td>";
                            }

                            ?>
                            <td><?php echo $row["DOB"] ?></td>
                            <td><?php echo $row["salary"] ?></td>
                            <td><?php echo $row["branchNo"] ?></td>
                        </tr>

        <?php

                    }
                }
            }
        } else {
            echo "<br>Something wrong. Error: " . mysqli_error($con);
        }

        mysqli_free_result($result);
        mysqli_close($con);

        ?>

    </tbody>

</table>

</html>