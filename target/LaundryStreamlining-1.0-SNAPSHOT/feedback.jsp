<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Laundry Service Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">
        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css"rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/form.css" rel="stylesheet">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;800&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <style>
            .logo img {
                width: 100%;
                height: auto;
                max-height: 400px; /* Adjust this value as needed */
                object-fit: cover;
                object-position: center;
                margin: 0 auto; /* Center the image horizontally */
            }
            .container-fluid {
                width: 100%;
                padding-right: 15px;
                padding-left: 15px;
                margin-right: auto;
                margin-left: auto;
            }
            .navbar-brand h1 {
                font-size: 24px;
            }
            .navbar-nav .nav-link {
                font-size: 18px;
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

        <div class="container-fluid pt-1" style="max-width: 100%;">
            <a href="#" class="logo">
                <img src="img/main.png" class="w-100 img-fluid" alt="Feedback image">
            </a>
        </div><!-- Picture Section Start -->
        
        <!-- Picture Section End -->

        <!-- Trustmary Widget Start -->
        <div id="trustmary-widget">
            <!-- Trustmary Widget Script -->
            <script src="https://widget.trustmary.com/d5AmUdBWa"></script>
        </div>
        <!-- Trustmary Widget End -->

        <!-- Working Process Start -->

       <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="row align-items-center">
                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <h2 class="mb-5">${feedback != null ? 'Edit Your Feedback' : 'We value your feedback!'}</h2>
                        <form action="${pageContext.request.contextPath}/feedback?action=${feedback != null ? 'update' : 'insert'}" method="post">
                            <c:if test="${feedback != null}">
                                <input type="hidden" name="id" value="${feedback.id}">
                            </c:if>
                            <div class="row">
                                <div class="col-md-12 form-group">
                                    <textarea class="form-control" name="message" id="message" cols="30" rows="7" placeholder="Write your message">${feedback != null ? feedback.message : ''}</textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <input type="submit" id="submit-button" value="${feedback != null ? 'Update Message' : 'Send Message'}" class="btn btn-primary rounded-0 py-2 px-4">
                                    <span class="submitting"></span>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-6">
                        <img src="img/1.png" alt="feedback" class="img-fluid" width="500" height="600">
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!-- Working Process End -->

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
            document.getElementById('submit-button').addEventListener('click', function () {
                alert('Feedback is successfully sent!');
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var widgetContainer = document.getElementById('trustmary-widget');
                var pictureSection = document.querySelector('.container-fluid.pt-1');

                if (pictureSection && widgetContainer) {
                    pictureSection.insertAdjacentElement('afterend', widgetContainer);
                }

                // Function to remove the specific part with the text "Google review widget by trustmary"
                function removeTrustmaryText() {
                    // Try to find the element by inspecting the DOM and updating the selector below
                    var trustmaryText = document.querySelector('.go4269172405'); // Adjust the selector based on your inspection
                    if (trustmaryText) {
                        trustmaryText.style.display = 'none';
                    }
                }

                // Run the function after a slight delay to ensure the widget has loaded
                setTimeout(removeTrustmaryText, 1); // Adjust the delay if necessary
            });
        </script>
    </body>
</html>
