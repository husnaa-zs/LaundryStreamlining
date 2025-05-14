/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.bean;

public class RegisterBean {

    private int id;
    private String username;
    private String name;
    private String phone_number;
    private String password;
    private String email;

    public RegisterBean(String username, String name, String phone_number, String password, String email) {
        this.username = username;
        this.name = name;
        this.phone_number = phone_number;
        this.password = password;
        this.email = email;

    }
    
    public RegisterBean(int id, String username, String name, String phone_number, String password, String email) {
        this.id = id;
        this.username = username;
        this.name = name;
        this.phone_number = phone_number;
        this.password = password;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

  
    public RegisterBean() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
