<%-- 
    Document   : newjsp
    Created on : 20 Jan 2024, 5:03:59 pm
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
                            <a href="index.html" class="nav-item nav-link">Home</a>
                            <a href="about.html" class="nav-item nav-link">About</a>
                            <a href="service.html" class="nav-item nav-link active">Services</a>
                            <a href="pricing.html" class="nav-item nav-link">Pricing</a>
                            <a href="contact.html" class="nav-item nav-link">Contact</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>

    
        <div class="image-container"> 
            <div class="image-box"> <img src="img/s1.png" alt="Your Image Description"> 
              
                    <li>We'll wash, dry, and fold your clothes</li> 
                    <li class="price">Price: 
                        <span>$3.50</span> per kg</li>
                </ul> </div> <!-- Repeat this div block for other images and pricing details --> 

            <div class="image-box"> <img src="img/s2.png" alt="Your Image Description"> 
                
                    <li>Without causing damage to delicate fabrics.</li> 
                    <li class="price">Price: 
                        <span>$3.50</span> per kg</li>
                </ul> </div>

            <div class="image-box"> <img src="img/s3.png" alt="Your Image Description"> 
                
                    <li>Professionally pressed or ironed to remove wrinkles.</li> 
                    <li class="price">Price: 
                        <span>$3.50</span> per kg</li>
                </ul> </div>

            <div class="image-box"> <img src="img/s4.png" alt="Your Image Description"> 
                
                    <li>Preferred for delicate fabrics,</li> 
                    <li class="price">Price: 
                        <span>$3.50</span> per kg</li>
                </ul> </div>


            <div class="image-box"> <img src="img/s5.png" alt="Your Image Description"> 
                
                    <li>Freshen up your living space</li> 
                    <li class="price">Price: 
                        <span>$3.50</span> per kg</li>
                </ul> </div>






        </div> 





    </body> </html>