<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Food Plaza</title>
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
		<div id="templatemo_top_dishes">

			<h1>Recommended Dishes</h1>
			<br>
			<div class="top_dishes_box">
				<img src="images/puran_poli.jpg" alt="image" width="205"
					height="150" />
				<h2>Puran Poli</h2>
				<p>
					Nulla a risus. Ali quam lectus dui, euismod id, volutpat ac,
					fringilla eu, ipsum. <a href="#">Read more...</a>
				</p>
			</div>

			<div class="top_dishes_box">
				<img src="images/ChickenClubSandwitch.jpg" alt="image" width="205"
					height="150"/>
				<h2>Chicken Club Sandwitch</h2>
				<p>
					enjoy cheese sandwich topped with more cheese if required. with butter and green chutney.<a href="#">Read more...</a>
				</p>
			</div>

 
			<div class="top_dishes_box">
				<img src="images/ChickenTikka.jpg" alt="image" width="205"
					height="150"/>
				<h2>Chicken Tikka</h2>
				<p>
					Laoreet id, accumsan nec, dui. Etiam varius. Maecenas sit amet est
					et enim laoreet rutrum. <a href="#">Read more...</a>
				</p>
			</div>

			<div class="top_dishes_box">
				<img src="images/pav_bhaji.jpg" alt="image" width="205"
					height="150"/>
				<h2>Pav Bhaji</h2>
				<p>
					Praesent varius egestas velit. Donec a massa ut pede pulvinar
					vulputate. Nulla et augue. <a href="#">Read more...</a>
				</p>
			</div>

			<div class="cleaner">&nbsp;</div>

		</div>
		<!-- end of top dishes -->

		<div id="templatemo_content">
			<span class="top"></span>
			<div id="templatemo_innter_content">

				<div id="templatemo_content_left">
					<h1>Welcome to our website</h1>
					<img src="images/templatemo_image_05.jpg" alt="image" width="300"
						height="200" />

					<p>Donec malesuada elit vel enim. Lorem ipsum dolor sit amet,
						consectetur adipiscing elit. Suspendisse id velit elementum mi
						egestas ullamcorper. Vivamus nec dui.</p>
					<p>Suspendisse vitae nibh ac nunc mattis blandit. Morbi
						consectetur ullamcorper felis. Nulla nec elit. Aliquam et mauris.
						Ut euismod congue diam.</p>
					<a href="#">Read more...</a>


					<div class="cleaner_with_height">&nbsp;</div>

				</div>
				<!-- end of content left -->

				<div id="templatemo_content_right">
					<h1 style="height: 50px;">What's new?</h1>
					<div class="right_column_section">
						<h2>Special meal for you</h2>
						<img src="images/modak.jpg" alt="image" width="190"
						height="120"/>
						<p>Curabitur turpis. Nulla a risus. Aliquam lectus dui,
							euismod id, volutpat ac, fringilla eu, ipsum.</p>
						<a href="#">Read more...</a>
					</div>

				</div>
				<!-- end of content right -->
				<div class="cleaner">&nbsp;</div>
			</div>
			<div class="cleaner" style="background: #fff;">&nbsp;</div>
		</div>

		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>