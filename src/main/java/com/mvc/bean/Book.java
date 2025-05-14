/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.bean;

import java.sql.Date;

public class Book {

    private int id;
    private String kilo;
    private String services;
    private String machines;
    private Date date;
    private String time_slot_id;
    private String delivery;
    private String dateString; // For JSON conversion

    public Book() {
    }

    public Book(int id, String kilo, String services, String machines, Date date, String time_slot_id, String delivery) {
        this.id = id;
        this.kilo = kilo;
        this.services = services;
        this.machines = machines;
        this.date = date;
        this.time_slot_id = time_slot_id;
        this.delivery = delivery;
        
    }

    public Book(int id, String kilo, String services, String machines, String time_slot_id, String delivery) {
        this.id = id;
        this.kilo = kilo;
        this.services = services;
        this.machines = machines;
        this.time_slot_id = time_slot_id;
        this.delivery = delivery;
    }

    public Book(String kilo, String services, String machines, Date date, String time_slot_id, String delivery, String dateString) {
        this.kilo = kilo;
        this.services = services;
        this.machines = machines;
        this.date = date;
        this.time_slot_id = time_slot_id;
        this.delivery = delivery;
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Getters and setters for all fields including date and dateString
    public String getKilo() {
        return kilo;
    }

    public void setKilo(String kilo) {
        this.kilo = kilo;
    }

    public String getServices() {
        return services;
    }

    public void setServices(String services) {
        this.services = services;
    }

    public String getMachines() {
        return machines;
    }

    public void setMachines(String machines) {
        this.machines = machines;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTime_slot_id() {
        return time_slot_id;
    }

    public void setTime_slot_id(String time_slot_id) {
        this.time_slot_id = time_slot_id;
    }

    public String getDelivery() {
        return delivery;
    }

    public void setDelivery(String delivery) {
        this.delivery = delivery;
    }
    public String getTime() {
        return time_slot_id;  // Custom method to get time_slot_id as time
    }

    public String getDateString() {
        return dateString;
    }

    public void setDateString(String dateString) {
        this.dateString = dateString;
    }
}
