<%@ page import="com.mvc.bean.RegisterBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Profile</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2>View Profile</h2>
        <%
            RegisterBean user = (RegisterBean) request.getSession().getAttribute("user");
            if (user != null) {
            request.setAttribute("user",user);
    
        %>
            <div class="alert alert-danger" role="alert">
                Unable to retrieve user data. Please try again later.
            </div>
        <%
            } else {
        %>
        <table class="table">
            <tbody>
                <tr>
                    <th>ID</th>
                    <td><%= user.getId() %></td>
                </tr>
                <tr>
                    <th>Username</th>
                    <td><%= user.getUsername() %></td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><%= user.getName() %></td>
                </tr>
                <tr>
                    <th>Phone Number</th>
                    <td><%= user.getPhone_number() %></td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td><%= user.getPassword() %></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= user.getEmail() %></td>
                </tr>
            </tbody>
        </table>
        <a href="<%= request.getContextPath() %>/editRegister?id=<%= user.getId() %>" class="btn btn-primary">Edit Profile</a>
        <a href="<%= request.getContextPath() %>/deleteRegister?id=<%= user.getId() %>" class="btn btn-danger">Delete Account</a>
        <%
            }
        %>
    </div>
</body>
</html>
