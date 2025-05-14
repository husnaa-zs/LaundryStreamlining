<%-- 
    Document   : newjsp1
    Created on : 25 May 2024, 1:59:51 am
    Author     : husna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css?family=Kaushan+Script&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
        <title>JSP Page</title>
        <style>
            body{
                margin: 0;
                padding: 0;
            }

            .main
            {
                width: 100%;
                height: 100vh;
                display: inline-flex;

            }

            .main .box1
            {
                width: 50%;
                height: 100%;

                background-color:teal;
                background-image: url(https://firebasestorage.googleapis.com/v0/b/my-project-1544342477588.appspot.com/o/wait3.svg?alt=media&token=55756526-eef4-40c4-881d-5c371f375dc5);
                background-size: cover;
                background-position: center;
            }

            .box2
            {
                width: 50%;
                height: 100%;

            }

            @media only screen and (max-width: 600px) {
                .main  {
                    display: block;
                }
                .main .box1
                {
                    width: 100%;
                    height: 70vh;
                }
                .box2
                {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <div class="main">
            <div class="box1">
                <div class="hero is-fullheight">
                    <nav class="navbar" role="navigation" aria-label="main navigation">
                        <div class="navbar-brand">
                            <a class="navbar-item" href="https://bulma.io">
                                <i class="fa fa-arrow-left has-text-white"></i>
                            </a>
                        </div>
           <div class="payment-info flex justify-space-between">
                                    <div class="column billing">
                                        <div class="box1" style="background-color: #f0f0f0; padding: 10px; border: 1px solid #ddd;">
                                            <div class="title flex">
                                                <h2>You are paying</h2>
                                                <p>RM12.00 MYR</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="column shipping">
                                        <form>
                                            <label for="email">Email:</label>
                                            <input type="email" id="email" name="email"><br><br>
                                            <label for="paymentMethod">Select Payment Method:</label>
                                            <img src="img/qrCodeImage.jpg" alt="QR Code Image" style="width: 120%; margin: 100px; border: 10px solid #ddd; border-radius: 5px;">
                                            <input type="submit" value="Pay RM0.00">
                                        </form>
                                    </div>
                                </div>
                    <div class="hero-body has-text-centered">
                    </div>
                </div>
            </div>
            <div class="box2">
                <div class="hero is-fullheight">
                    <div class="hero-body">
                        <div class="container">
                            <div class="columns is-centered">
                                <div class="column">
                                    <form action="" class="notification" style="background-color:transparent;">
                                        <div class="field">
                                        </div>
                                        <div class="field">
                                        </div>
                                </div>
                                <div class="field has-text-centered">
                                </div>
                                <div class="field has-text-centered">
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>