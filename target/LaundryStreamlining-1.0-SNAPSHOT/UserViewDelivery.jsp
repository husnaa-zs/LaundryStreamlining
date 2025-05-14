<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
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

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            ol.progtrckr {
                margin: 0;
                padding: 0;
                list-style-type: none;
            }

            ol.progtrckr li {
                display: inline-block;
                text-align: center;
                line-height: 3.5em;
            }

            ol.progtrckr[data-progtrckr-steps="2"] li {
                width: 49%;
            }
            ol.progtrckr[data-progtrckr-steps="3"] li {
                width: 33%;
            }
            ol.progtrckr[data-progtrckr-steps="4"] li {
                width: 24%;
            }
            ol.progtrckr[data-progtrckr-steps="5"] li {
                width: 19%;
            }
            ol.progtrckr[data-progtrckr-steps="6"] li {
                width: 16%;
            }
            ol.progtrckr[data-progtrckr-steps="7"] li {
                width: 14%;
            }
            ol.progtrckr[data-progtrckr-steps="8"] li {
                width: 12%;
            }
            ol.progtrckr[data-progtrckr-steps="9"] li {
                width: 11%;
            }

            ol.progtrckr li.progtrckr-done {
                color: black;
                border-bottom: 4px solid yellowgreen;
            }
            ol.progtrckr li.progtrckr-todo {
                color: silver;
                border-bottom: 4px solid silver;
            }

            ol.progtrckr li:after {
                content: "\00a0\00a0";
            }
            ol.progtrckr li:before {
                position: relative;
                bottom: -2.5em;
                float: left;
                left: 50%;
                line-height: 1em;
            }
            ol.progtrckr li.progtrckr-done:before {
                content: "\2713";
                color: white;
                background-color: yellowgreen;
                height: 2.2em;
                width: 2.2em;
                line-height: 2.2em;
                border: none;
                border-radius: 2.2em;
            }
            ol.progtrckr li.progtrckr-todo:before {
                content: "\039F";
                color: silver;
                background-color: white;
                font-size: 2.2em;
                bottom: -1.2em;
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
        <div class="page-header container-fluid bg-secondary pt-2 pt-lg-5 pb-2 mb-5">
            <div class="container py-5">
                <div class="row align-items-center py-4">
                    <div class="col-md-6 text-center text-md-left">
                        <h1 class="mb-4 mb-md-0 text-white">Delivery Progress</h1>
                    </div>
                    <div class="col-md-6 text-center text-md-right">
                        <div class="d-inline-flex align-items-center">
                            <a class="btn text-white" href="">Home</a>
                            <i class="fas fa-angle-right text-white"></i>
                            <a class="btn text-white disabled" href="">About Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->

       <div class="container-fluid pt-5">
    <div class="container">
        <h6 class="text-secondary text-uppercase text-center font-weight-medium mb-3">Delivery Information</h6>
        <table border="1" cellpadding="10">
            <thead>
                <tr>
                    <th>Delivery Name</th>
                    <th>Delivery Kilo</th>
                    <th>Address</th>
                    <th>Notes</th>
                    <th>Delivery Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String url = "jdbc:mysql://localhost:3306/dobi";
                    String user = "root";
                    String password = "";

                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Load the JDBC driver (optional if using JDBC 4.0 or later)
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Establish a connection
                        con = DriverManager.getConnection(url, user, password);

                        // Create a statement
                        stmt = con.createStatement();

                        // Get the last username from the user table
                        String queryUsername = "SELECT name FROM user ORDER BY id DESC LIMIT 1";
                        rs = stmt.executeQuery(queryUsername);
                        String lastName = null;
                        if (rs.next()) {
                            lastName = rs.getString("name");
                        }

                        // Get the matching delivery data from the phase table
                        String queryPhase = "SELECT * FROM phase WHERE deliveryName = ?";
                        PreparedStatement pstmt = con.prepareStatement(queryPhase);
                        pstmt.setString(1, lastName);
                        rs = pstmt.executeQuery();

                        // Process the result
                        if (rs.next()) {
                            String deliveryName = rs.getString("deliveryName");
                            String deliveryKilo = rs.getString("deliveryKilo");
                            String address = rs.getString("address");
                            String notes = rs.getString("notes");
                            boolean outForPickup = rs.getBoolean("outForPickup");
                            boolean arrivedAtYourHouse = rs.getBoolean("arrivedAtYourHouse");
                            boolean enRouteToShop = rs.getBoolean("enRouteToShop");
                            boolean arrivedToShop = rs.getBoolean("arrivedToShop");

                            // Determine the delivery status
                            String deliveryStatus = "On the Way";
                            if (outForPickup && !arrivedAtYourHouse && !enRouteToShop && !arrivedToShop) {
                                deliveryStatus = "Out For Pickup";
                            } else if (outForPickup && arrivedAtYourHouse && !enRouteToShop && !arrivedToShop) {
                                deliveryStatus = "Arrived At Your House";
                            } else if (outForPickup && arrivedAtYourHouse && enRouteToShop && !arrivedToShop) {
                                deliveryStatus = "En Route To Shop";
                            } else if (outForPickup && arrivedAtYourHouse && enRouteToShop && arrivedToShop) {
                                deliveryStatus = "Arrived To Shop";
                            }

                            // Display the result
                %>
                <tr>
                    <td><%= deliveryName %></td>
                    <td><%= deliveryKilo %></td>
                    <td><%= address %></td>
                    <td><%= notes %></td>
                    <td><%= deliveryStatus %></td>
                </tr>
                <tr>
                    <td colspan="5">
                        <ol class="progtrckr" data-progtrckr-steps="4">
                            <li class="progtrckr-<%= outForPickup ? "done" : "todo" %>">Out For Pickup</li>
                            <li class="progtrckr-<%= arrivedAtYourHouse ? "done" : "todo" %>">Arrived At Your House</li>
                            <li class="progtrckr-<%= enRouteToShop ? "done" : "todo" %>">En Route To Shop</li>
                            <li class="progtrckr-<%= arrivedToShop ? "done" : "todo" %>">Arrived To Shop</li>
                        </ol>
                    </td>
                </tr>
                <%
                        } else {
                            // No matching data found
                %>
                <tr>
                    <td colspan="5">No matching data found</td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Close resources
                        try {
                            if (rs != null) {
                                rs.close();
                            }
                            if (stmt != null) {
                                stmt.close();
                            }
                            if (con != null) {
                                con.close();
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

        <!-- Page Content End -->

        <!-- Footer Start -->
        <div class="container-fluid bg-primary text-white mt-5 pt-5 px-sm-3 px-md-5">
            <div class="row pt-5">
                <div class="col-lg-3 col-md-6 mb-5">
                    <a href="" class="navbar-brand">
                        <h1 class="text-secondary mb-3"><span class="text-white">Timur</span>Coin Laundry</h1>
                    </a>

                    <h6 class="text-white text-uppercase mt-4 mb-3" style="letter-spacing: 5px;">Follow Us</h6>
                    <div class="d-flex justify-content-start">
                        <a class="btn btn-lg btn-outline-light btn-lg-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-lg btn-outline-light btn-lg-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-lg btn-outline-light btn-lg-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a class="btn btn-lg btn-outline-light btn-lg-square" href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-5">
                    <h5 class="text-white text-uppercase mb-4" style="letter-spacing: 5px;">Our Services</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Dry Cleaning</a>
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Ironing & Folding</a>
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Carpet Cleaning</a>
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>House Cleaning</a>
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Laundry Services</a>
                        <a class="text-white" href="#"><i class="fa fa-angle-right mr-2"></i>Window Cleaning</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-5">
                    <h5 class="text-white text-uppercase mb-4" style="letter-spacing: 5px;">Quick Links</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Privacy Policy</a>
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Terms & Conditions</a>
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Regular FAQs</a>
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Help & Support</a>
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Services</a>
                        <a class="text-white" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-5">
                    <h5 class="text-white text-uppercase mb-4" style="letter-spacing: 5px;">Contact Us</h5>
                    <p><i class="fa fa-map-marker-alt mr-2"></i>123 Street, New York, USA</p>
                    <p><i class="fa fa-phone-alt mr-2"></i>+012 345 67890</p>
                    <p><i class="fa fa-envelope mr-2"></i>info@example.com</p>
                </div>
            </div>
            <div class="container border-top border-secondary pt-5">
                <p class="m-0 text-center text-white">
                    &copy; <a class="text-white font-weight-bold" href="#">Your Site Name</a>. All Rights Reserved. Designed by
                    <a class="text-white font-weight-bold" href="https://htmlcodex.com">HTML Codex</a>
                </p>
            </div>
        </div>
        <!-- Footer End -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>
