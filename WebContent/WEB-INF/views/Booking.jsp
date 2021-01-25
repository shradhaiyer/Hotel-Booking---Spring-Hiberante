<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Booking</title>
	<style>
		body
		{
			background-image:url("${pageContext.request.contextPath}/resources/hotel-background.jpg");
			background-size:cover;
		}
		.biling-page
		{
			background-color:black;
			opacity:0.75;
			padding:30px;
			border:2px solid black;
			color:white;
		}
		.display-2
		{
			font-size:5rem
		}
		.display-5
		{
			font-size:2rem;
		}
		.shift-header-top
		{
			margin-top:100px;
		}
		.shift-top
		{
			margin-top:10px;
		}
		p
		{
			margin:0;
		}
		.text-size
		{
			font-size:16px;
			font-weight:600;
		}
		.top-margin
		{
			margin-top:30px;
		}
		.my-form-control{
			border-top-style: hidden;
		  	border-right-style: hidden;
		  	border-left-style: hidden;
			border-bottom-style: groove;
			color:black;
			background-color:
		}
		.my-form-control:focus
		{
			outline:none;
		}
		.m-3
		{
			margin-top:3rem;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="biling-page shift-header-top">
			<div class="row">
				<div class="col-lg-6">
					<p class="display-2">${hotel.hotelName}</p>
					<p class="text-size text-muted">${hotel.email}</p>
					<p class="text-size text-muted">${hotel.contactNumber}</p>
				</div>
				<div class="col-lg-4 "></div>
				<div class="col-lg-2 shift-top">
					<div class="row">
						<p class="text-size">Address</p>
					</div>
					<div class="row">
						<p class="text-size text-muted">${hotel.address.street}, ${hotel.address.pincode}, ${hotel.address.city}, ${hotel.address.state} </p>
					</div>
					
				</div>
			</div>
			<form action="http://localhost:2200/SpringFinalProject/bookingSuccessful" method="post" class="top-margin">
				<div class="row">
					<div class="col-lg-6">
						<label class="text-primary text-size" for="guestEmail">Billed To:-</label>
						<br />
						<input type="email" class="my-form-control" name="guestEmail" placeholder="Enter your email here" />					
					</div>
					<div class="col-lg-3">
						<label for="checkInDate" class="text-primary text-size">Check-In Date:-</label>
						<br/>
						<input type="date" class="datepicker my-form-control" id="checkInDate" name="checkInDate" placeholder="Enter Date here" />	
					</div>
					<div class="col-lg-3">
						<label for="checkOutDate" class="text-primary text-size">Check-In Date:-</label>
						<br/>
						<input type="date" onChange="getTotalCost()" class="datepicker my-form-control" id="checkOutDate" name="checkOutDate" placeholder="Enter Date here" />	
					</div>
				</div>
				<div class="row top-margin">
					<div class="col-lg-12">
						<table class="table">
							<tr>
								<th>Description</th>
								<th>No of room</th>
								<th>Cost per room</th>
								<th>Line Total</th>
							</tr>
							<tr>
								<td>Room Booked</td>
								<td>1</td>
								<td>2000</td>
								<td>2000.00</td>
							</tr>
						</table>
					</div>
				</div>	
				<div class="row">
					<input type="hidden" name="hotelId" value="${hotel.hotelId }">
					<input type="hidden" name="hotelEmail" value="${hotel.email}">
					<input type="hidden" id="room_cost" name="room_cost_perDay" value="${hotel.room_cost_perDay}">	
				</div>
			
				<div class="row">
					<div class="col-lg-9"></div>
					<P id="get-total-cost" class="col-lg-2 text-size"></P>
				</div>
				<div class="row m-3">
					<div class="col-lg-5"></div>
					<div class="col-lg-2 ">
						<input type="submit" class="btn btn-md btn-block btn-success" value="Book Hotel">
					</div>
				</div>
			</form>
		</div> 
	</div>
	<script>
		function getTotalCost(){
			var checkInDate=document.getElementById("checkInDate").value;
			var checkOutDate=document.getElementById("checkOutDate").value;
			var room_cost=document.getElementById("room_cost").value;
			var date1=new Date(checkInDate);
			var date2=new Date(checkOutDate);
			
			// To calculate the time difference of two dates 
			var Difference_In_Time = date2.getTime() - date1.getTime(); 
			// To calculate the no. of days between two dates 
			var Difference_In_Days = Math.round(Difference_In_Time / (1000 * 3600 * 24)); 
			document.getElementById("get-total-cost").innerHTML="Total cost:-"+(room_cost*Difference_In_Days);
		}
		
	</script>
</body>

</html>