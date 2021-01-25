<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<title>Update User</title>
	<style>
		body{
			background-image:url("${pageContext.request.contextPath}/resources/hotel-background.jpg");
			background-size:cover;
		}
		.update-form{
			width:600px;
			background-color:white;
			padding:20px;
			margin:auto;	
			border:2px solid black;
			margin-top:30px;
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
			<a href="#"><button class="btn btn-danger btn-lg">Log Out</button></a>
		</div>
	</div>
	<div class="container">
		<form class="update-form" action="http://localhost:2200/SpringFinalProject/updateUser/${guest.guestId}" method="post">
			<h1>Edit Details</h1>
			<div class="form-group">
				<label for="guestName">Name</label>
				<input class="form-control" type="text" value=${guest.guestName} name="guestName" placeholder="Enter name">
			</div>
			<div class="form-group">
				<label for="email">Email</label>
				<input class="form-control" type="email" value=${guest.email} name="email" placeholder="Enter Email"/>
			</div>
			<div class="form-group">
				<label for="contactNumber">Contact Number</label>
				<input class="form-control" type="text" value=${guest.contactNumber} name="contactNumber" placeholder="Enter Contact number">
			</div>
			<div class="form-group">
				<label for="gender">Gender</label>
				<select class="form-control">
					<option>Male</option>
					<option>Female</option>
				</select>
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<input class="form-control" type="password" value=${guest.password} name="password" placeholder="Enter password"/>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-md btn-success" value="Update Details">
			</div>
		</form>
	</div>
</body>
</html>