<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
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

</head>
<body>
	<div id="templatemo_container">
		<jsp:include page="Header.jsp"></jsp:include>
		<jsp:include page="Messages.jsp"></jsp:include>
		<form action="RegistrationServlet" method="post" style="width: 960px">
			<input type="hidden" name="process" value="addCustomer">

			<table class="table table-success"
				style="font-size: 15px; font-family: sans-serif;">
				<tr>
					<th>Enter First Name :</th>
					<td><input type="text" name="first_name"
						class="form-control form-control-sm"></td>
				</tr>
				<tr>
				<th>Enter Last Name :</th>
					<td><input type="text" name="last_name"
						class="form-control form-control-sm"></td>
				</tr>

				<tr>
					<th>Enter E-mail :</th>
					<td><input type="email" name="emailId"
						class="form-control form-control-sm"></td>
				</tr>

				<tr>
					<th>Enter Your Password :</th>
					<td><input type="password" name="custPassword"
						class="form-control form-control-sm"></td>
				</tr>

				<tr>
					<th>Enter Address :</th>
					<td><textarea rows="2" cols="10" name="custAddress"
							class="form-control form-control-sm"></textarea>
				</tr>

				<tr>
					<th>Enter Contact No :</th>
					<td><input type="text" name="contactNo"
						class="form-control form-control-sm"></td>
				</tr>

				<tr>
					<th>Enter Location :</th>
					<td><input type="text" name="custLocation"
						class="form-control form-control-sm"></td>
				</tr>


				<tr>
					<td align="right"><a href="Login.jsp"><input type="button"
							class="btn btn-warning" value="Sign In"></a></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="submit" class="btn btn-success" id="submit" value="Submit">

					</td>
				</tr>
			</table>

		</form>
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>