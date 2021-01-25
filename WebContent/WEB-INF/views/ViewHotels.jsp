<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Hotel List</title>
	<style>
		.shift-header-top{
			margin-top:30px;
		}
		body{
			background-image:url("${pageContext.request.contextPath}/resources/hotel-background.jpg");
			background-size:cover;
		}
		.jumbotron{
			background-color:white;
			opacity:0.75;
			color:black;
		}
		.shift-left{
			margin-left:20px;
		}
		.image-size{
			height:300px;
			width:300px;
			border:1px solid black;
		}
		
		.hotel-details{
			padding-left:10px;
		}
		.jumbotron p{
			margin:0;
			font-size:24px;
			font-weight:600;
		}
		h1{
			margin:0;
		}
		.p-100{
			padding-top:140px;
		}
		.text-size{
			font-size:16px;
			font-weight:600;
			color:red;
		}
		.button-pos{
			padding-top:10px;
			padding-left:100px;
		}
		.padding-100{
			padding-left:100px;
		}
		.form-control{
			width:80%;
			height:48px;
			display:inline;
		}
		.web-header{
			float:left;
			padding-left:60px;
			margin-top:30px;
		}
		.web-header h1{
			font-weight:600;
			color:black;
		}
	</style>
</head>
<body>
	<div class="row">
		<div class="web-header">
			<h1>ABC Hotels</h1>
		</div>
	</div>
	<div class="shift-header-top container">
		<c:forEach var="hotel" items="${hotelList}">
			<div class="jumbotron shift-header-top">
					<div class="row">
						<div class="col-lg-4 hotel-pic">
							<img class="image-size" src="${pageContext.request.contextPath}/resources/logo.jpg"/>
							
						</div>	
						<div class="col-lg-8 hotel-details">
							<div class="row">
								<h1>${hotel.hotelName}</h1>
								<p class="text-size text-muted">India,${hotel.address.city}</p>
							</div>
							<div class="row p-100">
								 <div class="col-lg-6">
								 	<p>${hotel.room_cost_perDay}</p>
									<div class="text-size">Per Room Per Night</div>
								 </div>
								 <div class="col-lg-6 button-pos">
								 	<a href="http://localhost:2200/SpringFinalProject/UserLogin"><button class="btn btn-danger btn-lg">Book Hotel</button> </a>
								 </div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</body>
</html>

