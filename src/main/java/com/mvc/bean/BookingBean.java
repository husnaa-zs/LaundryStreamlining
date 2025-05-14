/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.bean;

import java.sql.Date;

/**
 *
 * @author husna
 */
public class BookingBean {
     private int id;
     private String name;
     private String email;
     private String phone;
     private String date;
     private String starttime;
     private String startminute;
     private String endtime;
     private String endminute;
     private String service;
     private String delivery;
     private String kilo;
     
    public BookingBean() {
    }

    public BookingBean(int id, String name, String email, String phone, String date, String starttime, String startminute, String endtime, String endminute, String service, String delivery,String kilo) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.date = date;
        this.starttime = starttime;
        this.startminute = startminute;
        this.endtime = endtime;
        this.endminute = endminute;
        this.service = service;
        this.delivery = delivery;
        this.kilo = kilo;
    }

    public BookingBean(String name, String email, String phone, String date, String starttime, String startminute, String endtime, String endminute, String service, String delivery,String kilo) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.date = date;
        this.starttime = starttime;
        this.startminute = startminute;
        this.endtime = endtime;
        this.endminute = endminute;
        this.service = service;
        this.delivery = delivery;
        this.kilo=kilo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getStartminute() {
        return startminute;
    }

    public void setStartminute(String startminute) {
        this.startminute = startminute;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getEndminute() {
        return endminute;
    }

    public void setEndminute(String endminute) {
        this.endminute = endminute;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public String getDelivery() {
        return delivery;
    }

    public void setDelivery(String delivery) {
        this.delivery = delivery;
    }

    public String getKilo() {
        return kilo;
    }

    public void setKilo(String kilo) {
        this.kilo = kilo;
    }
     
     
}
