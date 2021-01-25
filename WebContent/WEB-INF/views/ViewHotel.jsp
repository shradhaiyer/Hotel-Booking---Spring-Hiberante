<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> -->
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>View Hotel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
    <style>
        .main {
            width: 500px;
            margin: auto;
            padding: auto;
            margin-top: 10px;
        }

        .leftDiv {
            float: left;
            width: 42%;
            margin-right: 50px;
            margin-left: 50px;
        }

        .rightDiv {
            float: right;
            width: 42%;
            margin-left: 50px;
            margin-right: 50px;
        }

        .upperDiv{
            width: 90%;
            height: 300px;
            
        }

        nav {
            background-color: #5E4FAA;
        }

        body {
            background-color: #703AFE;
        }
    </style>
</head>
<body>
    <div class=" align-items-center my-3">
        <div class="jumbotron  main  text-center ">
        	<p class="display-6">Registration Successful</p>
            <p class="display-6">${hotel.hotelName}</p>
            <div class="jumbotron main upperDiv">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                      <div class="carousel-item ">
                        <img class="img-rounded d-block w-100" src="${pageContext.request.contextPath}/resources/hotel1.jpg" alt="First slide">
                      </div>
                      <div class="carousel-item active">
                        <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/hotel2.jpg" alt="Second slide">
                      </div>
                      <div class="carousel-item">
                        <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/hotel3.jpg" alt="Third slide">
                      </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div>
            </div>

            <br>
            Email : ${hotel.email}
            <br />
            Contact Number : ${hotel.contactNumber}
            <br />
            Address : ${hotel.address.street}
            <br />
            City : ${hotel.address.city}
            <br />
            State : ${hotel.address.state}
            <br />
            Pincode : ${hotel.address.pincode}
            <br />
            Room cost Per day : ${hotel.room_cost_perDay}
            <br />
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"></script>

</body>

</html>