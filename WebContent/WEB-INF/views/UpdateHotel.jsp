<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
	<title>Insert title here</title>
	<style>
		body{
			background-image:url("${pageContext.request.contextPath}/resources/hotel-background.jpg");
			background-size:cover;
		}
		::placeholder{
			color:black;
		}
		.registration-page{
			background-color:white;
			border:2px solid black;
			margin:auto;
			margin-top:100px;
			width:600px;
			padding-left:30px;
			padding-right:30px;
			padding-top:20px;
			padding-bottom:20px;
		}
		.display-1{
			font-size:40px;
		}
		i{
			border:3px solid black;
			border-radius:100%;
			padding:20px;
		}
		.web-header{
			float:left;
			padding-left:60px;
		}
		.web-header h1{
			font-weight:600;
			color:black;
		}
		.logout-pos{
			display:inline;
			float:right;
			padding-right:60px;
			padding-top:30px;
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
	</div>
	<div class="container">
		<form class="registration-page" action="http://localhost:2200/SpringFinalProject/updateHotel/${hotel.hotelId}" method="post">
			<h1 class="display-1 text-center">Update Profile</h1>
			<h1 class="display-1 text-center"><i class="fa fa-user"></i></h1>
			<div class="form-group">
				<label>Hotel Name</label>
				<input class="form-control" type="text" value=${hotel.hotelName} name="hotelName" placeholder="Enter your name">
			</div>
         	<div class="form-group">
         		<label>Contact Number</label>
         		<input class="form-control" type="text"  value=${hotel.contactNumber} name="contactNumber">
         	</div>
         	<div class="form-group">
         		<label>Street Address</label>
         		<input class="form-control" type="text"  value=${hotel.address.street} name="street">
         	</div>
         	<div class="form-group">
         		<label>City</label>
         		<input class="form-control" type="text"  value=${hotel.address.city} name="city">
         	</div>
         	<div class="form-group">
         		<label>State</label>
         		<input class="form-control" type="text"  value=${hotel.address.state} name="state">
         	</div>
         	<div class="form-group">
         		<label>PinCode</label>
         		<input class="form-control" type="text"  value=${hotel.address.pincode} name="pincode">
         	</div>
         	<div class="form-group">
         		<label>No Of Rooms</label>
         		<input class="form-control" type="text"  value=${hotel.noOfRooms} name="noOfRooms">
         	</div>
        	<div class="form-group">
        		<label>Room Cost Per Day</label>
        		<input class="form-control" type="text"  value=${hotel.room_cost_perDay} name="room_cost_perDay">
        	</div>
         	<div class="form-group">
         		<label>Password</label>
         		<input class="form-control" type="text"  value=${hotel.password} name="password">
         	</div>
         	<div class="form-group">
         		<input type="submit" class="btn btn-success btn-md" value="Update"/>
         	</div>
    	</form>
	</div>
</body>
</html>