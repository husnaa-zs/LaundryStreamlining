<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Monthly Sales Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        canvas {
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
        }
    </style>
</head>
<body>
    <h2>Monthly Sales Chart</h2>
    <canvas id="myChart" width="400" height="200"></canvas>
    <table border="1">
        <thead>
            <tr>
                <th>Month</th>
                <th>Total Sales</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                // Arrays to hold month names and sales totals
                String[] months = new String[]{"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
                double[] salesData = new double[12];

                try {
                    // Create a connection to the database (replace with your database details)
                    String url = "jdbc:mysql://localhost:3306/dobi";
                    String username = "root";
                    String password = ""; // Add your actual password here
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection(url, username, password);

                    // Execute SQL query
                    String query = "SELECT YEAR(created_at) AS year, MONTH(created_at) AS month, " +
                                   "SUM(totalWithTax) AS totalWithTax " +
                                   "FROM (" +
                                   "    SELECT created_at, totalWithTax FROM pickup " +
                                   "    UNION ALL " +
                                   "    SELECT created_at, totalWithTax FROM delivery " +
                                   ") AS combined " +
                                   "GROUP BY YEAR(created_at), MONTH(created_at) " +
                                   "ORDER BY year, month";
                    ps = con.prepareStatement(query);
                    rs = ps.executeQuery();

                    // Initialize salesData array to zero
                    for (int i = 0; i < 12; i++) {
                        salesData[i] = 0;
                    }

                    // Populate salesData with query results
                    while (rs.next()) {
                        int month = rs.getInt("month") - 1; // Convert to zero-indexed
                        double totalWithTax = rs.getDouble("totalWithTax");
                        salesData[month] = totalWithTax;
                    }

                } finally {
                    // Close resources
                    if (rs != null) {
                        try { rs.close(); } catch (SQLException e) { /* Ignored */ }
                    }
                    if (ps != null) {
                        try { ps.close(); } catch (SQLException e) { /* Ignored */ }
                    }
                    if (con != null) {
                        try { con.close(); } catch (SQLException e) { /* Ignored */ }
                    }
                }

                // Constructing JavaScript array for chart data
                StringBuilder data = new StringBuilder("[");
                for (int i = 0; i < 12; i++) {
                    data.append(salesData[i]).append(",");
                }
                data.setLength(data.length() - 1); // Remove trailing comma
                data.append("]");
            %>
            <tr>
                <td>January</td><td><%= salesData[0] %></td>
            </tr>
            <tr>
                <td>February</td><td><%= salesData[1] %></td>
            </tr>
            <tr>
                <td>March</td><td><%= salesData[2] %></td>
            </tr>
            <tr>
                <td>April</td><td><%= salesData[3] %></td>
            </tr>
            <tr>
                <td>May</td><td><%= salesData[4] %></td>
            </tr>
            <tr>
                <td>June</td><td><%= salesData[5] %></td>
            </tr>
            <tr>
                <td>July</td><td><%= salesData[6] %></td>
            </tr>
            <tr>
                <td>August</td><td><%= salesData[7] %></td>
            </tr>
            <tr>
                <td>September</td><td><%= salesData[8] %></td>
            </tr>
            <tr>
                <td>October</td><td><%= salesData[9] %></td>
            </tr>
            <tr>
                <td>November</td><td><%= salesData[10] %></td>
            </tr>
            <tr>
                <td>December</td><td><%= salesData[11] %></td>
            </tr>
        </tbody>
    </table>
    <script>
        const ctx = document.getElementById('myChart').getContext('2d');
        const chartData = {
            labels: [<%= "\"" + months[0] + "\"" %>, <%= "\"" + months[1] + "\"" %>, <%= "\"" + months[2] + "\"" %>, 
                    <%= "\"" + months[3] + "\"" %>, <%= "\"" + months[4] + "\"" %>, <%= "\"" + months[5] + "\"" %>,
                    <%= "\"" + months[6] + "\"" %>, <%= "\"" + months[7] + "\"" %>, <%= "\"" + months[8] + "\"" %>,
                    <%= "\"" + months[9] + "\"" %>, <%= "\"" + months[10] + "\"" %>, <%= "\"" + months[11] + "\"" %>],
            datasets: [{
                label: 'Total Sales',
                data: <%= data.toString() %>,
                fill: false,
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 2,
                tension: 0.1 // Adjust tension to make the line less curvy (optional)
            }]
        };
        const myChart = new Chart(ctx, {
            type: 'line', // Set chart type to line
            data: chartData,
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>
