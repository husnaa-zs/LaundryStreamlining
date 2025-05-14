<%-- 
    Document   : Listprice
    Created on : 20 Jan 2024, 6:54:02 pm
    Author     : husna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            body {
                font-family: Arial, sans-serif;
            }
            h1 {
                text-align: center;
            }

            ul {
                list-style-type: none;
                padding: 0;
            }

            li {
                margin-bottom: 10px;
            }

            .price {
                font-weight: bold;
                color: #337ab7;
            }

            .image-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around;
            }

            .image-box {
                flex: 0 0 20%;
                padding: 10px;
                box-sizing: border-box;
            }

            img {
                width: 100%;
                height: 70%;
            }
            * {
                box-sizing: border-box;
            }

            .row {
                display: flex;
            }

            /* Create three equal columns that sits next to each other */
            .column {
                flex: 33.33%;
                padding: 5px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
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
                        <h1 class="m-0 text-secondary"><span class="text-primary">Timur </span>Coin Laundry</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                        <div class="navbar-nav ml-auto py-0">
                            <a href="index.jsp" class="nav-item nav-link active">Home</a>
                            <a href="booking.jsp" class="nav-item nav-link">Booking</a>
                            <a href="Listprice.jsp" class="nav-item nav-link">Services</a>

                            <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>



        <!-- Carousel Start -->
        <div class="container-fluid p-0">
            <div id="header-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">

                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 900px;">

                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">

                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 900px;">

                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                    <div class="btn btn-secondary" style="width: 45px; height: 45px;">
                        <span class="carousel-control-prev-icon mb-n2"></span>
                    </div>
                </a>
                <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                    <div class="btn btn-secondary" style="width: 45px; height: 45px;">
                        <span class="carousel-control-next-icon mb-n2"></span>
                    </div>
                </a>
            </div>
        </div>
        <!-- Carousel End -->

        <!-- Contact Info Start --> 
        <div class="container-fluid contact-info mt-5 mb-4">
            <div class="container" style="padding: 0 30px;">
                <div class="row">

                </div>
            </div>
        </div>

        <div style="margin-top: 100px;"></div>

        <!-- About Start -->
        <div class="container-fluid py-5">

            <div class="image-container"> 
                <div class="image-box"> <img src="img/s1.png" alt="Your Image Description"> 

                    <li>We'll wash, dry, and fold your clothes</li> 
                    <li class="price">Price: 
                        <span>RM 7.50</span> per kg</li>
                    </ul> </div> <!-- Repeat this div block for other images and pricing details --> 

                <div class="image-box"> <img src="img/s2.png" alt="Your Image Description"> 

                    <li>Without causing damage to delicate fabrics.</li> 
                    <li class="price">Price: 
                        <span>RM4.90</span> per kg</li>
                    </ul> </div>

                <div class="image-box"> <img src="img/s3.png" alt="Your Image Description"> 

                    <li>Professionally pressed or ironed to remove wrinkles.</li> 
                    <li class="price">Price: 
                        <span>RM 5.50</span> per kg</li>
                    </ul> </div>

                <div class="image-box"> <img src="img/s4.png" alt="Your Image Description"> 

                    <li>Preferred for delicate fabrics,</li> 
                    <li class="price">Price: 
                        <span>RM9.00</span> per kg</li>
                    </ul> </div>


                <div class="image-box"> <img src="img/s5.png" alt="Your Image Description"> 

                    <li>Freshen up your living space</li> 
                    <li class="price">Price: 
                        <span>RM 12.50</span> per piece</li>
                    </ul> </div>

            </div> 
        </div>
        <!-- About End -->
        <div style="margin-top: 100px;"></div>
        <div class="container-fluid contact-info mt-5 mb-4">

            <table>
                <thead>
                    <tr>
                        <th>Wash and Fold</th>
                        <th>Price per Kilo</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Bedding (Sheets / Covers / Cases)</td>
                        <td>RM6/kg</td>
                    </tr>
                    <tr>
                        <td>Towels </td>
                        <td>RM6/kg</td>
                    </tr>
                    <tr>
                        <td>Comforter / Duvet (S / M / K) </td>
                        <td>	15 / 20 / 24 </td>
                    </tr>
                    <tr>
                        <td>Mattress Protector (S / M / K)  </td>
                        <td>	15 / 20 / 24 </td>
                    </tr>
                    <tr>
                        <td>Pillow   </td>
                        <td>from 15</td>
                    </tr>
                    <tr>
                        <td>Sofa Cover / Cushion Cover </td>
                        <td>6 / kg  </td>
                    </tr>
                    <tr>
                        <td>Tablecloth</td>
                        <td>RM6/kg</td>
                    </tr>
                    <!-- Add more items here -->
                </tbody>

                <table style="margin-top: 10px;">
                    <thead>
                        <tr>
                            <th>Dry Cleaning</th>
                            <th>Price per Kilo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Shirt / T-Shirt / Polo-T / Blouse </td>
                            <td>RM5/kg</td>
                        </tr>
                        <tr>
                            <td>Trousers / Jeans / Shorts / Joggerpants </td>
                            <td>RM5/kg</td>
                        </tr>
                        <tr>
                            <td>Coat / Blazer / Jacket  </td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>Baju Kurung 2pcs (set) </td>
                            <td>9</td>
                        </tr>
                        <tr>
                            <td>Undergarment </td>
                            <td>from 3</td>
                        </tr>
                        <tr>
                            <td>Dress (Short / Long) </td>
                            <td>5/8/ kg  </td>
                        </tr>
                        <tr>
                            <td>Vest / Sweater </td>
                            <td>RM7/kg</td>
                        </tr>
                        <!-- Add more items here -->
                    </tbody>
                </table>

                <table style="margin-top: 10px;">

                    <thead>
                        <tr>
                            <th>Other Cleaning</th>
                            <th>Price per Kilo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Shoes</td>
                            <td>RM	20 /kg</td>
                        </tr>
                        <tr>
                            <td>Bagpack</td>
                            <td>from 15 </td>
                        </tr>
                        <tr>
                            <td>Socks</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <td>Gloves </td>
                            <td>8 </td>
                        </tr>
                        <tr>
                            <td>Baby Troller Cover 2pcs </td>
                            <td>25</td>
                        </tr>
                        <tr>
                            <td>Bean Bag Cover</td>
                            <td>15/kg</td>
                        </tr>
                        <tr>
                            <td>Mascot</td>
                            <td>RM150/kg</td>
                        </tr>
                        <!-- Add more items here -->
                    </tbody>
                </table>

                <table style="margin-top: 10px;">

                    <thead>
                        <tr>
                            <th>Delivery & Services</th>
                            <th>Price per Kilo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Standard Delivery Service </td>
                            <td>Free</td>
                        </tr>
                        <tr>
                            <td>Standard Service Minimum Order </td>
                            <td>RM15 </td>
                        </tr>
                        <tr>
                            <td>Same Day Delivery Service </td>
                            <td>100%</td>
                        </tr>
                        <tr>
                            <td>24h Dry Cleaning Delivery Minimum Order </td>
                            <td>RM38 </td>
                        </tr>
                        <tr>
                            <td>Curtain Take Down & Installation Service </td>
                            <td>From 125</td>
                        </tr>
                        <tr>
                            <td>Carpet Pickup & Delivery </td>
                            <td>free</td>
                        </tr>
                        <!-- Add more items here -->
                    </tbody>
                </table>
                <div class="text-center mt-4">
                    <a href="contoh.jsp" class="btn btn-primary">Book Now</a>
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
</body>

</html>
