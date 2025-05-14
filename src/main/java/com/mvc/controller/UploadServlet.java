package com.mvc.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig(maxFileSize = 16177215) // 16MB
public class UploadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/dobi";
    private String dbUser = "root";
    private String dbPass = "";

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, jakarta.servlet.ServletException {
        // Get the file part from the request
        Part filePart = request.getPart("receipt");

        if (filePart != null) {
            try (InputStream inputStream = filePart.getInputStream()) {
                // Insert data into the database
                insertData(inputStream);
                response.getWriter().println("File uploaded and saved into database");
            } catch (SQLException ex) {
                ex.printStackTrace();
                response.getWriter().println("Error: " + ex.getMessage());
            }
        } else {
            response.getWriter().println("No file uploaded");
        }
    }

    private void insertData(InputStream inputStream) throws SQLException {
        String sql = "INSERT INTO qrpayment (receipt) VALUES (?)";
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                PreparedStatement statement = conn.prepareStatement(sql)) {

            if (inputStream != null) {
                statement.setBlob(1, inputStream);
            }

            statement.executeUpdate();
        }
    }
}
