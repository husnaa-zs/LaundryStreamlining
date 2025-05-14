/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.bean;

/**
 *
 * @author husna
 */
public class Delivery {

    private String deliveryName;
    private String deliveryService;
    private String deliveryKilo;
    private String deliveryTotalPrice;
    private String address;
    private String notes;
    private String deliveryFeeDisplay;
    private String subtotal;
    private String totalWithTax;

    
    public Delivery(String deliveryName, String deliveryService, String deliveryKilo, String deliveryTotalPrice, String address, String notes, String deliveryFeeDisplay, String subtotal, String totalWithTax) {
        this.deliveryName = deliveryName;
        this.deliveryService = deliveryService;
        this.deliveryKilo = deliveryKilo;
        this.deliveryTotalPrice = deliveryTotalPrice;
        this.address = address;
        this.notes = notes;
        this.deliveryFeeDisplay = deliveryFeeDisplay;
        this.subtotal = subtotal;
        this.totalWithTax = totalWithTax;
    }

    public Delivery() {
    }

    public String getDeliveryName() {
        return deliveryName;
    }

    public void setDeliveryName(String deliveryName) {
        this.deliveryName = deliveryName;
    }

    public String getDeliveryService() {
        return deliveryService;
    }

    public void setDeliveryService(String deliveryService) {
        this.deliveryService = deliveryService;
    }

    public String getDeliveryKilo() {
        return deliveryKilo;
    }

    public void setDeliveryKilo(String deliveryKilo) {
        this.deliveryKilo = deliveryKilo;
    }

    public String getDeliveryTotalPrice() {
        return deliveryTotalPrice;
    }

    public void setDeliveryTotalPrice(String deliveryTotalPrice) {
        this.deliveryTotalPrice = deliveryTotalPrice;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getDeliveryFeeDisplay() {
        return deliveryFeeDisplay;
    }

    public void setDeliveryFeeDisplay(String deliveryFeeDisplay) {
        this.deliveryFeeDisplay = deliveryFeeDisplay;
    }

    public String getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(String subtotal) {
        this.subtotal = subtotal;
    }

    public String getTotalWithTax() {
        return totalWithTax;
    }

    public void setTotalWithTax(String totalWithTax) {
        this.totalWithTax = totalWithTax;
    }

    
}
