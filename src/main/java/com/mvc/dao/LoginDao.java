/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mvc.bean.Login;
import com.mvc.util.DBConnection;
import java.sql.PreparedStatement;

public class LoginDao {

    public String authenticateUser(Login login) {
        String username = login.getUsername(); // Assign user entered values to temporary variables.
        String password = login.getPassword();
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
        String usernameDB = "root";
        String passwordDB = "";

        try {
            con = DBConnection.createConnection(); // Fetch database connection object
            statement = con.createStatement(); // Statement is used to write queries. Read more about it.
            resultSet = statement.executeQuery("SELECT username, password FROM user"); // the table name is users and
                                                                                        // userName,password are columns.
                                                                                        // Fetching all the records and
                                                                                        // storing in a resultSet.

            while (resultSet.next()) // Until next row is present otherwise it returns false
            {
                usernameDB = resultSet.getString("username"); // fetch the values present in the database
                passwordDB = resultSet.getString("password");
                if (username.equals(usernameDB) && password.equals(passwordDB)) {
                    return "SUCCESS"; // If the user entered values are already present in the database, which means
                                      // the user has already registered, so return a SUCCESS message.
                }
            }

            return "Invalid user credentials"; // Return appropriate message in case of failure
        } catch (SQLException e) {
            e.printStackTrace();
            return "Error occurred during authentication"; // Return error message
        } finally {
            // Close the resources in the reverse order of their creation
            try {
                if (resultSet != null)
                    resultSet.close();
                if (statement != null)
                    statement.close();
                if (con != null)
                    con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
     public int getUserIdByUsername(String username) {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        int userId = -1;

        try {
            con = DBConnection.createConnection();
            String query = "SELECT id FROM user WHERE username = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, username);
            rs = pst.executeQuery();

            if (rs.next()) {
                userId = rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return userId;
    }
}

