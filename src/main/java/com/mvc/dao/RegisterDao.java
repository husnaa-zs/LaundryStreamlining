package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.mvc.bean.RegisterBean;
import com.mvc.util.DBConnection;

public class RegisterDao {

    public String registerUser(RegisterBean registerBean) {
        String username = registerBean.getUsername();
        String name = registerBean.getName();
        String phone_number = registerBean.getPhone_number();
        String password = registerBean.getPassword();
        String email = registerBean.getEmail();

        try (Connection con = DBConnection.createConnection();
            PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO user(username, name, phone_number, password, email) values (?, ?, ?, ?, ?)")) {

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3, phone_number);
            preparedStatement.setString(4, password);
            preparedStatement.setString(5, email);
            int i = preparedStatement.executeUpdate();

            if (i != 0) {  //Just to ensure data has been inserted into the database
                return "SUCCESS";

            } else {
                return username+"Oops.. Something went wrong there..!";  // On failure, send a message from here.
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
        }
    }
}
