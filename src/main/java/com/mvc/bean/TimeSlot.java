/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.bean;

/**
 *
 * @author husna
 */
public class TimeSlot {
    private int t_id;
    private String time_slot;

    public TimeSlot(int t_id, String time_slot) {
        this.t_id = t_id;
        this.time_slot = time_slot;
    }

    public int getT_id() {
        return t_id;
    }

    public void setT_id(int t_id) {
        this.t_id = t_id;
    }

    public String getTime_slot() {
        return time_slot;
    }

    public void setTime_slot(String time_slot) {
        this.time_slot = time_slot;
    }
    
}
