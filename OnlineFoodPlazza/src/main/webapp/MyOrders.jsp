<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="POJO.OrderFood"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delivered History</title>
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

button{
border:none;
background-color:#d1e7dd;
}
</style>
</head>
<body>
	<div id="templatemo_container">
		<jsp:include page="Header.jsp"></jsp:include>
		<jsp:include page="Messages.jsp"></jsp:include>
		<table class="table table-success" id="tablefood"
			style="width: 960px; max-width: 101%;">

			<tr>
				<th>Order No</th>
				<th>Order Date/Time</th>
				<th>Bill</th>
				<th>Status</th>
				<th colspan="2">Action</th>
			</tr>


			<%
			List<OrderFood> olist = (List<OrderFood>) session.getAttribute("olist");

			for (OrderFood o : olist) {
			%>
			<tr>
				<th><%=o.getOrderId()%></th>
				<th><%=o.getOrderDate().format(DateTimeFormatter.ofPattern("dd-LLL-yyyy  hh:mm a"))%></th>
				<th><%=o.getTotalBill()%></th>
				<th><%=o.getOrderStatus()%></th>
				<th><a
					href="OrderServlet?process=getDetails&orderId=<%=o.getOrderId()%>" style="">Details</a></th>
					
					<% if(o.getOrderStatus().contains("Order confirmed.")) {%>
					<th><a
					href="OrderServlet?process=cancelOrder&orderId=<%=o.getOrderId()%>" style="color: red; text-decoration:none;">Cancel</a></th>
					
					<%} else {%>
					<th><button type="button" disabled="disabled" style="color: green;">Delivered</button></th>
					<%} %>
			</tr>

			<%
			}
			%>
			<!-- 		<c:forEach var="col" items="${olist}">

				<tr>
					<td>${col.orderId}</td>
					<td>${col.orderDate}</td>
					<td>${col.totalBill}</td>
					<td>${col.orderStatus}</td>

				</tr>
			</c:forEach>  -->

		</table>

		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>