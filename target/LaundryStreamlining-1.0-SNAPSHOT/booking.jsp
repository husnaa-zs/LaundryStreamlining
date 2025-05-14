<%-- 
    Document   : booking
    Created on : 3 Jan 2024, 8:21:29 am
    Author     : husna
<!---->
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Laundry Booking</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- CSS -->
        <link rel="stylesheet" href="css/style1.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
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
                            <a href="index.html" class="nav-item nav-link active">Home</a>
                            <a href="about.html" class="nav-item nav-link">About</a>
                            <a href="service.html" class="nav-item nav-link">Services</a>
                            <a href="pricing.html" class="nav-item nav-link">Pricing</a>
                            <a href="contact.html" class="nav-item nav-link">Contact</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="container" style="display: flex; align-items: center; justify-content: center;margin-left: -9px;">
            <div class="container-fluid" style="display: flex; align-items: center; justify-content: center;">

                <!-- Your image goes here -->
                <img src="img/laundryform.png" alt="form" class="form-image" style="width: 90%; border-radius: 6px;">
            </div>
            <section class="container forms" style="border:none">

                <div class="form login" style="border:none">
                    <div class="form-content" style="border:none">

                        <!-- Start Card -->
                        <div class="card" style="border:none">
                            <!-- Start Card Body -->
                            <div class="card" style="border: none; width: 240%;length:240%">
                                <h4 class="text-left mb-4">Booking Form</h4>
                                <!-- Start Form -->

                                <c:if test="${booking == null}">
                                    <form id="bookingForm" action="booking" method="post" class="needs-validation" novalidate autocomplete="off">
                                    </c:if>
                                    <c:if test="${booking != null}">
                                        <form id="bookingForm" action="update" method="post" class="needs-validation" novalidate autocomplete="off">
                                            <input type="hidden" class="form-control" name="id" value="<c:out value='${booking.id}'/>" />
                                        </c:if>


                                        <!-- Start Input Name -->
                                        <div class="form-group">
                                            <label for="inputName"><strong>Name</strong></label>

                                            <input type="text" class="form-control" name="name" value="<c:out value='${booking.name}'/> ${param.regName}" placeholder="Your name" required />
                                            <small class="form-text text-muted">Please fill your name</small>
                                        </div>
                                        <!-- End Input Name -->

                                        <!-- Start Input Email -->
                                        <div class="form-group">
                                            <label for="inputEmail"><strong>Email</strong></label>
                                            <input type="email" class="form-control" id="inputEmail" name="email" value="<c:out value='${booking.email}'/>${param.regEmail}" placeholder="Enter email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required />

                                            <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                                        </div>
                                        <!-- End Input Email -->

                                        <!-- Start Input Telephone -->
                                        <div class="form-group">
                                            <label for="inputPhone"><strong>Phone</strong></label>
                                            <input type="tel" class="form-control" id="inputPhone" name="phone" value="<c:out value='${booking.phone}'/>${param.regPhone}" placeholder="099xxxxxxx" pattern="\d{3}\d{3}\d{4}" required />
                                            <small class="form-text text-muted">We'll never share your phone number with anyone else.</small>
                                        </div>
                                        <!-- End Input Telephone -->

                                        <!-- Start Input Date , Start Time and End Time -->
                                        <div class="form-row">
                                            <!-- Start Input Date -->
                                            <div class="form-group col-md-4">
                                                <label for="inputDate"><strong>Date</strong></label>
                                                <input type="date" class="form-control" id="inputDate" name="date" value="<c:out value='${booking.date}'/>" required />
                                                <small class="form-text text-muted">Please choose date and time.</small>
                                            </div>
                                            <!-- End Input Date -->

                                            <!-- Start Input Start Time -->
                                            <div class="form-group col-md-4">
                                                <label><strong>Start Time</strong></label>
                                                <div class="d-flex flex-row justify-content-between align-items-center">
                                                    <select class="form-control mr-1" id="inputStartTimeHour" name="StartTime" value="<c:out value='${booking.starttime}'/>" required>
                                                        <c:if test="${booking.endtime != null}">
                                                            <option value="<c:out value='${booking.starttime}'/>" ><c:out value='${booking.starttime}'/></option>
                                                        </c:if>
                                                        <c:if test="${booking.starttime == null}">
                                                            <option value="" disabled selected>Hour</option>
                                                        </c:if>
                                                        <option value="08">08</option>
                                                        <option value="09">09</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>
                                                        <option value="12">12</option>
                                                        <option value="13">13</option>
                                                        <option value="14">14</option>
                                                        <option value="15">15</option>
                                                    </select>
                                                    <div class="pl-1 pr-2">:</div>
                                                    <select class="form-control" id="inputStartTimeMinute" name="StartMinute" value="<c:out value='${booking.startminute}'/>" required>
                                                        <c:if test="${booking.startminute != null}">
                                                            <option value="<c:out value='${booking.startminute}'/>" ><c:out value='${booking.startminute}'/></option>
                                                        </c:if>
                                                        <c:if test="${booking.startminute == null}">
                                                            <option value="" disabled selected>Minute</option>
                                                        </c:if>
                                                        <option value="00">00</option>
                                                        <option value="00">30</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <!-- End Input Start Time -->

                                            <!-- Start Input End Time -->
                                            <div class="form-group col-md-4">
                                                <label><strong>End Time</strong></label>
                                                <div class="d-flex flex-row justify-content-between align-items-center">
                                                    <select class="form-control mr-1" id="inputEndTimeHour" name="EndTime" value="<c:out value='${booking.endtime}'/>" required>
                                                        <c:if test="${booking.endtime != null}">
                                                            <option value="<c:out value='${booking.endtime}'/>" ><c:out value='${booking.endtime}'/></option>
                                                        </c:if>
                                                        <c:if test="${booking.endtime == null}">
                                                            <option value="" disabled selected>Hour</option>
                                                        </c:if>

                                                        <option value="09">09</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>
                                                        <option value="12">12</option>
                                                        <option value="13">13</option>
                                                        <option value="14">14</option>
                                                        <option value="15">15</option>
                                                        <option value="16">16</option>
                                                    </select>
                                                    <div class="pl-1 pr-2">:</div>
                                                    <select class="form-control" id="inputEndTimeMinute" name="EndMinute" value="<c:out value='${booking.endminute}'/>" required>
                                                        <c:if test="${booking.endminute != null}">
                                                            <option value="<c:out value='${booking.endminute}'/>" ><c:out value='${booking.endminute}'/></option>
                                                        </c:if>
                                                        <c:if test="${booking.endminute == null}">
                                                            <option value="" disabled selected>Minute</option>
                                                        </c:if>
                                                        <option value="00">00</option>
                                                        <option value="00">30</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <!-- End Input End Time -->
                                        </div>

                                        <!-- End Input Date , Start Time and End Time -->

                                        <!-- Start service Type -->
                                        <div class="form-group">
                                            <legend class="col-form-label pt-0"><strong>Choose</strong> </legend>
                                            <div class="form-check form-check-inline">
                                                <input type="radio" class="form-check-input" id="inlineRadioType1" name="service" value="Wash and Fold" <c:if test="${booking.service eq 'type1'}">checked</c:if>required />
                                                    <label class="form-check-label" for="inlineRadioType1">Wash and Fold </label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input type="radio" class="form-check-input" id="inlineRadioType2" name="service" value="Wash and Press" <c:if test="${booking.service eq 'type2'}">checked</c:if> required />
                                                    <label class="form-check-label" for="inlineRadioType2">Wash and Press </label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input type="radio" class="form-check-input" id="inlineRadioType3" name="service" value="Dry Cleaning" <c:if test="${booking.service eq 'type3'}">checked</c:if> required />
                                                    <label class="form-check-label" for="inlineRadioType3">Dry Cleaning </label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input type="radio" class="form-check-input" id="inlineRadioType4" name="service" value="Hand wash" <c:if test="${booking.service eq 'type4'}">checked</c:if> required />
                                                    <label class="form-check-label" for="inlineRadioType4">Hand wash</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input type="radio" class="form-check-input" id="inlineRadioType4" name="service" value="Large items: Carpet / Curtain" <c:if test="${booking.service eq 'type5'}">checked</c:if> required />
                                                    <label class="form-check-label" for="inlineRadioType5">Large items: Carpet / Curtain</label>
                                                </div>
                                            </div>
                                            <!-- End Check Room Type -->
                                            <!-- How will you pass the item  -->
                                            <div class="form-group">
                                                <legend class="col-form-label pt-0"><strong>Choose</strong> </legend>
                                                <div class="form-check form-check-inline">
                                                    <input type="radio" class="form-check-input" id="inlineRadioType1" name="delivery" value="Leave at the concierge" <c:if test="${booking.delivery eq 'type1'}">checked</c:if> required />
                                                    <label class="form-check-label" for="inlineRadioType1">Leave at the concierge (before the pickup time)</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input type="radio" class="form-check-input" id="inlineRadioType2" name="delivery" value="Meet in person" <c:if test="${booking.delivery eq 'type2'}">checked</c:if> required />
                                                    <label class="form-check-label" for="inlineRadioType2">Meet in person.
                                                    </label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input type="radio" class="form-check-input" id="inlineRadioType3" name="delivery" value="Delivery" <c:if test="${booking.delivery eq 'type3'}">checked</c:if> required />
                                                    <label class="form-check-label" for="inlineRadioType3">Delivery. </label>
                                                </div>

                                            </div>
                                            <div class="form-group">
                                                <label for="inputLaundryWeight">Select Laundry Weight (kg):</label>
                                                <select class="form-control" id="inputLaundryWeight" name="kilo" required>
                                                <c:if test="${booking.kilo != null}">
                                                    <option value="<c:out value='${booking.kilo}'/>"><c:out value='${booking.kilo}'/></option>
                                                </c:if>
                                                <c:if test="${booking.kilo == null}">
                                                    <option value="" disabled selected>Weight</option>
                                                </c:if>
                                                <c:forEach var="i" begin="0" end="15">
                                                    <option value="${i}">${i} kg</option>
                                                </c:forEach>
                                            </select>
                                        </div>       
                                        <!-- End Check Room Type -->
                                        <hr />
                                        <!-- Start Submit Button -->
                                        <div class="form-group text-center">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                        <!-- End Submit Button -->
                                    </form>

                            </div>
                        </div>
                    </div>
                </div>

            </section>
            <script src="js/script.js"></script>
            <script>
                // Example starter JavaScript for disabling form submissions if there are invalid fields
                (function () {
                    "use strict";
                    window.addEventListener(
                            "load",
                            function () {
                                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                                var forms = document.getElementsByClassName("needs-validation");
                                // Loop over them and prevent submission
                                var validation = Array.prototype.filter.call(forms, function (form) {
                                    form.addEventListener(
                                            "submit",
                                            function (event) {
                                                if (form.checkValidity() === false) {
                                                    event.preventDefault();
                                                    event.stopPropagation();
                                                }
                                                form.classList.add("was-validated");
                                            },
                                            false
                                            );
                                });
                            },
                            false
                            );
                })();
            </script>

    </body>
</html>
