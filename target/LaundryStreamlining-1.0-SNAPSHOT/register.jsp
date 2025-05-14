<%-- 
    Document   : register
    Created on : 2 Jan 2024, 8:43:45 pm
    Author     : husna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Laundry Service Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- CSS -->
        <link rel="stylesheet" href="css/style1.css">

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

                </nav>
            </div>
        </div>
        <!-- Signup Form -->


       <section class="container forms">
    <div class="form login">
        <div class="form-content">
       <header>${register != null ? 'Edit User' : 'Signup'}</header>
            <form action="${pageContext.request.contextPath}/Register" method="post">
          <c:if test="${register != null}">
                    <input type="hidden" name="id" value="${register.id}">
                </c:if>

                <div class="field input-field">
                    <input type="text" name="username" placeholder="Username" class="input" value="${register != null ? register.username : ''}">
                </div>

                <div class="field input-field">
                    <input type="text" name="name" placeholder="Name" class="input" value="${register != null ? register.name : ''}">
                </div>

                <div class="field input-field">
                    <input type="text" name="phone_number" placeholder="Phone Number" class="input" value="${register != null ? register.phone_number : ''}">
                </div>

                <div class="field input-field">
                    <input type="password" name="password" placeholder="Password" class="input" value="${register != null ? register.password : ''}">
                    <i class='bx bx-hide eye-icon'></i>
                </div>

                <div class="field input-field">
                    <input type="email" name="email" placeholder="Email" class="input" value="${register != null ? register.email : ''}">
                </div>

                <div class="field button-field">
                    <button type="submit">${register != null ? 'Update' : 'Signup'}</button>
                </div>

                <div class="form-link">
                    <span>Already have an account? <a href="#" class="link login-link" onclick="redirectToLogin()">Login</a></span>
                </div>
            </form>
        </div>
    </div>
</section>


                        <div class="form-link">
                            <span>Already have an account? <a href=# class="link login-link" onclick="redirectToLogin()">Login</a></span>
                        </div>
                </div>
            </div>
        </div>
    </section>


    <!-- JavaScript -->
    <script src="js/script.js"></script>
    <script>
                                function redirectToLogin() {
                                    window.location.href = "login.jsp";
                                }
    </script>
</body>
</html>