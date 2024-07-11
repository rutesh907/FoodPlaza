<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

	<% 
	String login=null,msg=null,errorMsg=null;
	
	login=(String)session.getAttribute("login");
	msg=(String)session.getAttribute("msg");
	errorMsg=(String)session.getAttribute("errorMsg");
	%>
	
</head>
<body>
	<!--  Free CSS Template by TemplateMo.com  -->

	<div id="templatemo_header" style="width: 960px;">
		<div id="site_title" style="height: 122px;"></div>
	</div>
	<!-- end of header -->

	<div id="templatemo_menu">
		<ul>
			<li class="current"><a href="MyIndex.jsp"><b>Home</b></a></li>
			<li><a href="foodservlet?process=allFood"><b>Food Menus</b></a></li>
			<li><a href="Contact.jsp"><b>Contact</b></a></li>
			
			<%if(login!=null&&login.equals("admin")){ %>
			
			<li><a href="AddFood.jsp"><b>Add Item's</b></a></li>
			<li><a href="OrderServlet?process=confirmOrder"><b>Pending Order's</b></a></li>
			<li><a href="OrderServlet?process=ShowDeliveredList"><b>Delivered Order's</b></a></li>
			<li><a href="ReviewServlet?process=seeReview"><b>Review</b></a></li>
			
			<%} %>
			
			<%if(login!=null&&login.equals("customer")){ %>
			<li><a href="RegistrationServlet?process=updateCustomer"><b>Profile</b></a></li>
			<li><a href="CartServlet?process=showCartList"><b>My Cart</b></a></li>
			<li><a href="OrderServlet?process=ShowMyOrders"><b>My Orders</b></a></li>
			<%} %>
			
			<%if(login==null){ %>
			<li><a href="Customer_Registration.jsp"><b>Register</b></a></li>
			<li><a href="Login.jsp"><b>Login</b></a></li>
			<%} else if(login!=null){ %>
			<li><a href="LoginServlet"><b>LogOut</b></a></li>
			<%} %>
			
		</ul>
	</div>
	<!-- end of menu -->
	
	
	<%if(msg!=null){ %>
	<h2 style="text-align: center; color: lime;"><%=msg %></h2>
	<%}else if(errorMsg!=null){ %>
	<h2 style="text-align: center; color: red;"><%=errorMsg %></h2>
	<%} %>
</body>
</html>
