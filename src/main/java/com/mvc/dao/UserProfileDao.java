//package com.mvc.dao;
//
//import com.mvc.bean.RegisterBean; // Import your User bean class
//import com.mvc.util.DBConnection; // Import your database connection utility class
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//public class UserProfileDao {
//    
//    // Method to retrieve user details by username
//    public RegisterBean getUserByUsername(String username) {
//        Connection con = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        RegisterBean user = null;
//
//        try {
//            con = DBConnection.createConnection();
//            String query = "SELECT id, username, name, phone_number,password email FROM user WHERE username = ?";
//            ps = con.prepareStatement(query);
//            ps.setString(1, username);
//            rs = ps.executeQuery();
//
//            if (rs.next()) {
//                user = new RegisterBean();
//                user.setId(rs.getInt("id"));
//                user.setUsername(rs.getString("username"));
//                user.setName(rs.getString("name"));
//                user.setPhone_number(rs.getString("phone_number"));
//                user.setPassword(rs.getString("password"));
//                user.setEmail(rs.getString("email"));
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (rs != null) rs.close();
//                if (ps != null) ps.close();
//                if (con != null) con.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//
//        return user;
//    }
//
//    // Method to update user profile
//    public boolean updateUser(RegisterBean user) {
//        Connection con = null;
//        PreparedStatement ps = null;
//        boolean updated = false;
//        
//        try {
//            con = DBConnection.createConnection(); // Replace with your database connection method
//            String query = "UPDATE user SET username=?, name=?, phone_number=?,password=?, email=? WHERE id=?";
//            ps = con.prepareStatement(query);
//            ps.setString(1, user.getUsername());
//            ps.setString(2, user.getName());
//            ps.setString(3, user.getPhone_number());
//             ps.setString(4, user.getPassword());
//            ps.setString(5, user.getEmail());
//           
//            ps.setInt(6, user.getId());
//            
//            int rowsUpdated = ps.executeUpdate();
//            if (rowsUpdated > 0) {
//                updated = true;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace(); // Handle your exceptions properly
//        } finally {
//            try {
//                if (ps != null) ps.close();
//                if (con != null) con.close();
//            } catch (SQLException e) {
//                e.printStackTrace(); // Handle your exceptions properly
//            }
//        }
//        
//        return updated;
//    }
//}
