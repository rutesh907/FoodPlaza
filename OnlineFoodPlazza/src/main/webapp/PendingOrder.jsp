<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pending Orders</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>

<style type="text/css">
th, td {
	padding: 8px;
	text-align: center;
}

th {
	background-color: #ebdcdcd6;
	border-bottom: 1px solid #0dcaf0;
	text-align: center;
}

tr:nth-child(even) {
	border-bottom: 1px solid #ddd;
}

#tablefood td {
	border-bottom: 1px solid #0dcaf0;
}

tr:nth-child(even):hover {
	background-color: #ebdcdc61;
}

.container tbody {
	background-color: #50e7ceb0;
}

#tablefood th {
	border-collapse: collapse;
	width: 0 1000px;
	text-align: center;
	font-family: sans-serif;
	font-size: 16px;
}

#tablefood tr {
	font-size: 15px;
	font-family: sans-serif;
}
</style></head>
<body>
	<div id="templatemo_container">
		<jsp:include page="Header.jsp"></jsp:include>
		<jsp:include page="Messages.jsp"></jsp:include>
		<table class="table table-success" id="tablefood" style="width: 960px; max-width: 101%;">

			<tr>
				<th>Order No</th>
				<th>Order By</th>
				<th>Order Date</th>
				<th>Bill</th>
				<th>Status</th>
				<th>Action</th>
			</tr>


			<c:forEach var="col" items="${olist}">

				<tr>
					<td>${col.orderId}</td>
					<td>${col.emailId}</td>
					<td>${col.orderDate}</td>
					<td>${col.totalBill}</td>
					<td>${col.orderStatus}</td>

					<td><a class="btn btn-success"
						style="text-decoration: none; color: white;"
						href="OrderServlet?process=UpdateStatus&OrderId=${col.orderId }">Order Delivered</a></td>

				</tr>
			</c:forEach>

		</table>

		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>