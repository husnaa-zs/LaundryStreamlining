<%-- 
    Document   : about.jsp
    Created on : 21 Jan 2024, 11:57:30 am
    Author     : husna
--%>

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
            /* vars */
            :root {
                --back: #eeeeee;
                --blue: #0082d2;
                --green: #33DDAA;
                --gray: #777777;
                --size: 200px;
            }

            body, html {
                background: var(--back);
                padding: 0;
                margin: 0;
                font-family: sans-serif;
                color: var(--gray);
            }
            .tracking-wrapper {
                margin: 30px;
                padding: 0;
            }
            .tracking * {
                padding: 0;
                margin: 0;
            }
            .tracking {
                width: var(--size);
                max-width: 100%;
                position: relative;
            }
            .tracking .empty-bar {
                background: #ddd;
                position: absolute;
                width: 90%;
                height: 20%;
                top: 40%;
                margin-left: 5%;
            }
            .tracking .color-bar {
                background: var(--blue);
                position: absolute;
                height: 20%;
                top: 40%;
                margin-left: 5%;
                transition: all 0.5s;
                -webkit-transition: all 0.5s;
                -moz-transition: all 0.5s;
                -ms-transition: all 0.5s;
                -o-transition: all 0.5s;
            }
            .tracking ul {
                display: flex;
                justify-content: space-between;
                list-style: none;
            }
            .tracking ul > li {
                background: #ddd;
                text-align: center;
                border-radius: 50%;
                -webkit-border-radius: 50%;
                -moz-border-radius: 50%;
                -ms-border-radius: 50%;
                -o-border-radius: 50%;
                z-index: 1;
                background-size: 70%;
                background-repeat: no-repeat;
                background-position: center center;
                transition: all 0.5s;
                -webkit-transition: all 0.5s;
                -moz-transition: all 0.5s;
                -ms-transition: all 0.5s;
                -o-transition: all 0.5s;
                display: inline-block;
                position: relative;
                width: 10%;
            }
            .tracking ul > li .el {
                position: relative;
                margin-top: 100%;
            }
            .tracking ul > li .el i {
                position: absolute;
                bottom: 100%;
                left: 8%;
                margin-bottom: 12%;
                color: #fff;
                font-size: 100%;
                display: none;
            }
            .tracking ul > li .txt {
                color: #999;
                position: absolute;
                top: 120%;
                left: -75%;
                text-align: center;
                width: 250%;
                font-size: .75rem;
            }
            .tracking .progress-0 .color-bar {
                width: 00%;
            }
            .tracking .progress-1 .color-bar {
                width: 15%;
            }
            .tracking .progress-2 .color-bar {
                width: 30%;
            }
            .tracking .progress-3 .color-bar {
                width: 45%;
            }
            .tracking .progress-4 .color-bar {
                width: 60%;
            }
            .tracking .progress-5 .color-bar {
                width: 75%;
            }
            .tracking .progress-6 .color-bar {
                width: 90%;
            }
            .tracking .progress-7 .color-bar {
                width: 90%;
            }

            .tracking .progress-0 > ul > li.bullet-1,
            .tracking .progress-1 > ul > li.bullet-1,
            .tracking .progress-2 > ul > li.bullet-1,
            .tracking .progress-3 > ul > li.bullet-1,
            .tracking .progress-4 > ul > li.bullet-1,
            .tracking .progress-5 > ul > li.bullet-1,
            .tracking .progress-6 > ul > li.bullet-1,
            .tracking .progress-7 > ul > li.bullet-1
            {
                background-color: var(--blue);
            }

            .tracking .progress-2 > ul > li.bullet-2,
            .tracking .progress-3 > ul > li.bullet-2,
            .tracking .progress-4 > ul > li.bullet-2,
            .tracking .progress-5 > ul > li.bullet-2,
            .tracking .progress-6 > ul > li.bullet-2,
            .tracking .progress-7 > ul > li.bullet-2
            {
                background-color: var(--blue);
            }

            .tracking .progress-4 > ul > li.bullet-3,
            .tracking .progress-5 > ul > li.bullet-3,
            .tracking .progress-6 > ul > li.bullet-3,
            .tracking .progress-7 > ul > li.bullet-3
            {
                background-color: var(--blue);
            }

            .tracking .progress-6 > ul > li.bullet-4,
            .tracking .progress-7 > ul > li.bullet-4
            {
                background-color: var(--blue);
            }

            .tracking .progress-7 > ul > li.bullet-4
            {
                background-color: var(--green);
            }

            .tracking .progress-1 > ul > li.bullet-1 .el i,
            .tracking .progress-2 > ul > li.bullet-1 .el i,
            .tracking .progress-3 > ul > li.bullet-1 .el i,
            .tracking .progress-4 > ul > li.bullet-1 .el i,
            .tracking .progress-5 > ul > li.bullet-1 .el i,
            .tracking .progress-6 > ul > li.bullet-1 .el i,
            .tracking .progress-7 > ul > li.bullet-1 .el i
            {
                display: block;
            }

            .tracking .progress-3 > ul > li.bullet-2 .el i,
            .tracking .progress-4 > ul > li.bullet-2 .el i,
            .tracking .progress-5 > ul > li.bullet-2 .el i,
            .tracking .progress-6 > ul > li.bullet-2 .el i,
            .tracking .progress-7 > ul > li.bullet-2 .el i
            {
                display: block;
            }

            .tracking .progress-5 > ul > li.bullet-3 .el i,
            .tracking .progress-6 > ul > li.bullet-3 .el i,
            .tracking .progress-7 > ul > li.bullet-3 .el i
            {
                display: block;
            }

            .tracking .progress-7 > ul > li.bullet-4 .el i
            {
                display: block;
            }

            .tracking .progress-1 > ul > li.bullet-1 .txt,
            .tracking .progress-2 > ul > li.bullet-1 .txt,
            .tracking .progress-3 > ul > li.bullet-1 .txt,
            .tracking .progress-4 > ul > li.bullet-1 .txt,
            .tracking .progress-5 > ul > li.bullet-1 .txt,
            .tracking .progress-6 > ul > li.bullet-1 .txt,
            .tracking .progress-7 > ul > li.bullet-1 .txt
            {
                color: var(--blue);
            }

            .tracking .progress-3 > ul > li.bullet-2 .txt,
            .tracking .progress-4 > ul > li.bullet-2 .txt,
            .tracking .progress-5 > ul > li.bullet-2 .txt,
            .tracking .progress-6 > ul > li.bullet-2 .txt,
            .tracking .progress-7 > ul > li.bullet-2 .txt
            {
                color: var(--blue);
            }

            .tracking .progress-5 > ul > li.bullet-3 .txt,
            .tracking .progress-6 > ul > li.bullet-3 .txt,
            .tracking .progress-7 > ul > li.bullet-3 .txt
            {
                color: var(--blue);
            }

            .tracking .progress-7 > ul > li.bullet-4 .txt
            {
                color: var(--blue);
            }

            /* demo */
            .controls {
                margin: 90px 30px 30px;
                display: flex;
                flex-direction: column;
                justify-content: flex-start;
                align-items: flex-start;
            }
            .controls > div {
                display: flex;
                justify-content: flex-start;
                align-items: space-between;
                margin: 0;
                padding: 0;
            }
            .controls p,
            .controls button {
                border: 0;
                line-height: 20px;
                padding: 15px;
                font-size: 0.8rem;
                text-transform: uppercase;
            }
            .controls button {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin: 0 6px;
                background: var(--blue);
                color: #fff;
                border-radius: 50px;
                transition: all .3s;
            }
            .controls button:nth-child(1) {
                margin-left: 0;
            }
            .controls button i {
                font-size: 1rem;
                margin: 0 5px;
            }
            .controls button#prev {
                padding-right: 30px;
            }
            .controls button#next {
                padding-left: 30px;
            }

            .controls button:hover,
            .controls button:focus {
                outline: none;
                background-color: var(--green);
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
                        <h1 class="mb-4 mb-md-0 text-white">About Us</h1>
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

        <!-- About Start -->
        <div class="container-fluid py-5">
            <div class="container">
                <!-- About content goes here -->
            </div>
        </div>
        <!-- About End -->

        <!-- Features Start -->
        <div class="container-fluid py-5">
            <div class="container">
                <div class="tracking-wrapper">
                    <div class="tracking">
                        <div id="progress" class="progress-0">
                            <div class="empty-bar"></div>
                            <div class="color-bar"></div>
                            <ul>
                                <li class="bullet-1">
                                    <div class="el"><i class='bx bx-check'></i></div>
                                    <div class="txt">Order Processed</div>
                                </li>
                                <li class="bullet-2">
                                    <div class="el"><i class='bx bx-check'></i></div>
                                    <div class="txt">Order Shipped</div>
                                </li>
                                <li class="bullet-3">
                                    <div class="el"><i class='bx bx-check'></i></div>
                                    <div class="txt">Order En Route</div>
                                </li>
                                <li class="bullet-4">
                                    <div class="el"><i class='bx bx-check'></i></div>
                                    <div class="txt">Order Arrived</div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="controls">
                    <div>
                        <button id="prev"><i class='bx bx-chevron-left'></i> Prev</button>
                        <button id="next">Next <i class='bx bx-chevron-right'></i></button>
                    </div>
                    <div>
                        <p>Step: <span id="step">0</span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Features End -->

    <!-- Footer Start -->
    <div class="container-fluid bg-primary text-white mt-5 pt-5 px-sm-3 px-md-5">
        <div class="row pt-5">
            <div class="col-lg-3 col-md-6 mb-5">
                <a href="">
                    <h1 class="text-secondary mb-3"><span class="text-white">Pantai Timur</span>Coin Laundry</h1>
                </a>
                <p>Join our community</p>
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
    <div class="container-fluid bg-dark text-white py-4 px-sm-3 px-md-5">
        <p class="m-0 text-center text-white">© <a class="text-white font-weight-bold" href="#">Timur Coin Laundry</a>. All Rights Reserved.</p>
    </div>
    <!-- Footer End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
    <script>
        var prev = document.getElementById('prev');
        var next = document.getElementById('next');
        var trak = document.getElementById('progress');
        var step = document.getElementById('step');

        next.addEventListener('click', function () {
            var cls = trak.className.split('-').pop();
            cls > 6 ? cls = 0 : cls++;

            step.innerHTML = cls;
            trak.className = 'progress-' + cls;
        });

        prev.addEventListener('click', function () {
            var cls = trak.className.split('-').pop();
            cls < 1 ? cls = 7 : cls--;

            step.innerHTML = cls;
            trak.className = 'progress-' + cls;
        });
    </script>
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

    <!-- Progress Tracking Script -->

</body>

</html>
