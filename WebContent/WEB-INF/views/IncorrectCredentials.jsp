<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
			<p class="display-1">Incorrect UserId and Password</p>
		</div>
	</div>
</body>
</html>