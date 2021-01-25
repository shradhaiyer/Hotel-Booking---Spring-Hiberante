<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
 
    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
	 
	<title>Home</title>
	<style>
		body{
			background-image:url("${pageContext.request.contextPath}/resources/login-background.jpg");
			background-size:1500px 800px;
			color:white;
		}
		.nav{
			height:80px;
			width:100%;
			margin-left:30px;
		}
		.shift-text-top{
			margin-top:80px;
		}
		.shift-top{
			margin-top:10px;
		}
		.shift-right{
			padding-right:20px;
		}
		.shift-left{
			padding-left:40px;
		}
		.card{
			color:white;
			padding:20px;
		}
		h1{
			font-weight:600;
		}
		.display-2{
			font-size:50px;
		}
		
	</style>
</head>
<body>
	<div class="nav">
		<h1 class="display-3">ABC Hotels</h1>
	</div>
	<div>
		<div class="row shift-text-top">
			<div class="col-lg-12">
				<h1 class="display-2 text-center">Find And Book Your Hotel</h1>
			</div>
		</div>
  		<div class="row shift-top">
  			<div class="col-lg-12 text-center">
  				<a href="http://localhost:2200/SpringFinalProject/HotelLogin">
  				<button class="btn btn-lg btn-success shift-right">Hotel Provider</button></a>
  			
  				<a href="http://localhost:2200/SpringFinalProject/UserLogin">
  				<button class="btn btn-lg btn-success shift-right">Customer</button></a>
  				
  				<a href="http://localhost:2200/SpringFinalProject/hotels">
  				<button class="btn btn-success btn-lg">View Hotels</button></a>
  			</div>
  		</div>
  	</div>
  	<div class="row shift-text-top shift-left shift-right">
  		<div class="col-lg-4">
  			<div class="card text-center bg-primary">
  				<h1><i class="fa fa-user fa-2x"></i></h1>
	  			<h1 class="card-title">Simplicity</h1>
	  			<h4 class="card-body">Easy to Use and very friendly platform</h4>
	  		</div>
  		</div>
  		<div class="col-lg-4">
  			<div class="card text-center bg-primary">
  				<h1><i class="fa fa-user fa-2x"></i></h1>
  				<h1 class="card-title">Our Services</h1>
  				<h4 class="card-body">24x7 customer services are available</h4>
  			</div>
  		</div>
  		<div class="col-lg-4">
  			<div class="card text-center bg-primary">
  				<h1><i class="fa fa-user fa-2x"></i></h1>
  				<h1 class="card-title">Availablity</h1>
  				<h4 class="card-body">We are available in 10 countries world wide!!</h4>
  			</div>
  		</div>
  		
  	</div>
</body>
</html>