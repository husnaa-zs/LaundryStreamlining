<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <script src="scripts/print.min.js"></script>
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="styles/print.min.css" rel="stylesheet">
        <link href="styles/styles.css" rel="stylesheet">

        <!-- Custom Style -->
        <style>
            .download-button {
                display: block;
                width: 200px;
                margin: 20px auto;
                padding: 10px 20px;
                text-align: center;
                background-color: #007bff;
                color: #ffffff;
                border: none;
                border-radius: 5px;
                text-decoration: none;
            }
            .title-margin {
                margin-top: 70px; /* Adjust the value as needed */
            }

            .booking-box {
                background-color: #ffffff;
                border: 1px solid #dddddd;
                padding: 20px;
                margin-top: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
        <div class="container">
            <h1 class="title-margin">Booking Details</h1>
            <div class="print">
                <div class="booking-box">
                    <ul class="list-group">
                        <%
                            Connection connection = null;
                            PreparedStatement statement = null;
                            ResultSet resultSet = null;

                            try {
                                // Establish database connection
                                Class.forName("com.mysql.jdbc.Driver");
                                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dobi", "root", "");

                                // Execute select statement to retrieve last booking details
                                String sql = "SELECT u.name, l.kilo, l.services, l.machines, l.date, l.time_slot_id, l.delivery "
                                        + "FROM user u "
                                        + "CROSS JOIN l_book l "
                                        + "ORDER BY l.id DESC,u.id DESC "
                                        + "LIMIT 1;";
                                statement = connection.prepareStatement(sql);
                                resultSet = statement.executeQuery();

                                // Process retrieved data
                                if (resultSet.next()) {
                                    String name = resultSet.getString("name");
                                    int kilo = resultSet.getInt("kilo");
                                    String services = resultSet.getString("services");
                                    String machines = resultSet.getString("machines");
                                    String date = resultSet.getString("date");
                                    String time_slot_id = resultSet.getString("time_slot_id");
                                    String delivery = resultSet.getString("delivery");
                        %>

                        <h4>Booking of : </strong><%= name%></h4>
                        <h9>Your booking request for Pantai Timur Coin Laundry has been confirmed. Please review the details of your booking</h9>
                        <br><!-- comment --><br>
                        <li class="list-group-item"><strong>Laundry Weight (kg): </strong><%= kilo%></li>
                        <li class="list-group-item"><strong>Service: </strong><%= services%></li>
                        <li class="list-group-item"><strong>Machine: </strong><%= machines%></li>
                        <li class="list-group-item"><strong>Date: </strong><%= date%></li>
                        <li class="list-group-item"><strong>Time Slot: </strong><%= time_slot_id%></li>
                        <li class="list-group-item"><strong>Delivery Option: </strong><%= delivery%></li>
                            <%
                                    } // end if
                                } catch (SQLException | ClassNotFoundException e) {
                                    e.printStackTrace();
                                } finally {
                                    // Close resources
                                    if (resultSet != null) {
                                        try {
                                            resultSet.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                    if (statement != null) {
                                        try {
                                            statement.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                    if (connection != null) {
                                        try {
                                            connection.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                }
                            %>
                    </ul>
                    <a href="#!" class="button">Download</a>
                    
                         <a href="paymentmain.jsp" class="download-button">Pay Now</a>
                    </div>
                </div>
            </div>


           
        </div>
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
            </div>
        </div>
        <div class="container-fluid bg-dark text-white py-4 px-sm-3 px-md-5"></div>
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
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>
        <script src="js/main.js"></script>

        <!-- PrintJS -->


        <!-- Custom Script -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const downloadButton = document.querySelector('.button');

                downloadButton.addEventListener('click', function (event) {
                    event.preventDefault(); // Prevent default link behavior

                    window.print(); // Trigger the print dialog

                    return false; // Ensure nothing else happens
                });
            });
        </script>
    </body>
</html>
