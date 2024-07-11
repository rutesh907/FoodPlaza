<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact us</title>
<link rel="stylesheet" type="text/css" href="contact_style.css">
<link
	href="https://fonts.googleapis.com/css?family=Quicksand&display=swap"
	rel="stylesheet">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">

  <script src="https://kit.fontawesome.com/c32adfdcda.js" crossorigin="anonymous"></script>

</head>
<body>

	<jsp:include page="Messages.jsp"></jsp:include>
<h1 align="center" style="color:#01eaf8; text-decoration: underline;">CONTACT US</h1>
	<div class="container">
		<div class="contact-box">
		
			<div class="left">
			<h2>Reach Us</h2>
			<div class="contact-info">
          <div class="contact-info-item">       
            <div class="contact-info-content">
              <h4>Address</h4>
              <p>B-309, C Wing, SaiShrusti Vatika, Khardipada Road, Khardipada, Thane, Maharashtra-421 204</p>
            </div>
          </div>
          
          <div class="contact-info-item"> 
            <div class="contact-info-content">
              <h4>Phone</h4>
              <p>(+91) 9022255703</p>
            </div>
          </div>
          
          <div class="contact-info-item">    
            <div class="contact-info-content">
              <h4>Email</h4>
             <p>OnlineFoodPlaza2023@gmail.com</p>
            </div>
          </div>
        </div>
					
			</div>
			
			<div class="right">
			<div class="Crossimage" align="right">
				<a href="MyIndex.jsp"><img alt="close" src="images/Cross.png"></a>
			</div>
				<h2>Get In Touch</h2>
				<form action="ReviewServlet" method="post">
				<input type="hidden" name="process" value="addreview">
				<input type="text" class="field" name="CustName" placeholder="Your Name*" required>
					 <input type="email" class="field" name="CustEmail" placeholder="Your Email*" required> 
					<input type="text" class="field" placeholder="Phone" name="CustPhoneNo" maxlength="10">
				<textarea placeholder="Message*" class="field" name="Messages" required></textarea>
				<div class="clearfix"></div>
				<div class="col-lg-12 text-center wow zoomIn" data-wow-duration="1s"
					data-wow-delay="600ms">
					<div id="success"></div>
					<button type="submit" class="btn btn-primary">Send Message</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	
	
</body>
</html>