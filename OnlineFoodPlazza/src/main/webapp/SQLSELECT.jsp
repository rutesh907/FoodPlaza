<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table {
  border-collapse: collapse;
  width:0 1000px;
  text-align: center;
  
  
}



th, td {
  text-align: left;
  padding: 8px;
  text-align:center;
}

th{
outline-style: dashed;
background-color: #ebdcdcd6;
}

tr:nth-child(even) {
border-bottom: 1px solid #ddd;

  
}

td{
border-bottom: 1px solid #7077e9;

}
tr:nth-child(even):hover{
background-color: #ebdcdc61;
}

.container tbody{
background-color: #50e7ceb0;
}

body {
    /*background: #74ebd5;
    background: -webkit-linear-gradient(to right, #74ebd5, #ACB6E5);
    background: linear-gradient(to right, #74ebd5, #ACB6E5);
    min-height: 100vh;
    color: #fff;*/
	font-family: 'Roboto', sans-serif;
	background-image: url("images/Register_background.jpg");
	background-repeat: no-repeat;
	background-size: cover;

}
</style>
<!-- 
<style type="text/css">

/*
*
* ==========================================
* CUSTOM UTIL CLASSES
* ==========================================
*
*/
.table-fixed tbody {
    height: 300px;
    overflow-y: auto;
    width: 100%;
}

.table-fixed thead,
.table-fixed tbody,
.table-fixed tr,
.table-fixed td,
.table-fixed th {
    display: block;
}

.table-fixed tbody td,
.table-fixed tbody th,
.table-fixed thead > tr > th {
    float: left;
    position: relative;

    &::after {
        content: '';
        clear: both;
        display: block;
    }
}

/*
*
* ==========================================
* FOR DEMO PURPOSES
* ==========================================
*
*/

body {
    background: #74ebd5;
    background: -webkit-linear-gradient(to right, #74ebd5, #ACB6E5);
    background: linear-gradient(to right, #74ebd5, #ACB6E5);
    min-height: 100vh;

}

</style>-->
</head>
<body>
	<sql:setDataSource 
		var="con" 
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/foodplaza" 
		user="root"
		password="SAURABH@22" 
	/>
	
	<sql:query var="data" dataSource="${con }">
	select * from customer;
	</sql:query>
	<h2 style="font-size:30px; text-align: center; text-decoration:underline; ">CUSTOMER LIST</h2>
	<div class="container">	
	<table cellspacing="5" cellpadding="5" align="center">
	<thead>
	<tr >
	<th >NAME</th><th>E-MAIL</th><th>PASSWORD</th><th>ADDRESS</th><th>CONTACT NO</th><th>LOCATION</th>
	</tr>
	</thead>
	
	<c:forEach var="col" items="${data.rows }">
	<tbody>
	<tr>
	<td>${col.custName}</td><td>${col.emailId}</td><td>${col.custPassword}</td><td>${col.custAddress}</td><td>${col.contactNo}</td><td>${col.custLocation}</td>
	</tr>
	</tbody>
	</c:forEach>
	
	</table>
	</div>
</body>
</html>