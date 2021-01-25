<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<style>
		body{
			background-image:url("${pageContext.request.contextPath}/resources/hotel-background.jpg");
			background-size:1500px 700px;
		}
		.shift-header-top{
			margin-top:100px;
		}
		.user-hotel-booking{
			padding:10px;
			background-color:black;
			color:white;
			opacity:0.75;
		}
		.shift-top{
			margin-top:10px;
		}
		h1{
			font-size:7rem;
		}
		.logout-pos{
			float:right;
			margin-top:30px;
		}
		a{
			color:white;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="logout-pos">
			<a href="#"><button class="btn btn-danger btn-lg">Log Out</button></a>
		</div>
		<h1 class="shift-header-top text-center">Booking Details</h1>
		<div class="row user-hotel-booking">
			<table class="shift-top table table-bordered table-hovered">
				<tr class="bg-primary">
					<th>BOOKING ID</th>
					<th>HOTEL ID</th>
					<th>REGISTERED EMAIL</th>
					<th>CHECK IN DATE</th>
					<th>CHECK OUT DATE</th>
					<th>COST</th>
				</tr>
				<tbody>
					<c:forEach var="booking" items="${bookingList}">
						<tr>
							<td>${booking.bookingId}</td>
							<td><a href="viewHotel/${booking.hotelId}">${booking.hotelId}</a></td>
							<td>${booking.guestEmail}</td>
							<td>${booking.checkInDate}</td>
							<td>${booking.checkOutDate}</td>
							<td>${booking.cost}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>

</html>