<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Food Item's</title>
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

</head>
<body>
	<div id="templatemo_container">
		<jsp:include page="Header.jsp"></jsp:include>
		<jsp:include page="Messages.jsp"></jsp:include>

		<form action="foodservlet" method="post" style="width: 960px">
			<input type="hidden" name="process" value="updateFood">

			<table class="table table-success"
				style="font-size: 15px; font-family: sans-serif; max-width: 101%;">

				<tr>
					<th>Enter the Food ID you want to update :</th>
					<td><input type="text" class="form-control form-control-sm"
						name="foodID" value="${foodObj.foodId}" readonly="readonly" ></td>
				</tr>

				<tr>
					<th>Enter Name :</th>
					<td><input type="text" class="form-control form-control-sm"
						name="foodName" value="${foodObj.foodName}"></td>
				</tr>

				<tr>
					<th>Enter Type :</th>
					<td><input type="text" class="form-control form-control-sm"
						name="foodType" value="${foodObj.foodType}"></td>
				</tr>

				<tr>
					<th>Enter Category :</th>
					<td><input type="text" class="form-control form-control-sm"
						name="foodCategory" value="${foodObj.foodCategory}"></td>
				</tr>

				<tr>
					<th>Enter Description :</th>
					<td><input type="text" class="form-control form-control-sm"
						name="foodDesc" value="${foodObj.foodDesc}"></td>
				</tr>

				<tr>
					<th>Enter Price :</th>
					<td><input type="number" class="form-control form-control-sm"
						name="foodPrice" value="${foodObj.foodPrice}"></td>
				</tr>
				<tr>
					<th>Enter Image :</th>
					<td><input type="file" value="${foodObj.image}" class="form-control form-control-sm"
						name="image"></td>
				</tr>


				<tr >
					<td align="right">
						<input type="reset" class="btn btn-danger"
						onclick="UpdateFoodItem.jsp" value="Reset">
					</td>
					<td align="left"><input type="submit" class="btn btn-success"
						value="Update"></td>
				</tr>

			</table>
		</form>

		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>