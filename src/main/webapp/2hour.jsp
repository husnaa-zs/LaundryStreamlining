<%-- 
    Document   : 2hour
    Created on : 3 Jun 2024, 5:33:12 pm
    Author     : husna
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>2hour</title>
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
                    <v-dialog
                        ref="dialogTest"
                        v-model="modalTest"
                        :return-value.sync="dateTest"
                        persistent
                    >
                        <template v-slot:activator="{ on }">
                            <v-btn color="success" dark v-on="on">call date</v-btn>
                        </template>
                        <div class="text-center title">Select a Date & Time</div>
                        <v-row justify="center">
                            <v-date-picker v-model="dateTest" scrollable :allowed-dates="allowedDates">
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
        // Looking for the v1.5 template?
        // https://codepen.io/johnjleider/pen/GVoaNe

        new Vue({
            el: '#app',
            vuetify: new Vuetify(),
            data: () => ({
                modalTest: false,
                dateTest: null,
                time: null,
                allowedTimes:['9:00 am','11:00pm','02:00pm','04:00pm','06:00 pm','08:00pm']
            }),
            methods: { 
                saveData() {
                    this.$refs.dialogTest.save(this.dateTest);
                },
                //allowedDates: val => parseInt(val.split('-')[2], 10) % 2 === 0,
                setTime(time) {
                    this.time = time;
                }
            }
        });
    </script>
</body>
</html>