<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<style>
		body{
			background-image:url("${pageContext.request.contextPath}/resources/hotel-background.jpg");
			background-size:cover;
			
		}
		.text-size
		{
			font-size:16px;
			font-weight:600;
		}
		.shift-top{
			margin-top:20px;
		}
		.jumbotron{
			background-color:black;
			opacity:0.75;
			color:white;
		}
		.jumbotron p{
			font-size:6rem;
		}
		.shift-header-top{
			margin-top:100px;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="jumbotron shift-header-top">
			<p class="display-1">Your Hotel Booked!</p>
			<a class="text-size" href="/SpringFinalProject/UserLogin">Please click here to log in and see Details of Booking</a>
		</div>
	</div>
</body>
</html>