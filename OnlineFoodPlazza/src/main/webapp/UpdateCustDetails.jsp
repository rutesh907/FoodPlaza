<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Update Form</title>
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
.signup-form h2:before, .signup-form h2:after {
	content: "";
	height: 2px;
	width: 24%;
	background: #d4d4d4;
	position: absolute;
	top: 50%;
	z-index: 2;
}

</style>
</head>

<body>
<jsp:include page="Messages.jsp"></jsp:include>
	<div class="signup-form" style="padding: 27px 0;">
	<div class="Crossimage" align="right">
				<a href="MyIndex.jsp"><img alt="close" src="images/Cross.png"></a>
			</div>
		<form action="RegistrationServlet" method="post" >
		
			<input type="hidden" name="process" value="updateCustomer">
			
			<h2 style="margin:14px 0 15px;" >Update Details</h2>
			<div class="form-group">
				<input type="email" class="form-control" name="emailId" value="${custObj.emailId}" readonly="readonly">
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col">
						<input type="text" class="form-control" name="full_name"
							placeholder="Full Name" value="${custObj.custName}" required="required">
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<input type="password" class="form-control" name="custPassword"
					placeholder="Password" value="${custObj.custPassword}" required="required">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="custAddress" placeholder="Address" value="${custObj.custAddress}" required="required">
			</div>
			
			<div class="form-group">
				<input type="text" class="form-control" name="contactNo"
					placeholder="Contact No" value="${custObj.contactNo}" maxlength="10" required="required">
			</div>
			
			<div class="form-group">
				<input type="text" class="form-control" name="custLocation"
					placeholder="Location" value="${custObj.custLocation}" required="required">
			</div>
			
			<div class="form-group">
				<button type="submit" class="btn btn-success btn-lg btn-block">Update</button>
				<button type="reset" class="btn1 btn-danger btn-lg btn-block">Reset</button>			
			</div>
		</form>
	</div>
</body>
</html>