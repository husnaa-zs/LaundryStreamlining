<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mvc.bean.*"%>
<%@page import="com.mvc.dao.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Laundry Booking</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Vuetify CSS -->
        <link href="https://cdn.jsdelivr.net/npm/vuetify@2.5.10/dist/vuetify.min.css" rel="stylesheet">
        <!-- Vue.js -->
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
        <!-- Vuetify JS -->
        <script src="https://cdn.jsdelivr.net/npm/vuetify@2.5.10/dist/vuetify.js"></script>

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

        <style>
            .form-container {
                display: flex;
                justify-content: center;
                flex-direction: column;
                align-items: center;
                margin-top: 20px;
            }

            .form-content {
                width: 100%;
                max-width: 600px;
            }

            .form-image {
                width: 100%;
                max-width: 600px;
                border-radius: 6px;
            }

            .form-group {
                margin-bottom: 1rem;
            }

            .form-group:last-of-type {
                margin-bottom: 0;
            }
            .btn-default {
                background-color: blue;
                color: white;
            }
            .btn-available {
                background-color: green;
                color: white;
            }

            .btn-unavailable {
                background-color: red;
                color: white;
            }

        </style>
    </head>

    <body>
         
        <div id="app">
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
            <v-app>
                <v-content>
                    <div class="container form-container">
                        <% 
                Connection connection = null;
                PreparedStatement statement = null;
                ResultSet resultSet = null;

                try {
                    // Establish database connection
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dobi", "root", "");

                    // Execute select statement to retrieve last booking details
                    String sql = "SELECT name,email,phone_number FROM user ORDER BY id DESC LIMIT 1";
                    statement = connection.prepareStatement(sql);
                    resultSet = statement.executeQuery();

                    // Process retrieved data
                    if (resultSet.next()) {
                        
                        String name = resultSet.getString("name");
                        String email = resultSet.getString("email");
                        String phone = resultSet.getString("phone_number");
                        
            %>
                        <div class="card-body" style="border: none; padding: 0;">
                            <h4 class="text-left mb-4">Booking Form</h4>

                            <div class="form-group">
                                <label for="inputName"><strong>Name</strong></label>
                                <small class="form-text text-muted"><%= name %></small>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail"><strong>Email</strong></label>
                                <small class="form-text text-muted"><%= email %></small>
                            </div>
                            <div class="form-group">
                                <label for="inputPhone"><strong>Phone</strong></label>
                                <small class="form-text text-muted"><%= phone %></small>
                            </div>
                             <% 
                    } // end if
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                } finally {
                    // Close resources
                    if (resultSet != null) {
                        try { resultSet.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                    if (statement != null) {
                        try { statement.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                    if (connection != null) {
                        try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                }
            %>
                            <form @submit.prevent="submitForm">
                                <div class="form-group row">
                                    <div class="col">
                                        <label for="inputLaundryWeight">Select Laundry Weight (kg):</label>
                                        <select class="form-control" v-model="kilo" required>
                                            <option value="" disabled selected>Weight</option>
                                            <option v-for="i in 15" :value="i">{{ i }} kg</option>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <legend class="col-form-label pt-0"><strong>Choose</strong></legend>
                                            <div class="form-check form-check-inline" v-for="(service, index) in services" :key="index">
                                                <input type="radio" class="form-check-input" :id="'service' + index" name="service" :value="service" @click="showModal(service)" required />
                                                <label class="form-check-label" :for="'service' + index">{{ service }}</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" v-if="selectedService && selectedTimeslot">
                                    <label for="machineSelection"><strong>Select Machine</strong></label>
                                    <select class="form-control" v-model="selectedMachine" required>
                                        <option v-for="machine in availableMachines" :value="machine">{{ machine }}</option>
                                    </select>
                                </div>
                                <v-dialog ref="dialogTest" v-model="modalTest" :return-value.sync="dateTest" persistent>
                                    <template v-slot:activator="{ on }"></template>
                                    <div class="text-center title">Select a Date & Time</div>
                                    <v-row justify="center">
                                        <v-col cols="6">
                                            <v-date-picker v-model="dateTest" scrollable>
                                                <div class="flex-grow-1"></div>
                                                <v-btn text color="primary" @click="modalTest = false">Cancel</v-btn>
                                                <v-btn text color="primary" @click="saveData">OK</v-btn>
                                            </v-date-picker>
                                        </v-col>
                                        <v-col cols="6">
                                            <v-col cols="6">
                                                <v-slide-y-transition>
                                                    <v-col cols="12" v-show="dateTest !== null">
                                                        <template v-for="allowedTime in allowedTimes">
                                                            <v-btn
                                                                @click="setTime(allowedTime)"
                                                                class="my-2"
                                                                :class="{
                                                                'btn-default': !isTimeAvailable(allowedTime) && availability[selectedService + '-' + allowedTime + '-' + selectedMachine + '-' + dateTest] === undefined,
                                                                'btn-unavailable': !isTimeAvailable(allowedTime),
                                                                'btn-available': isTimeAvailable(allowedTime)
                                                                }"
                                                                block
                                                                x-large
                                                                color="primary"
                                                                >{{ allowedTime }}</v-btn>
                                                        </template>
                                                    </v-col>
                                                </v-slide-y-transition>
                                            </v-col>
                                        </v-col>
                                    </v-row>
                                </v-dialog>
                                <div class="form-group">
                                    <legend class="col-form-label pt-0"><strong>Choose</strong></legend>
                                    <div class="form-check form-check-inline">
                                        <input type="radio" class="form-check-input" v-model="delivery" value="Leave at the concierge" required />
                                        <label class="form-check-label" for="inlineRadioDelivery1">Leave at the concierge (before the pickup time)</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="radio" class="form-check-input" v-model="delivery" value="Meet in person" required />
                                        <label class="form-check-label" for="inlineRadioDelivery2">Meet in person.</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="radio" class="form-check-input" v-model="delivery" value="Delivery" required />
                                        <label class="form-check-label" for="inlineRadioDelivery3">Delivery.</label>
                                    </div>
                                </div>
                                <hr />
                                <div class="form-group text-center">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                </v-content>
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


            </v-app>
        </div>
        <script>
new Vue({
    el: '#app',
    vuetify: new Vuetify(),
    data: () => ({
            kilo: '',
            service: '',
            delivery: '',
            modalTest: false,
            dateTest: null,
            time: null,
            services: ['Wash and Fold', 'Wash and Press', 'Dry Cleaning', 'Hand wash', 'Large items: Carpet / Curtain'],
            timeSlots: {
                'Wash and Press': ['9:00 am', '11:00 am', '02:00 pm', '04:00 pm', '06:00 pm', '08:00 pm'],
                'Wash and Fold': ['09:00 am', '12:00 pm', '02:00 pm', '05:00 pm', '08:00 pm'],
                'Dry Cleaning': ['09:00 am', '02:00 pm', '06:00 pm'],
                'Hand wash': ['09:00 am', '12:00 pm', '02:00 pm', '05:00 pm', '08:00 pm'],
                'Large items: Carpet / Curtain': ['09:00 am', '03:00 pm']
            },
            allowedTimes: [],
            machines: {
                'Wash and Press': ['Machine 1', 'Machine 2'],
                'Wash and Fold': ['Machine 3', 'Machine 4'],
                'Dry Cleaning': ['Machine 5'],
                'Hand wash': ['Machine 6'],
                'Large items: Carpet / Curtain': ['Machine 7', 'Machine 8']
            },
            selectedService: '',
            selectedTimeslot: '',
            selectedMachine: '',
            availableMachines: [],
            availability: {},
            menu: false
        }),
    methods: {
        fetchAvailability() {
            fetch('/LaundryStreamlining/api/checkAvailability')
                    .then(response => response.json())
                    .then(data => {
                        console.log('Availability data:', data);
                        this.availability = data; // Update the availability object
                    })
                    .catch(error => {
                        console.error('Error fetching availability:', error);
                    });
        },
        submitForm() {
            console.log('Submit button clicked');
            console.log('Selected date:', this.dateTest);
            const bookingData = {
                kilo: this.kilo,
                services: this.selectedService,
                machines: this.selectedMachine,
                dateString: this.dateTest, // Ensure this binds correctly
                time_slot_id: this.selectedTimeslot,
                delivery: this.delivery
            };

            console.log('Booking data:', bookingData);

            fetch('/LaundryStreamlining/api/booking', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(bookingData)
            })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            alert('Booking successful');
                    // Redirect to list.jsp after alert
      window.location.replace('details.jsp');
                        } else {
                            alert('Booking failed:Machine or time slot is occupied' + data.message);
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });

        },
        showModal(service) {
            this.selectedService = service;
            this.allowedTimes = this.timeSlots[service];
            this.modalTest = true;
        },
        saveData() {
            this.modalTest = false;
        },
        setTime(time) {
            this.selectedTimeslot = time;
        },
        isTimeAvailable(time) {
            var key = this.selectedService + '-' + time + '-' + this.selectedMachine + '-' + this.dateTest;
            return this.availability[key] !== 'unavailable';
        },
        updateMachineOptions(service) {
            this.availableMachines = this.machines[service] || [];
        },
        updateTimeSlots() {
            if (this.selectedService && this.selectedMachine && this.dateTest) {
                this.allowedTimes = this.timeSlots[this.selectedService] || [];
            }
        }
    },
    watch: {
        selectedService(newService) {
            this.updateMachineOptions(newService);
        },
        selectedMachine(newMachine) {
            this.updateTimeSlots();
        },
        dateTest(newDate) {
            this.updateTimeSlots();
        }
    },
    mounted() {
        this.fetchAvailability();
    }
});
        </script>
    </body>
</html>
