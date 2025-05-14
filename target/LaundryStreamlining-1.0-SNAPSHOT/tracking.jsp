<%-- 
    Document   : tracking
    Created on : 29 Jun 2024, 5:08:46 pm
    Author     : husna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery Tracking</title>
    <link rel="stylesheet" href="path/to/your/styles.css">
</head>
<body>
    <!-- Page Header Start -->
    <div class="page-header container-fluid bg-secondary pt-2 pt-lg-5 pb-2 mb-5">
        <div class="container py-5">
            <div class="row align-items-center py-4">
                <div class="col-md-6 text-center text-md-left">
                    <h1 class="mb-4 mb-md-0 text-white">Delivery Tracking</h1>
                </div>
                <div class="col-md-6 text-center text-md-right">
                    <div class="d-inline-flex align-items-center">
                        <a class="btn text-white" href="index.jsp">Home</a>
                        <i class="fas fa-angle-right text-white"></i>
                        <a class="btn text-white disabled" href="#">Delivery Tracking</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Tracking Start -->
    <div class="container-fluid py-5">
        <div class="container">
            <!-- Tracking Progress -->
            <c:forEach var="delivery" items="${deliveries}">
                <div class="tracking-wrapper">
                    <div class="tracking">
                        <div class="progress progress-${delivery.status}">
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
                        <div>
                            <h3><c:out value="${delivery.deliveryName}"/></h3>
                            <p><c:out value="${delivery.address}"/></p>
                            <p>Status: <c:out value="${delivery.status}"/></p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- Tracking End -->

    <!-- Your existing footer content -->

    <script src="path/to/your/scripts.js"></script>
</body>
</html>
