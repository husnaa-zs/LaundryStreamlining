/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.bean;

/**
 *
 * @author husna
 */
public class laundrybooking {
    private int bookingId;
    private String serviceName;
    private String timeSlot;
    private int machineId; // Assuming each machine has a unique ID
    private static int[] remainingSlots = {5, 5, 5, 5, 5}; // Assuming 5 machines

    
   
    public laundrybooking(int bookingId, String serviceName, String timeSlot, int machineId) {
        this.bookingId = bookingId;
        this.serviceName = serviceName;
        this.timeSlot = timeSlot;
        this.machineId = machineId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public int getMachineId() {
        return machineId;
    }

    public static int[] getRemainingSlots() {
        return remainingSlots;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public void setTimeSlot(String timeSlot) {
        this.timeSlot = timeSlot;
    }

    public void setMachineId(int machineId) {
        this.machineId = machineId;
    }

    public static void setRemainingSlots(int machineIndex, int slots) {
        if (machineIndex >= 0 && machineIndex < remainingSlots.length) {
            remainingSlots[machineIndex] = slots;
        }
    }

    public static boolean checkSlotAvailability(int machineIndex) {
        if (machineIndex >= 0 && machineIndex < remainingSlots.length) {
            return remainingSlots[machineIndex] > 0;
        }
        return false;
    }

    public static void bookSlot(int machineIndex) {
        if (checkSlotAvailability(machineIndex)) {
            remainingSlots[machineIndex]--;
            System.out.println("Slot booked successfully.");
        } else {
            System.out.println("No available slots for the selected machine.");
        }
    }

    public void displayBookingInfo() {
        System.out.println("Booking ID: " + bookingId);
        System.out.println("Service Name: " + serviceName);
        System.out.println("Time Slot: " + timeSlot);
        System.out.println("Remaining Slots:");
        for (int i = 0; i < remainingSlots.length; i++) {
            System.out.println("Machine " + (i + 1) + ": " + remainingSlots[i] + " slots");
        }
    }

    public static void main(String[] args) {
        // Example usage
        laundrybooking booking1 = new laundrybooking(1, "Washing Service", "10:00 AM - 11:00 AM",1);
        booking1.displayBookingInfo();
        
        bookSlot(0); // Booking a slot for machine 1
        bookSlot(2); // Booking a slot for machine 3

        laundrybooking  booking2 = new laundrybooking (2, "Drying Service", "11:00 AM - 12:00 PM",2);
        booking2.displayBookingInfo();
    }
}
