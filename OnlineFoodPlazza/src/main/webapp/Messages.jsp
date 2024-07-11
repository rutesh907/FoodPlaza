<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Messages</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

    <!-- Including jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js">
    </script>

    <!-- Including Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js">
    </script>
</head>
<style>
#alert,#alert1{
position: absolute; 
width: 960px;
height:45px;
font-size: 20px;
font: bold;
font-family: sans-serif;
}


</style>
<body>
<%
String msg=(String)request.getAttribute("msg");
String errorMsg=(String)request.getAttribute("errorMsg");
%>

<%if(msg!=null){%>
<div id="alert" class="alert alert-success">
<%=msg%>
</div>
 <script type="text/javascript">
        setTimeout(function () {

            // Closing the alert
            $('#alert').alert('close');
        }, 5000);
    </script>
<% }else if(errorMsg!=null){%>
<div id="alert1" class="alert alert-danger">
<%=errorMsg%>
</div>
<script type="text/javascript">
        setTimeout(function () {

            // Closing the alert
            $('#alert1').alert('close');
        }, 5000);
    </script>
<%} %>
</body>
</html>