<?php 
	require 'connect.php';
	session_start();
	error_reporting(E_ERROR | E_PARSE);

	if(!isset($_SESSION['custid']))
	{
		header('location:customer.php');
	}
	else {
		header('location:customer_dashboard.php');
		if ($_SERVER["REQUEST_METHOD"] == "POST"){
			if(isset($_POST['addCartBtn']) && isset($_POST['item_id']) && isset($_POST['item_quantity']) && isset($_POST['item_name']) && isset($_POST['item_price'])){
		        $item_id = $_POST['item_id'];
		        $res_id = $_POST['res_id'];
		        $user_id = $_SESSION['custid'];
		        $item_quantity = $_POST['item_quantity'];
		        $item_name = $_POST['item_name'];
		        $item_price = $_POST['item_price'];
		        $total_price = $item_price*$item_quantity;

		        $sql="INSERT INTO cart (id, cust_id, vendor_id, item_name, item_qty, item_price, total_price) values ('$item_id', '$user_id', '$res_id', '$item_name', '$item_quantity', '$item_price', '$total_price')";
				$result=$conn->query($sql);
			}
		}
	}
?>