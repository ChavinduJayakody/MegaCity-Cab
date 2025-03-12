package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.DriverDAO;
import com.mycompany.megacitycab.model.Driver;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/driver-signup")
public class DriverSignupServlet extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "uploads"; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            System.err.println("DriverSignupServlet: Request received");

        if (!ServletFileUpload.isMultipartContent(request)) {
            response.sendRedirect("driverLogin.jsp?error=Form must be multipart/form-data");
            return;
        }

        // Configure upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            List<FileItem> items = upload.parseRequest(request);

            Driver driver = new Driver();
            String fileName = null;

            for (FileItem item : items) {
                if (item.isFormField()) {
                    
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();

                    switch (fieldName) {
                        case "fullName":
                            driver.setFullName(fieldValue);
                            break;
                        case "email":
                            driver.setEmail(fieldValue);
                            break;
                        case "phone":
                            driver.setPhone(fieldValue);
                            break;
                        case "licensePlate":
                            driver.setLicensePlate(fieldValue);
                            break;
                        case "vehicleModel":
                            driver.setVehicleModel(fieldValue);
                            break;
                        case "vehicleColor":
                            driver.setVehicleColor(fieldValue);
                            break;
                        case "password":
                            driver.setPassword(fieldValue);
                            break;
                    }
                } else {
                    // Handle file upload
                    if (!item.getName().isEmpty()) {
                        fileName = new File(item.getName()).getName();
                        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

                        // Create the upload directory if it doesn't exist
                        File uploadDir = new File(uploadPath);
                        if (!uploadDir.exists()) {
                            uploadDir.mkdir();
                        }

                        // Save the file to the upload directory
                        item.write(new File(uploadPath + File.separator + fileName));
                        driver.setVehicleImage(UPLOAD_DIRECTORY + "/" + fileName);
                    }
                }
            }

            // Save driver to database
            DriverDAO driverDAO = new DriverDAO();

            // Check if email already exists
            if (driverDAO.emailExists(driver.getEmail())) {
                response.sendRedirect("driverLogin.jsp?error=Email already registered. Please use a different email.");
                return;
            }

            // If email is unique, proceed with registration
            driverDAO.addDriver(driver);
            response.sendRedirect("driverLogin.jsp?success=Registration successful! Please login.");        
        }
        catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("driverLogin.jsp?error=Error during registration: " + e.getMessage());
        }
    }
}