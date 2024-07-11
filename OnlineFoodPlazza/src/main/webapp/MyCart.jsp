<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
</style>
</head>
<body>
	<div id="templatemo_container">
		<jsp:include page="Header.jsp"></jsp:include>
		<jsp:include page="Messages.jsp"></jsp:include>
		<form action="">
		<table class="table table-success" style="font-size: 15px; font-family: sans-serif; max-width: 101%;">
		<tr>
		<th>FOOD NAME</th>
		<th>QUANTITY</th>
		<th>PRICE</th>
		<th>TOTAL PRICE</th>
		</tr>
		
		
		<c:forEach var="clist" items="${cartlist}">
		<tr>
		<td>${clist.foodName}</td>
		<td>${clist.foodQuantity}</td>
		<td>${clist.foodPrice}</td>
		<td>${clist.totalPrice}</td>
		</tr>
		</c:forEach>
		</table>
</form>
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>