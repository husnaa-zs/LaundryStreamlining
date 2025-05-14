<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>3hour</title>
    <!-- Vuetify CSS -->
    <link href="https://cdn.jsdelivr.net/npm/vuetify@2.5.10/dist/vuetify.min.css" rel="stylesheet">
    <!-- Vue.js -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <!-- Vuetify JS -->
    <script src="https://cdn.jsdelivr.net/npm/vuetify@2.5.10/dist/vuetify.js"></script>
</head>
<body>
    <div id="app">
        <v-app>
            <v-content>
                <v-container>
                    <div class="form-group">
                        <legend class="col-form-label pt-0"><strong>Choose</strong></legend>
                        <div class="form-check form-check-inline" v-for="(service, index) in services" :key="index">
                            <input type="radio" class="form-check-input" :id="'service' + index" name="service" :value="service" @click="showModal(service)" required />
                            <label class="form-check-label" :for="'service' + index">{{ service }}</label>
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
                    'Wash and Press': ['9:00 am', '11:00 pm', '02:00 pm','04:00 am', '06:00 pm', '08:00 pm'],
                    'Wash and Fold': ['09:00 am', '12:00 pm', '02:00 pm', '05:00 pm', '08:00 pm'],
                    'Dry Cleaning': ['09:00 am', '02:00 pm', '06:00 pm'],
                    'Hand wash':  ['09:00 am', '12:00 pm', '02:00 pm', '05:00 pm', '08:00 pm'],
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
</body>
</html>
