<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Information</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
	rel="stylesheet">
<style type="text/css">
body {
	background-color: #eee;
}

body:after {
	height: 100vh;
	width: 100%;
	content: '';
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	background: url("images/fooddeliverybg.jpg") no-repeat center;
	background-size: cover;
	z-index: -1;
}

.card {
	background-color: #f2f3f7e6;
	border: none;
	border-radius: 16px;
	margin-top: 51px;
	height: 448px;
	width: 448px;
}

.info {
	line-height: 19px;
	margin-top: 15px;
}

.name {
	color: #4c40e0;
	font-size: 18px;
	font-weight: 600;
}

.order {
	font-size: 14px;
	font-weight: 400;
	color: #073984;
}

.detail {
	line-height: 19px;
}

.summery {
	color: #f408b8;
	font-weight: 400;
	font-size: 13px;
}

}
.text {
	line-height: 15px;
}

.new {
	color: #000;
	font-size: 14px;
	font-weight: 600;
}

.money {
	font-size: 14px;
	font-weight: 500;
}

.address {
	color: #f910ad;
	font-weight: 500;
	font-size: 14px;
	margin-bottom: 5px;
}

.last {
	font-size: 10px;
	font-weight: 500;
}

.address-line {
	color: #4C40E0;
	font-size: 11px;
	font-weight: 700;
}

.Crossimage {
	margin: 0px;
	margin-top: -13px;
	margin-right: -10px;
	float: right;
}

img {
	width: 30px;
}
</style>

</head>
<body>
	<div class="container mt-5 d-flex justify-content-center">
		<div class="card p-4 ">
			<div class="Crossimage" align="right">
				<a href="OrderServlet?process=ShowMyOrders"><img alt="close"
					src="images/Cross.png"></a>
			</div>
			<div
				class="first d-flex justify-content-between align-items-center mb-3"
				style="margin-top: 0px;">
				<div class="info">
					<span class="d-block name">Thank you, ${custObj.custName}.</span> <span
						class="order">Order No - ${orderObj.orderId }</span>

				</div>

				<img src="https://i.imgur.com/NiAVkEw.png" width="40" />


			</div>
			<div class="detail">
				<span class="d-block summery">Your order has been dispatched.
					we are delivering you order.</span>
			</div>
			<hr>
			<div class="text">
				<span class="d-block address mb-1"><a style="color: black;">Ordered
						By :</a> ${custObj.custName}</span>
			</div>
			<span class="d-block address"><a style="color: black;">Address
					:</a> ${custObj.custAddress }</span> <span class="d-block address mb"><a
				style="color: black;">Phone No :</a> ${custObj.contactNo }</span> <span
				class="d-block address mb" style="margin-bottom: 18px;"><a
				style="color: black;">Date & Time :</a> ${orderObj.orderDate}</span>

			<div class="  money d-flex flex-row mt-2 align-items-center">
				<img src="https://i.imgur.com/ppwgjMU.png" width="20" /> <span
					class="ml-2">Cash on Delivery</span>
				<div class="text t1" style="margin-left: 168px;">
					Total Amount<br> <span class="d-block" style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;
						Rs. ${orderObj.totalBill}</span>
				</div>
			</div>
			<div class="last d-flex align-items-center mt-2">
				<span class="address-line"><a
					href="RegistrationServlet?process=updateCustomer"
					style="text-decoration: none;">CHANGE MY DELIVERY ADDRESS</a></span>

			</div>
		</div>
	</div>
</body>
</html>