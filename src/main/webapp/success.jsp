<%-- 
    Document   : success
    Created on : 2 Jan 2024, 4:12:30 pm
    Author     : husna
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <%
            HttpSession sessobj = request.getSession(false);
            String user = (String) sessobj.getAttribute("username");
            //Bean beansessobj = new Bean();
           // beansessobj.setUname(user);
           /// beansessobj.getUname();
            out.print("Welcome ");
            out.print(user);
            out.print(" ");


        %>
        <br><br>
        <a href="index.jsp">Log Out</a>
        <br><br>
    </body>
</html>
