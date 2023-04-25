<?php
$db = mysqli_connect('localhost' , 'id19769683_user2' , '@Yahya35eae1234' , 'id19769683_name2');

// DELETE CODE
$del_code = filter_var($_POST['id1'], FILTER_SANITIZE_STRING);
@mysqli_query($db,"delete from codes where id=$del_code");


// REST CODE
$rest_code = filter_var($_POST['id0'], FILTER_SANITIZE_STRING);
@mysqli_query($db,"UPDATE codes SET  uuid='' where id=$rest_code");

?>