<%-- 
    Document   : booktest
    Created on : 10 Jun 2024, 2:27:04 am
    Author     : husna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Laundry Booking</title>
</head>
<body>
    <h2>Laundry Booking Form</h2>
    <form action="laundry" method="post">
        <label for="serviceName">Service Name:</label>
        <input type="text" id="serviceName" name="serviceName" required><br><br>
        <label for="timeSlot">Time Slot:</label>
        <input type="text" id="timeSlot" name="timeSlot" required><br><br>
        <label for="machineId">Machine ID:</label>
        <input type="number" id="machineId" name="machineId" required><br><br>
        <input type="submit" value="Book">
    </form>
</body>
</html>