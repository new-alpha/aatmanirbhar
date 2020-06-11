<?php
    include "connect.php";
    $id=$_POST['item_id'];
	header('location:vendor_dashboard.php');
	$sql = "delete from catalog where item_id='$id'";
	$result1  = $conn->query($sql);
?>