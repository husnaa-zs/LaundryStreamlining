package com.mvc.controller;

import com.mvc.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tika.Tika;

@WebServlet("/downloadReceipt")
public class DownloadReceiptServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.createConnection();
            String query = "SELECT receipt FROM qrpayment WHERE id = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                InputStream inputStream = rs.getBinaryStream("receipt");

                // Use Apache Tika to detect file type
                Tika tika = new Tika();
                String fileType = tika.detect(inputStream);
                
                // Determine file extension from detected type
                String fileExtension = "bin";
                if (fileType.equals("image/png")) {
                    fileExtension = "png";
                } else if (fileType.equals("image/jpeg")) {
                    fileExtension = "jpg";
                }

                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=\"receipt_" + id + "." + fileExtension + "\"");

                // Reset the stream to the beginning
                inputStream = rs.getBinaryStream("receipt");

                OutputStream outputStream = response.getOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                
                inputStream.close();
                outputStream.close();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle your exceptions properly
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Handle your exceptions properly
            }
        }
    }
}
