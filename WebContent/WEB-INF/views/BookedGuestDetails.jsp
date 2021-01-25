<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<style>
		.shift-header-top{
			margin-top:30px;
		}
		body{
			background-image:url("${pageContext.request.contextPath}/resources/hotel-background.jpg");
			background-size:cover;
		}
		.logout-pos{
			display:inline;
			float:right;
			margin-right:60px;
			margin-top:30px;
		}
		.web-header{
			float:left;
			padding-left:60px;
			margin-top:10px;
		}
		.web-header h1{
			font-weight:600;
			color:black;
		}
		.container{
			background-color:black;
			padding:20px;
			opacity:0.75;
			color:white;
		}
	</style>
</head>
  
<body>
	<div class="row">
		<div class="web-header">
			<h1>ABC Hotels</h1>
		</div>
		<div class="logout-pos">
			<a href="http://localhost:2200/SpringFinalProject/HotelLogin"><button class="btn btn-danger btn-lg">Log Out</button></a>
		</div>
		<div class="logout-pos">
			<a href="HotelProfile/${id}"><button class="btn btn-danger btn-lg">Update Profile</button></a>
		</div>
	</div>
	<div class="shift-header-top container">
		<table class="table table-bordered table-hovered">
			<tr>
				<th>BOOKING ID</trh>
				<th>HOTEL EMAIL</th>
				<th>GUEST EMAIL</th>
				<th>CHECK IN DATE</th>
				<th>CHECK OUT DATE</th>
				<th>DAYS</th>
				<th>ROOM COST PER DAY</th>
			</tr>
			<tbody>
				<c:forEach var="userDetails" items="${bookedUserDetails }">
				<tr>
					<td>${userDetails.bookingId}</td>
					<td>${userDetails.hotelEmail}</td>
					<td>${userDetails.guestEmail}</td>
					<td>${userDetails.checkInDate}</td>
					<td>${userDetails.checkOutDate}</td>
					<td>${userDetails.days}</td>
					<td>${userDetails.room_cost_perDay}</td>
				</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
</body>
</html>