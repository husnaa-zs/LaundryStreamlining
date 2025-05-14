<%-- 
    Document   : paymentmain
    Created on : 30 Mar 2024, 11:21:34 pm
    Author     : husna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.mvc.bean.BookingBean"%>
<%@page import="com.mvc.controller.PickupServlet"%>
<%@ page import="java.sql.*,java.util.*" %>

<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Laundry Booking</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- CSS -->
        <link rel="stylesheet" href="css/style1.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
        <!-- Boxicons CSS -->
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;800&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/A1.css" rel="stylesheet">

        <style>
            #map {
                height: 400px;
                width: 100%;
            }
            #form-container {
                margin-top: 10px;

            }
            .btn-sm {
                padding: 20px; /* Adjust padding to control button size */
                font-size: 0.55rem; /* Adjust font size if needed */
            }

            /* Ensure both buttons have the same background color */
            .btn-primary {
                background-color: #007bff; /* Adjust to match your primary color */
            }

            .btn-success {
                background-color: #007bff; /* Adjust to match your success color */
            }
        </style>
    </head>

    <body>



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
                            <a href="index.jsp" class="nav-item nav-link">Home</a>
                            
                            <a href="service.html" class="nav-item nav-link">Services</a>
                            <a href="Listprice.jsp" class="nav-item nav-link">Pricing</a>
                            <a href="UserViewDelivery.jsp" class="nav-item nav-link">Delivery Progress</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->


        <div class="page-header container-fluid bg-secondary pt-2 pt-lg-5 pb-2 mb-5">
            <div class="container-fluid" style="padding: 0;"> <!-- Ensure the container-fluid spans the full width -->
                <div class="form-container" id="form-container">
                    <div class="container py-5">
                        <div class="wrapper" style="width: 100%; height: 100vh; overflow: auto;">
                            <div class="title-text">
                                <div class="title login">Pickup Details</div>
                                <div class="title signup">Delivery Details</div>
                            </div>
                            <div class="form-container">
                                <div class="slide-controls">
                                    <input type="radio" name="slide" id="login" checked>
                                    <input type="radio" name="slide" id="signup">
                                    <label for="login" class="slide login">Pickup</label>
                                    <label for="signup" class="slide signup">Delivery</label>
                                    <div class="slider-tab"></div>
                                </div>
                                <div class="form-inner">

                                    <%
                                        Connection connection = null;
                                        PreparedStatement statement = null;
                                        ResultSet resultSet = null;

                                        try {
                                            // Establish database connection
                                            Class.forName("com.mysql.jdbc.Driver");
                                            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dobi", "root", "");

                                            // Execute select statement to retrieve booking details
                                            String sql = "SELECT u.name, lb.services, lb.kilo FROM user u CROSS JOIN l_book lb ORDER BY lb.id DESC, u.id DESC LIMIT 1;";
                                            statement = connection.prepareStatement(sql);
                                            resultSet = statement.executeQuery();

                                            // Process retrieved data
                                            while (resultSet.next()) {
                                                String name = resultSet.getString("name");
                                                String services = resultSet.getString("services");
                                                int kilo = resultSet.getInt("kilo");

                                                // Debugging: Print the retrieved values
                                                System.out.println("Retrieved from DB - Name: " + name + ", Service: " + services + ", Kilo: " + kilo);

                                                // Define price constants for each service (you can fetch these from database if needed)
                                                double pricePerKiloWashFold = 5.0; // Example price for wash and fold per kilo
                                                double pricePerKiloDryClean = 8.0; // Example price for dry clean per kilo
                                                double pricePerKiloWashPress = 6.0; // Example price for wash and fold per kilo
                                                double pricePerKiloHandWash = 7.0;
                                                double pricePerLargeItems = 12.0;

                                                // Calculate total price based on selected service and kilo
                                                double totalPrice = 0.0;
                                                if ("Wash and Fold".equals(services.trim())) {
                                                    totalPrice = pricePerKiloWashFold * kilo;
                                                } else if ("Dry Cleaning".equals(services.trim())) {
                                                    totalPrice = pricePerKiloDryClean * kilo;
                                                } else if ("Wash and Press".equals(services.trim())) {
                                                    totalPrice = pricePerKiloWashPress * kilo;
                                                } else if ("Hand Wash".equals(services.trim())) {
                                                    totalPrice = pricePerKiloHandWash * kilo;
                                                } else if ("Large Items".equals(services.trim())) {
                                                    totalPrice = pricePerLargeItems * kilo;
                                                } else {
                                                    // Debugging: Print a message if the service name does not match any condition
                                                    System.out.println("Service name did not match any conditions: " + services);
                                                }

                                                // Debugging: Print the calculated total price
                                                System.out.println("Calculated Total Price: " + totalPrice);
                                    %>
                                    <form action="PickupServlet" class="login" method="POST">
                                        <h2>Payment Summary:</h2>
                                        <p><strong>Name:</strong><span id="name"><%= name%></span> </p>
                                        <input type="hidden" name="name" value="<%= name%>">
                                        <p><strong>Service:</strong> <span id="service"><%= services%></span></p>
                                        <input type="hidden" name="service" value="<%= services%>">
                                        <p><strong>Total of KG:</strong> <span id="kilo"><%= kilo%></span></p>
                                        <input type="hidden" name="kilo" value="<%= kilo%>">
                                        <hr>
                                        <p><strong>Total Price:</strong><span id="totalPrice"><%= totalPrice%></span></p>
                                        <input type="hidden" name="totalPrice" value="<%= totalPrice%>">
                                        <p><strong>Total (incl tax):</strong> <span id="pickupTotalWithTax"></span></p>
                                        <input type="hidden" name="totalWithTax" id="pickupTotalnTax" value="">
                                        <!-- Add the rest of the form fields here -->
                                        <div class="d-flex justify-content-center">
                                            <button id="clickButton" type="button" class="btn btn-primary" style="width: 200px; padding: 10px;">Calculate Total</button>
                                            <button id="insertButton" type="submit" class="btn btn-success ml-2" style="width: 200px; padding: 10px;">Proceed</button>
                                        </div>
                                    </form>

                                    <form action="DeliveryServlet" class="signup" id="deliveryForm" method="POST">
                                        <%-- Display the same booking details here --%>
                                        <p><strong>Name:</strong><span id="deliveryName"><%= name%></span> </p>
                                        <input type="hidden" name="deliveryName" id="deliveryName" value="<%= name%>">
                                        <p><strong>Service:</strong> <span id="deliveryService"><%= services%></span></p>
                                        <input type="hidden" name="deliveryService" id="deliveryService" value="<%= services%>">
                                        <p><strong>Total of KG:</strong> <span id="deliveryKilo"><%= kilo%></span></p>
                                        <input type="hidden" name="deliveryKilo" id="deliveryKilo" value="<%= kilo%>">
                                        <p><strong>Total Price:</strong><span id="deliveryTotalPrice"><%= totalPrice%></span></p>
                                        <input type="hidden" name="deliveryTotalPrice" id="deliveryTotalPrice" value="<%= totalPrice%>">
                                        <label for="address"><p><strong>Address:</strong></p></label><br>
                                        <input type="text" id="address" name="address" required style="width: 100%;"><br><br>
                                        <button type="button" id="pinButton">Pin Address on Map</button><br><br>
                                        <div id="map"></div><br>
                                        <button id="calcButton" class="btn btn-primary btn-block" style="padding: 5px 10px; font-size: inherit;">Set Current Location</button><br>

                                        <label for="Add notes for optional"><p><strong>Add notes for optional</strong></p></label><br>
                                        <input type="text" id="notes" name="notes" required style="width: 100%;"><br><br>
                                        <div id="addressDetails">
                                            <p><strong>Delivery fee:</strong> <span id="deliveryFeeDisplay"></span></p>
                                            <input type="hidden" name="deliveryFeeDisplay" id="valueDelivery" value="">
                                            <!-- Added span element to display delivery fee -->
                                            <p><strong>Subtotal:</strong> <span id="subtotal"></span></p>
                                            <input type="hidden" name="subtotal" id="totalsub" value="">
                                            <hr>
                                            <p><strong>Total (incl tax):</strong> <span id="totalWithTax"></span></p>
                                            <input type="hidden" name="totalWithTax" id="totalnTax" value="">
                                            <!-- Calculate subtotal and total (incl tax) dynamically using JavaScript -->

                                            <div class="d-flex justify-content-center w-500">
                                                <input type="submit" class="btn btn-primary btn-block"></button>
                                            </div>
                                        </div>
                                    </form>

                                    <%
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        } finally {
                                            try {
                                                if (resultSet != null) {
                                                    resultSet.close();
                                                }
                                                if (statement != null) {
                                                    statement.close();
                                                }
                                                if (connection != null) {
                                                    connection.close();
                                                }
                                            } catch (SQLException e) {
                                                e.printStackTrace();
                                            }
                                        }
                                    %>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Page Header Start -->

            <!-- Footer Start 
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
                        <p><i class="fa fa-envelope mr-2"></i>TimurCoinLaundry@gmail.com</p>
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
            -->



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


            <!-- JavaScript Libraries -->
            <script>
                const loginText = document.querySelector(".title-text .login");
                const loginForm = document.querySelector("form.login");
                const loginBtn = document.querySelector("label.login");
                const signupBtn = document.querySelector("label.signup");
                const signupLink = document.querySelector("form .signup-link a");
                signupBtn.onclick = (() => {
                    loginForm.style.marginLeft = "-50%";
                    loginText.style.marginLeft = "-50%";
                });
                loginBtn.onclick = (() => {
                    loginForm.style.marginLeft = "0%";
                    loginText.style.marginLeft = "0%";
                });
                signupLink.onclick = (() => {
                    signupBtn.click();
                    return false;
                });
            </script>
            <script>
                document.getElementById("clickButton").addEventListener("click", function () {
                    event.preventDefault();
                    // Fetch total price from the input field
                    var totalPrice = parseFloat(document.getElementById("totalPrice").innerText);
                    // Check if totalPrice is a valid number
                    if (isNaN(totalPrice)) {
                        alert("Invalid total price. Please check the input.");
                        return;
                    }
                    // Define the tax rate
                    var taxRate = 0.06;
                    // Calculate tax amount
                    var tax = totalPrice * taxRate;
                    // Calculate total price including tax
                    var totalWithTax = totalPrice + tax;

                    // Update corresponding fields with the calculated values
                    document.getElementById("subtotal").innerText = totalPrice.toFixed(2);
                    document.getElementById("totalsub").value = totalPrice.toFixed(2);
                    document.getElementById("deliveryFeeDisplay").innerText = tax.toFixed(2);
                    document.getElementById("valueDelivery").value = tax.toFixed(2);
                    document.getElementById("pickupTotalWithTax").innerText = totalWithTax.toFixed(2);
                    document.getElementById("pickupTotalnTax").value = totalWithTax.toFixed(2);
                });
            </script>

            <script>
                // JavaScript code to calculate subtotal and total (incl tax)
                document.getElementById('calcButton').addEventListener('click', function (event) {
                    event.preventDefault(); // Prevent form submission
                    // Fetch delivery fee and tax (you can set these values dynamically)
                    var deliveryFee = 10; // Example delivery fee
                    var taxRate = 0.06; // Example tax rate (6%)
                    // Fetch total price from the form
                    var totalPrice = parseFloat(document.getElementById('deliveryTotalPrice').innerText);
                    var totalPrice2 = parseFloat(document.getElementById('valueDelivery').value);
                    // Calculate subtotal
                    var subtotal = totalPrice + deliveryFee;
                    document.getElementById('subtotal').innerText = subtotal.toFixed(2);
                    document.getElementById('totalsub').value = subtotal.toFixed(2);// Display subtotal
                    // Calculate total (incl tax)
                    var totalWithTax = subtotal * (1 + taxRate);
                    document.getElementById('totalWithTax').innerText = totalWithTax.toFixed(2); // Display total (incl tax)
                    document.getElementById('totalnTax').value = totalWithTax.toFixed(2);
                    // You can then proceed with form submission or other actions
                });
            </script>

            <script src="js/main.js"></script>
            <script src="https://cdn.jsdelivr.net/gh/somanchiu/Keyless-Google-Maps-API@v6.9/mapsJavaScriptAPI.js"
    async defer></script>
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
                    document.getElementById('calcButton').addEventListener('click', function (e) {
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
                                document.getElementById('valueDelivery').value = '$' + deliveryFee.toFixed(2);
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


    </body>

</html>