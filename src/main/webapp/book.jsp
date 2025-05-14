<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
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
        <!-- Vue.js -->
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
        <!-- Vuetify JS -->
        <script src="https://cdn.jsdelivr.net/npm/vuetify@2.5.10/dist/vuetify.js"></script>
        <!-- Vuetify CSS -->
        <link href="https://cdn.jsdelivr.net/npm/vuetify@2.5.10/dist/vuetify.min.css" rel="stylesheet">
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
        <div class="container" style="display: flex; align-items: center; justify-content: center; margin-left: -9px;">
            <div class="container-fluid" style="display: flex; align-items: center; justify-content: center;">
                <img src="img/laundryform.png" alt="form" class="form-image" style="width: 90%; border-radius: 6px;">
            </div>
            <section class="container forms" style="border: none;">
                <div class="form login" style="border: none;">
                    <div class="form-content" style="border: none;">
                        <div class="card" style="border: none;">
                            <div class="card" style="border: none; width: 240%; length: 240%;">
                                <h4 class="text-left mb-4">Booking Form</h4>
                                <form>
                                    <div class="form-group">
                                        <label for="inputName"><strong>Name</strong></label>
                                        <input type="text" class="form-control" id="inputName" name="name" required />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail"><strong>Email</strong></label>
                                        <input type="email" class="form-control" id="inputEmail" name="email" required />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPhone"><strong>Phone</strong></label>
                                        <input type="tel" class="form-control" id="inputPhone" name="phone" placeholder="099xxxxxxx" pattern="\d{10}" required />
                                        <small class="form-text text-muted">We'll never share your phone number with anyone else.</small>
                                    </div>
                                    <div id="app">
                                        <v-app>
                                            <v-content>
                                                <v-container>
                                                    <div class="form-group row">
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
                                                    <v-dialog ref="dialogTest" v-model="modalTest" :return-value.sync="dateTest" persistent>
                                                        <template v-slot:activator="{ on }"></template>
                                                        <div class="text-center title">Select a Date & Time</div>
                                                        <v-row justify="center">
                                                            <v-date-picker v-model="dateTest" scrollable>
                                                                <div class="flex-grow-1"></div>
                                                                <v-btn text color="primary" @click="modalTest = false">Cancel</v-btn>
                                                                <v-btn text color="primary" @click="saveData">OK</v-btn>
                                                            </v-date-picker>
                                                            <v-slide-y-transition>
                                                                <v-col cols="2" v-show="dateTest !== null">
                                                                    <template v-for="allowedTime in allowedTimes">
                                                                        <v-btn
                                                                            @click="setTime(allowedTime)"
                                                                            class="my-2"
                                                                            :outlined="allowedTime !== time"
                                                                            block
                                                                            x-large
                                                                            color="primary"
                                                                            >{{ allowedTime }}</v-btn>
                                                                    </template>
                                                                </v-col>
                                                            </v-slide-y-transition>
                                                        </v-row>
                                                    </v-dialog>

                                                    {{ dateTest }}
                                                </v-container>
                                            </v-content>
                                        </v-app>
                                    </div>
                                    <div class="form-group">
                                        <legend class="col-form-label pt-0"><strong>Choose</strong></legend>
                                        <div class="form-check form-check-inline">
                                            <input type="radio" class="form-check-input" id="inlineRadioDelivery1" name="delivery" value="Leave at the concierge" required />
                                            <label class="form-check-label" for="inlineRadioDelivery1">Leave at the concierge (before the pickup time)</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input type="radio" class="form-check-input" id="inlineRadioDelivery2" name="delivery" value="Meet in person" required />
                                            <label class="form-check-label" for="inlineRadioDelivery2">Meet in person.</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input type="radio" class="form-check-input" id="inlineRadioDelivery3" name="delivery" value="Delivery" required />
                                            <label class="form-check-label" for="inlineRadioDelivery3">Delivery.</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputLaundryWeight">Select Laundry Weight (kg):</label>
                                        <select class="form-control" id="inputLaundryWeight" name="kilo" required>
                                            <option value="" disabled selected>Weight</option>
                                            <c:forEach var="i" begin="0" end="15">
                                                <option value="${i}">${i} kg</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <hr />
                                    <div class="form-group text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <script>
                new Vue({
                    el: '#app',
                    vuetify: new Vuetify(),
                    data: () => ({
                        modalTest: false,
                        dateTest: null,
                        time: null,
                        services: ['Wash and Fold', 'Wash and Press', 'Dry Cleaning', 'Hand wash', 'Large items: Carpet / Curtain'],
                        timeSlots: {
                            'Wash and Press': ['9:00 am', '11:00 pm', '02:00 pm', '04:00 am', '06:00 pm', '08:00 pm'],
                            'Wash and Fold': ['09:00 am', '12:00 pm', '02:00 pm', '05:00 pm', '08:00 pm'],
                            'Dry Cleaning': ['09:00 am', '02:00 pm', '06:00 pm'],
                            'Hand wash': ['09:00 am', '12:00 pm', '02:00 pm', '05:00 pm', '08:00 pm'],
                            'Large items: Carpet / Curtain': ['09:00 am', '03:00 pm']
                        },
                        allowedTimes: []
                    }),
                    methods: {
                        showModal(service) {
                            this.allowedTimes = this.timeSlots[service];
                            this.modalTest = true;
                        },
                        saveData() {
                            this.$refs.dialogTest.save(this.dateTest);
                        },
                        setTime(time) {
                            this.time = time;
                        }
                    }
                });
            </script>
            <script src="js/script.js"></script>
    </body>
</html>
