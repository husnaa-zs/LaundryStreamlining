<%-- 
    Document   : payment
    Created on : 2 May 2024, 10:27:24 am
    Author     : husna
--%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CareNet Donation</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.html">CareNet Donation</a>
            <!-- <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span> -->
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="abt.html">About us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cont.html">Contact</a>
                    </li>


                </ul>

            </div>
        </div>
    </nav>

    <div id="backgroundimage"></div>
    <div class="header-text">
        
    </div>
    <center>
        <div id="backgroundimage"></div>
        <div class="header-text">
            <h1 class="a"><b>Giving Is Not Just <br><span> Making A Donation.... </span></b></h1>
            <h1 class="b"><b>It's About <span>Making A <a>Difference</a></span></b></h1>
            <p class="c"><b>A SMALL DONATION CAN MAKE A BIG DIFFERENCE</b></p>
        </div>
        <form>
            <script src="https://checkout.razorpay.com/v1/payment-button.js" data-payment_button_id="pl_O1bYIW0hI8XWUU" async> </script> 
        </form>
    </center>

</body>

</html> 