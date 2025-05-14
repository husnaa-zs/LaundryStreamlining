<%-- 
    Document   : delivery
    Created on : 25 Mar 2024, 12:05:30 pm
    Author     : husna
--%>

<%@page import="com.mvc.bean.BookingBean"%>
<%-- 
    Document   : payment
    Created on : 21 Mar 2024, 12:34:02 am
    Author     : husna
--%>
<%@ page import="java.sql.*,java.util.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Laundry Service Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;800&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/gh/somanchiu/Keyless-Google-Maps-API@v6.6/mapsJavaScriptAPI.js"
        async defer></script>
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            #map {
                height: 400px;
                width: 100%;
            }
        </style>
    </head>

    <body>

        <!-- Topbar Start -->
        <div class="container-fluid bg-primary py-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-lg-left mb-2 mb-lg-0">
                        <div class="d-inline-flex align-items-center">
                            <a class="text-white pr-3" href="">FAQs</a>
                            <span class="text-white">|</span>
                            <a class="text-white px-3" href="">Help</a>
                            <span class="text-white">|</span>
                            <a class="text-white pl-3" href="">Support</a>
                        </div>
                    </div>
                    <div class="col-md-6 text-center text-lg-right">
                        <div class="d-inline-flex align-items-center">
                            <a class="text-white px-3" href="">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a class="text-white px-3" href="">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a class="text-white px-3" href="">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                            <a class="text-white px-3" href="">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a class="text-white pl-3" href="">
                                <i class="fab fa-youtube"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid position-relative nav-bar p-0">
            <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
                <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0 pl-3 pl-lg-5">
                    <a href="" class="navbar-brand">
                        <h1 class="m-0 text-secondary"><span class="text-primary">Timur</span>Coin Laundry</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                        <div class="navbar-nav ml-auto py-0">
                            <a href="index.html" class="nav-item nav-link">Home</a>
                            <a href="about.html" class="nav-item nav-link active">About</a>
                            <a href="service.html" class="nav-item nav-link">Services</a>
                            <a href="pricing.html" class="nav-item nav-link">Pricing</a>
                            <a href="contact.html" class="nav-item nav-link">Contact</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Page Header Start -->
        <div class="page-header container-fluid bg-secondary pt-2 pt-lg-5 pb-2 mb-5" style="max-height: 200px;">
            <div class="container text-center">
                <h1 class="mb-4 mb-md-0 text-white" style="text-align: left;">Address Details</h1> <!-- Apply inline CSS -->

                <p class="text-white mb-4" style="text-align: left;">
                    Please provide your delivery address below.
                    We ensure the confidentiality and security of your personal information. Your address will only be used for delivery purposes and will not be shared with any third parties
                </p>

            </div>
        </div>
        <!-- Page Header Start -->

        <!-- Features Start -->
        <div class="container-fluid py-5">
            <div class="container">
                <section class="container forms">
                    <div class="payment-summary-box p-4 border">
                        

                        <%
                            Connection connection = null;
                            PreparedStatement preparedStatement = null;
                            ResultSet resultSet = null;
                            try {
                                // Establish a database connection
                                Class.forName("com.mysql.jdbc.Driver");
                                String URL = "jdbc:mysql://localhost:3307/booking";
                                String USER = "root";
                                String PASSWORD = "";
                                connection = DriverManager.getConnection(URL, USER, PASSWORD);

                                // Prepare and execute the SELECT query
                                String sql = "SELECT name, service, delivery, kilo FROM booking";
                                preparedStatement = connection.prepareStatement(sql);
                                resultSet = preparedStatement.executeQuery();

                                // Process the result set and display the data
                                while (resultSet.next()) {
                                    String name = resultSet.getString("name");
                                    String service = resultSet.getString("service");
                                    String delivery = resultSet.getString("delivery");
                                    String kilo = resultSet.getString("kilo");
                        %>
                        <p><strong>Name:</strong> <%= name%></p>
                        <p><strong>Service:</strong> <%= service%></p>
                        <p><strong>Delivery:</strong> <%= delivery%></p>
                        <p><strong>Total of KG:</strong> <%= kilo%></p>
                        
                        
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                // Close resources
                                try {
                                    if (resultSet != null) {
                                        resultSet.close();
                                    }
                                    if (preparedStatement != null) {
                                        preparedStatement.close();
                                    }
                                    if (connection != null) {
                                        connection.close();
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        %>

                        <!-- Your existing payment form content goes here -->

                    </div>

                    <!-- Your existing HTML content goes here -->

                    

                    <form id="addressForm">
                        <label for="address"><p><strong>Address:</strong></p></label><br>
                        <input type="text" id="address" name="address" required style="width: 100%;"><br><br>
                        <!-- Add the pin button -->
                        <button type="button" id="pinButton">Pin Address on Map</button><br><br>
                        <div id="map"></div><br>
                        <button type="submit">Submit</button>
                    </form>
                    <p><strong>Delivery fee:</strong> <span id="deliveryFeeDisplay"></span></p> <!-- Added span element to display delivery fee -->
                    <p><strong>Subtotal:</strong></p>
                    <hr>
                    <p><strong>Total(incl tax):</strong></p>
                    <div class="d-flex justify-content-center w-500">
                        <button class="btn btn-primary btn-block">Proceed to Payment</button>
                    </div>


                </section>

                <div class="row">
                    <div class="col-lg-7 m-0 my-lg-5 pt-0 pt-lg-5 pr-lg-5">

                    </div>
                </div>
            </div>
        </div>

        <!-- Features End -->
        <!-- Footer Start -->
        <div class="container-fluid bg-primary text-white mt-5 pt-5 px-sm-3 px-md-5">
            <div class="row pt-5">
                <div class="col-lg-3 col-md-6 mb-5">
                    <a href=""><h1 class="text-secondary mb-3"><span class="text-white">Pantai Timur</span>Coin Laundry</h1></a>
                    <p>Join our community </p>
                    <div class="d-flex justify-content-start mt-4">
                        <a class="btn btn-outline-light rounded-circle text-center mr-2 px-0" style="width: 38px; height: 38px;" href="#"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-outline-light rounded-circle text-center mr-2 px-0" style="width: 38px; height: 38px;" href="#"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-light rounded-circle text-center mr-2 px-0" style="width: 38px; height: 38px;" href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a class="btn btn-outline-light rounded-circle text-center mr-2 px-0" style="width: 38px; height: 38px;" href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-5">
                    <h4 class="text-white mb-4">Find us at</h4>
                    <p>Stop by and say hello! Our doors are open!</p>
                    <p><i class="fa fa-map-marker-alt mr-2"></i> PT30535, Jalan Tok Jembal, Kampung Kubang Badak, 21300 Kuala Terengganu, Terengganu</p>
                    <p><i class="fa fa-phone-alt mr-2"></i>+019-399 6854</p>
                    <p><i class="fa fa-envelope mr-2"></i>TimurCoin@example.com</p>
                </div>
                <div class="col-lg-3 col-md-6 mb-5">
                    <h4 class="text-white mb-4">Quick Links</h4>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>About Us</a>
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Services</a>
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Pricing</a>
                        <a class="text-white" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>

                </form>
            </div>
        </div>
    </div>
    <div class="container-fluid bg-dark text-white py-4 px-sm-3 px-md-5">

    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script>
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 15,
                center: {lat: 5.403, lng: 103.090} // Default center
            });
            // Create a circle overlay with a radius of 20 km centered at the laundry shop's location
            var circle = new google.maps.Circle({
                strokeColor: '#FF0000',
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: '#FF0000',
                fillOpacity: 0.35,
                map: map,
                center: {lat: 5.403, lng: 103.090}, // Update with your laundry shop's coordinates
                radius: 5000 // 5 km in meters
            });

            var geocoder = new google.maps.Geocoder();
            var marker = new google.maps.Marker({
                map: map,
                draggable: true
            });

            document.getElementById('addressForm').addEventListener('submit', function (e) {
                e.preventDefault();
                var address = document.getElementById('address').value;
                geocoder.geocode({'address': address}, function (results, status) {
                    if (status === 'OK') {
                        var userLocation = results[0].geometry.location;

                        // Calculate distance between user location and laundry shop
                        var distance = google.maps.geometry.spherical.computeDistanceBetween(
                                new google.maps.LatLng(5.403, 103.090), // Laundry shop's location
                                userLocation
                                );

                        // Convert distance from meters to kilometers
                        var distanceInKm = distance / 1000;

                        // Determine delivery fee based on distance
                        var deliveryFee = calculateDeliveryFee(distanceInKm);

                        // Display delivery fee to the user
                        document.getElementById('deliveryFeeDisplay').textContent = '$' + deliveryFee.toFixed(2);

                        // Check if the geocoded address is within the circle radius
                        if (distance <= 20000) { // Assuming 20000 meters (20 km) is the delivery radius
                            map.setCenter(userLocation);
                            marker.setPosition(userLocation);
                        } else {
                            alert('The address is outside the delivery radius.');
                        }
                    } else {
                        alert('Geocode was not successful for the following reason: ' + status);
                    }
                });
            });
            marker.addListener('dragend', function () {
                document.getElementById('address').value = '';
                geocoder.geocode({'location': marker.getPosition()}, function (results, status) {
                    if (status === 'OK') {
                        document.getElementById('address').value = results[0].formatted_address;
                    } else {
                        window.alert('Geocoder failed due to: ' + status);
                    }
                });
            });

            // Add event listener for the pin button
            document.getElementById('pinButton').addEventListener('click', function () {
                var address = document.getElementById('address').value;
                geocoder.geocode({'address': address}, function (results, status) {
                    if (status === 'OK') {
                        map.setCenter(results[0].geometry.location);
                        marker.setPosition(results[0].geometry.location);
                    } else {
                        alert('Geocode was not successful for the following reason: ' + status);
                    }
                });
            });
        }

        function calculateDeliveryFee(distanceInKm) {
            // Implement your delivery fee calculation logic here
            // For example, you can charge $1 per kilometer
            return distanceInKm * 1;
        }
    </script>
    <script src="https://cdn.jsdelivr.net/gh/somanchiu/Keyless-Google-Maps-API@v6.6/mapsJavaScriptAPI.js"
    async defer></script>


</body>

</html>