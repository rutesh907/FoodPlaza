<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link href="Register_Style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
	color: #fff;
	font-family: 'Roboto', sans-serif;
}
</style>
</head>
<body>
<jsp:include page="Messages.jsp"></jsp:include>
	<div class="signup-form" style="padding: 130px 0; width: 430px;">
		<form action="LoginServlet" method="post">
			<div class="Crossimage" align="right" style="margin:-16px -13px; padding:0px;'">
				<a href="MyIndex.jsp"><img alt="close" src="images/Cross.png"></a>
			</div>
			<h2 style="margin:12px 0 15px;">Sign In</h2>

			<div class="form-group">
				<input type="email" class="form-control" name="emailId"
					placeholder="Email" required="required">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="custPassword"
					placeholder="Password" required="required">
			</div>

			<div class="form-group">
				<button type="submit" class="btn btn-success btn-lg btn-block">Login</button>
			</div>
			<div class="form-group">
				<button type="reset" class="btn1 btn-warning btn-lg btn-block">Clear</button>
			</div>
		</form>
		<div class="text-center">
			Create New Account? <a href="Customer_Registration.jsp">Sign Up</a>
		</div>
	</div>
</body>
</html>