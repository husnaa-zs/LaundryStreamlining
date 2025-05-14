<%-- 
    Document   : dummy
    Created on : 5 Jan 2024, 11:33:06 pm
    Author     : husna
--%>

<%-- 
    Document   : processLogin
    Created on : 24 May 2023, 4:25:41 pm
    Author     : NAJIHAH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        String username = request.getParameter("c_name");
        String password = request.getParameter("c_pass");
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
          Class.forName("com.mysql.jdbc.Driver");
          String myURL = "jdbc:mysql://localhost:3306/frozensupply";
          connection = DriverManager.getConnection(myURL, "root", "");
          String sql = "SELECT * FROM cust WHERE c_name = ? AND c_pass = ? ";
          statement = connection.prepareStatement(sql);
          statement.setString(1, username);
          statement.setString(2, password);
          resultSet = statement.executeQuery();
            if (resultSet.next()) {
               // Valid username and password
              String name = resultSet.getString("c_name");
             
              // Set session attributes
              session.setAttribute("c_name", username);
              
              response.sendRedirect("orderItem.jsp");
                
            } else {
               // Invalid username or password
               response.sendRedirect("login.jsp?error=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) {
            resultSet.close();
            }
           if (statement != null) {
            statement.close();
           }
          if (connection != null) {
            connection.close();
          }
    }
   %>
    </body>
</html>