<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Food List</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
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
	padding: 5px;
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

img{
	width: 65px;
	height: 70px;
	margin-left: 18px;
}

</style>
</head>
<body>
	<%
	String login = (String) session.getAttribute("login");
	if (login == null) {
		request.setAttribute("errorMsg", "Please login to have better experience");

	}
	%>

	<div id="templatemo_container">
		<jsp:include page="Header.jsp"></jsp:include>
		<jsp:include page="Messages.jsp"></jsp:include>
		<table class="table table-success" id="tablefood" style="max-width: 101%;">

			<tr>
				<!-- <th>Id</th> -->
				<th style="padding-left: 20px;">Image</th>
				<th>Name</th>
				<th>Type</th>
				<th>Category</th>
				<th>Description</th>
				<th>Price</th>


				<%
				if (login != null) {
				%>
				<th colspan="2" align="center">Action</th>
				<%
				}
				%>
				
			</tr>


			<c:forEach var="col" items="${flist}">

				<tr>
					<!-- <td>${col.foodId}</td> -->
					<td style="padding-left: 20px;"><img src="images/${col.image}" alt=""></td>
					<td>${col.foodName}</td>
					<td>${col.foodType}</td>
					<td>${col.foodCategory}</td>
					<td>${col.foodDesc}</td>
					<td style="padding-right: 20px;">${col.foodPrice}</td>


					<%
					if (login != null && login.equals("admin")) {
					%>


					<td><a class="btn btn-outline-warning"
						style="text-decoration: none;"
						href="foodservlet?process=updateFood&foodId=${col.foodId }">Update</a></td>
					<td><a class="btn btn-danger"
						style="text-decoration: none; color:white;"
						href="foodservlet?process=deleteFood&foodId=${col.foodId }">Delete</a></td>
					<%
					} else if (login != null && login.equals("customer")) {
					%>
					<td><a class="btn btn-outline-warning"
						href="CartServlet?process=addToCart&foodId=${col.foodId}">Add
							to Cart</a></td>
					<%
					}
					%>
				</tr>
			</c:forEach>

		</table>

		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>