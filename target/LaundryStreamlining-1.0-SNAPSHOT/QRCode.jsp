<%-- 
    Document   : QRCode
    Created on : 25 May 2024, 1:38:47 am
    Author     : husna
--%>

<%@page import="java.sql.*" %>
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
        <style>

            .payment-info {
                display: flex;
                justify-content: space-between;
            }

            .column {
                flex-basis: 50%;
            }

            .title {
                display: flex;
                align-items: center;
            }

            .title h2 {
                margin-right: 20px;
            }

            .title p {
                margin-right: 20px;
            }

            form {
                flex: 1;
            }
            a {
                color: #28333b;
                text-decoration: none;
                border-bottom: 2px solid rgba(64, 179, 255, .5);
                opacity: .75;
                transition: all .5s ease;
            }
            a:hover {
                border-bottom: 2px solid rgba(64, 179, 255, 1);
                opacity: 1;
            }
            .paypal-button-container {
                width: 70px; /* Adjust the width as needed */
                height: 50px; /* Adjust the height as needed */
            }
            .field {
                margin-bottom: 25px;
            }
            .field.full {
                width: 100%;
            }
            .field.half {
                width: calc(50% - 12px);
            }

            label {
                display: block;
                text-transform: uppercase;
                font-size: 12px;
                margin-bottom: 8px;
            }

            input {
                padding: 12px;
                border-radius: 6px;
                border: 2px solid #e8ebed;
                display: block;
                font-size: 14px;
                width: 100%;
                box-sizing: border-box;
            }


            .flex {
                display: flex;
                flex-direction: row;
                wrap: wrap;
                align-items: center;
            }
            .flex.justify-space-between {
                justify-content: space-between;
            }

            .card {
                padding: 50px;
                margin: 50px auto;
                max-width: 850px;
                background: #ffffff;
                border-radius: 6px;
                box-sizing: border-box;
                box-shadow: 0px 24px 60px -1px rgba(37,44,54,0.14);
            }

            .container {
                max-width: 700px;
                margin: 0 auto;
            }

            .card-title {
                margin-bottom: 50px;
            }
            .card-title h2 {
                margin: 0;
            }

            .card-body .payment-type,
            .card-body .payment-info {
                margin-bottom: 25px;
            }

            .card-body .payment-type h4 {
                margin: 0;
            }

            .card-body .payment-type .types {
                margin: 25px 0;
            }

            .card-body .payment-type .type {
                width: 30%;
                position: relative;
                background: #f2f4f7;
                border: 2px solid #e8ebed;
                padding: 15px;
                box-sizing: border-box;
                border-radius: 6px;
                cursor: pointer;
                text-align: center;
                transition: all .5s ease;
            }
            .card-body .payment-type .type:hover {
                border-color: #28333b;
            }
            .card-body .payment-type .type.selected {
                border-color: #40b3ff;
                background: rgba(64, 179, 255, .1);
            }
            .card-body .payment-type .type.selected .logo {
                color: #40b3ff;
            }
            .card-body .payment-type .type.selected p {
                color: #28333b;
            }

            .card-body .payment-type .type {
                width: 30%;
                height: 150px; /* Adjust the height as needed */
                position: relative;
                background: #f2f4f7;
                border: 2px solid #e8ebed;
                padding-right: 25px;
                box-sizing: border-box;
                border-radius: 6px;
                cursor: pointer;
                text-align: center;
                transition: all .5s ease;
            }

            .card-body .payment-info .column {
                width: calc(50% - 25px);
            }

            .card-body .payment-info .title {
                display: flex;
                flex-direction: row;
                align-items: center;
            }
            .card-body .payment-info .title .num {
                height: 24px;
                width: 24px;
                border-radius: 50%;
                border: 2px solid #40b3ff;
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
                margin-right: 12px;
                font-size: 12px;
            }

            footer {
                margin: 50px auto;
                max-width: 850px;
                text-align: center;
            }

            .button {
                text-transform: uppercase;
                font-weight: 600;
                font-size: 12px;
                letter-spacing: .5px;
                padding: 15px 25px;
                border-radius: 50px;
                cursor: pointer;
                transition: all .5s ease;
                background: transparent;
                border: 2px solid transparent;
            }
            .button.button-link {
                padding: 0 0 2px;
                margin: 0 25px;
                border-bottom: 2px solid rgba(64, 179, 255, .5);
                border-radius: 0;
                opacity: .75;
            }
            .button.button-link:hover {
                border-bottom: 2px solid rgba(64, 179, 255, 1);
                opacity: 1;
            }
            .button.button-primary {
                background: #40b3ff;
                color: #fff;
            }
            .button.button-primary:hover {
                background: #218fd9;
            }
            .button.button-secondary {
                background: transparent;
                border-color: #e8ebed;
                color: #8a959c;
            }
            .button.button-secondary:hover {
                border-color: #28333b;
                color: #28333b;
            }

        </style>
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
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
            <div class="container-lg position-relative p-0" style="padding-left: 0; padding-right: 0;">
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
        <!-- Page Header Start -->

        <div class="container-fluid py-5">
            <div class="container">
                <div class="row align-items-center">
                    <article class="card">
                        <div class="container">
                            <div class="card-title">
                                <h2>Payment</h2>
                            </div>
                            <div class="card-body">
                                <div class="payment-type">
                                    <h4>Choose payment method below</h4>
                                    <div class="types flex justify-space-between">
                                        <div class="type" onclick="selectPaymentMethod('credit-card')">
                                            <div class="logo">
                                                <i class="far fa-credit-card"></i>
                                            </div>
                                            <div class="text">
                                                <p>Pay with Credit Card</p>
                                            </div>
                                        </div>
                                       
                                        <div class="type" onclick="selectPaymentMethod('Paypal')">
                                            <div class="logo">
                                                <i class="fab fa-paypal"></i>
                                            </div>
                                            <div class="text">
                                                <p>Pay with Paypal</p>
                                            </div>
                                            <!-- Set up a container element for the PayPal button -->
                                            <div id="paypal-button-container" style="max-width: 150px; max-height: 40px; margin: 0 auto;"></div>
                                        </div>
                                        <div class="type" onclick="selectPaymentMethod('qr')">
                                            <div class="logo">
                                                <i class=" fa-amazon"></i>
                                            </div>
                                            <div class="text">
                                                <p>Pay with QR Code</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% 
                            Connection conn = null;
                            PreparedStatement pstmt = null;
                            ResultSet rs = null;
                            String totalWithTax = "N/A"; // default value
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dobi","root","");
                                pstmt = conn.prepareStatement("SELECT totalWithTax FROM pickup ORDER BY id DESC LIMIT 1");
                                rs = pstmt.executeQuery();
                                if(rs.next()) {
                                    totalWithTax = rs.getString("totalWithTax");
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                if(rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                                if(pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                                if(conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                            }
                            %>
                                <div class="payment-info flex justify-space-between">
                                    <div class="column billing">
                                        
                                        
                                        <h2>You are paying RM<%= totalWithTax %></h2>
                                        <div class="title">
                                           

                                        </div>
                                    </div>
                                    <div class="column shipping">
                                        <div class="title">
                                            <div class="num">2</div>
                                            <h4>QR Code Payment</h4> </div>
                                        <label for="email">Email:</label>
                                        <input type="email" id="email" name="email"><br><br>

                                        <form action="upload" method="post" enctype="multipart/form-data">

                                            <img src="img/Laundry.png" alt="QR Code Image" style="width: 100%; margin: 10px; border: 0px solid #ddd; border-radius: 5px;">
                                            <label for="receipt">Upload Receipt:</label>
                                            <input type="file" id="receipt" name="receipt"  accept="image/*,.pdf"" required><br><br>
                                            <button class="button button-primary" onclick="proceed()">Proceed</button>
                                        </form>
                                    </div>
                                </div>
                            </div>


                            <div class="card-actions flex justify-space-between">
                                <div class="flex-start">
                                    <button class="button button-secondary" onclick="returnToStore()">Return to Store</button>
                                </div>
                                <div class="flex-end">
                                    <button class="button button-link" onclick="backToShipping()">Back to Shipping</button>

                                </div>
                            </div>
                    </article>
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

<!-- Include the PayPal JavaScript SDK -->
<script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD&disable-funding=card&intent=authorize"></script>

<script>
                                        // Render the PayPal button into #paypal-button-container
                                        paypal.Buttons({

                                            style: {
                                                layout: 'vertical', // Change to 'horizontal' if you want a horizontal layout
                                                color: 'gold', // Change color to 'blue', 'silver', 'black', or 'white'
                                                shape: 'pill', // Change shape to 'rect' for a rectangular button
                                                label: 'pay', // Change label to 'checkout' or 'paypal'
                                                // Change size to 'small', 'medium', 'large', or 'responsive'
                                                height: 40, // Set the height of the button
                                                width: 150
                                            }

                                        }).render('#paypal-button-container');
</script>
<script>
    function selectPaymentMethod(method) {
        // Remove the 'selected' class from all payment types
        var paymentTypes = document.querySelectorAll('.type');
        paymentTypes.forEach(function (type) {
            type.classList.remove('selected');
        });

        // Add the 'selected' class to the clicked payment type
        var selectedType;
        switch (method) {
            case 'credit-card':
                selectedType = paymentTypes[0];
                window.location.href = 'PaymentForm.jsp';
                break;
            case 'Online':
                selectedType = paymentTypes[1];
                break;
            case 'Paypal':
                selectedType = paymentTypes[2];
                break;
            case 'qr':
                selectedType = paymentTypes[3];
                window.location.href = 'QRCode.jsp'; // Redirect to the 'qr' page
                return; // Exit the function to avoid further execution
            default:
                selectedType = paymentTypes[0];
        }
        selectedType.classList.add('selected');
    }
</script>
<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>
</html>