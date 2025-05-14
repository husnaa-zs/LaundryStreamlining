/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.bean;

/**
 *
 * @author husna
 */
public class Machine {
    private int m_id;
    private String machine_number;
    private int service_id;

    public Machine(int m_id, String machine_number, int service_id) {
        this.m_id = m_id;
        this.machine_number = machine_number;
        this.service_id = service_id;
    }

    public Machine() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int getM_id() {
        return m_id;
    }

    public void setM_id(int m_id) {
        this.m_id = m_id;
    }

    public String getMachine_number() {
        return machine_number;
    }

    public void setMachine_number(String machine_number) {
        this.machine_number = machine_number;
    }

    public int getService_id() {
        return service_id;
    }

    public void setService_id(int service_id) {
        this.service_id = service_id;
    }
    
}
