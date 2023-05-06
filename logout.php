<?php

# Expires the cookie immediately
setcookie('Login', '', time() - 3600);

echo "You successfully logout<br><br>";

# Redirects customer back to the index.html
echo "<a href='http://obi.kean.edu/~tomaselj/CPS3740/index.html'>project home page</a>";

?>