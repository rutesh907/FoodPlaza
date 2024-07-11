<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Sign Up</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link href="Register_Style.css"  rel="stylesheet" type="text/css">
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
	<div class="signup-form" style="padding: 27px 0;">
	<div class="Crossimage" align="right">
	<jsp:include page="Messages.jsp"></jsp:include>
				<a href="MyIndex.jsp"><img alt="close" src="images/Cross.png"></a>
			</div>
		<form action="RegistrationServlet" method="post" >
		
			<input type="hidden" name="process" value="addCustomer">
			<h2 style="margin:14px 0 15px;">Register</h2>
			<p class="hint-text">Create your account. It's free and only
				takes a minute.</p>
			<div class="form-group">
				<div class="row">
					<div class="col">
						<input type="text" class="form-control" name="first_name"
							placeholder="First Name" required="required">
					</div>
					<div class="col">
						<input type="text" class="form-control" name="last_name"
							placeholder="Last Name" required="required">
					</div>
				</div>
			</div>	
			<div class="form-group">
				<input type="email" class="form-control" name="emailId"
					placeholder="Email" required="required">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="custPassword"
					placeholder="Password" required="required">
			</div>
			<div class="form-group">
			<textarea rows="2" cols="10" name="custAddress"
							class="form-control" placeholder="Address" required="required"></textarea>
			</div>
			
			<div class="form-group">
				<input type="text" class="form-control" name="contactNo"
					placeholder="Contact No" maxlength="10" required="required">
			</div>
			
			<div class="form-group">
				<input type="text" class="form-control" name="custLocation"
					placeholder="Location" required="required">
			</div>
			
			<div class="form-group">
				<button type="submit" class="btn btn-success btn-lg btn-block">Register
					Now</button>
			</div>
		</form>
		<div class="text-center">
			Already have an account? <a href="Login.jsp">Sign in</a>
		</div>
	</div>
</body>
</html>