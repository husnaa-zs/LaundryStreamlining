<%-- 
    Document   : bookinglistadmin
    Created on : 16 Jan 2024, 3:51:01 pm
    Author     : husna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Tables</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laundry Booking</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
  <!-- Custom styles for this template -->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color:blue">
                <div>
                    <a href="" class="navbar-brand">Laundry Booking</a>
                </div>

                <ul class="navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Booking</a></li>
                </ul>
            </nav>
        </header>
        <br>

        <div class="row">
            <div class="container">
                <h3 class="text-center">List of Bookings</h3>
                <hr>

                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Date</th>
                            <th>Start Time</th>
                            <th>Start Minute</th>
                            <th>End Time</th>
                            <th>End Minute</th>
                            <th>Service</th>
                            <th>Delivery</th>
                            <th>Kilo</th>
                            <!-- Add more columns as needed based on your Booking class attributes -->
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="booking" items="${listBooking}">
                            <tr>
                                <td><c:out value="${booking.id}"/></td>
                                <td><c:out value="${booking.name}"/></td>
                                <td><c:out value="${booking.email}"/></td>
                                <td><c:out value="${booking.phone}"/></td>
                                <td><c:out value="${booking.date}"/></td>
                                <td><c:out value="${booking.starttime}"/></td>
                                <td><c:out value="${booking.startminute}"/></td>
                                <td><c:out value="${booking.endtime}"/></td>
                                <td><c:out value="${booking.endminute}"/></td>
                                <td><c:out value="${booking.service}"/></td>
                                <td><c:out value="${booking.delivery}"/></td>
                                <td><c:out value="${booking.kilo}"/></td>
                                <!-- Add more columns as needed based on your Booking class attributes -->
                                <td>
                                    <a href="<%=request.getContextPath()%>/BookingListServlet/edit?id=<c:out value='${booking.id}'/>">Edit</a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="<%=request.getContextPath()%>/BookingListServlet/delete?id=<c:out value='${booking.id}'/>">Delete</a>

                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
