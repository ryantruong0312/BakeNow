/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bakenow.core.controller;

import com.bakenow.core.dao.ProductCategoryDAO;
import com.bakenow.core.dao.ProductDAO;
import com.bakenow.core.model.ProductError;
import com.bakenow.core.model.Shop;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author Admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)

public class AddProductController extends HttpServlet {
    private static final String SUCCESS = "/WEB-INF/marketplace/product_add.jsp";
    private static final String ERROR = "/WEB-INF/marketplace/product_add.jsp";
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = null;
        String url = ERROR;
        //response.getWriter().print("The file uploaded sucessfully."); cau nay de respone lai thoi 
        try {
            boolean check = true;
            ProductError pError = new ProductError();
            String name = request.getParameter("title");
            //kiem tra ten cua product
            if (name == "" || name == null) {
                pError.setName("Name must be fullfil!");
                check = false;
            }
            //for handeling file
            Part part = request.getPart("img");
            
            String realPath = request.getServletContext().getRealPath("/assets/img"); 
            String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();
           
            if(!Files.exists(Path.of(realPath))){
                Files.createDirectories(Path.of(realPath));
            }
            part.write(realPath+"/"+fileName);
            
//            String fileName = FilenameUtils.getName(image.getSubmittedFileName());
//                    String fileNameSuffix = "." + FilenameUtils.getExtension(fileName);
//                    File file = File.createTempFile(fileNamePrefix, fileNameSuffix, uploadFolder);
//                    images.add("/" + uploadPath + file.getName());
//                    image.write(file.getAbsolutePath());
//                    
//            fileName.
//            
            String imgUrl = realPath +"/"+fileName;
            
            String productOri = request.getParameter("productOrigin");
            if (productOri == "" || productOri == null) {
                pError.setOrigin("Origin must be fullfil!");
                check = false;
            }
            String category = request.getParameter("productCategory");
            
            
            java.util.Date manuDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("manuDate"));
            java.util.Date expDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("expDate"));
            // Add the lines below
            
//            Date date = new Date();
//            long diff = expDateSQLDate.getTime()- date.getTime();
//            long days_difference = (diff / (1000*60*60*24)) % 365;   
//            if (diff < 30) {
//                error.add("ExpDate must be 30 days from today!");
//                check = false;
//            } 
         
            double price = Double.parseDouble(request.getParameter("productPrice"));
            if(price < 0.01 || price >1000000000){
                pError.setPrice("Price is from 0.01 to 100000000!");
                check = false;
            }
            int stock = Integer.parseInt(request.getParameter("stockQuantity"));
            if(stock < 1 || stock >10000){
                pError.setStock("Stock is from 1 to 100000!");
                check = false;
            }
            String description = request.getParameter("productDescription");
            if (check == true) {
                ProductDAO pDAO = new ProductDAO();
                ProductCategoryDAO  pcDao = new ProductCategoryDAO();
                int categoryId = pcDao.getCategoryIdByName(category);
                HttpSession session = request.getSession();
                Shop shop = (Shop)session.getAttribute("LOGIN_SHOP");
                Date createDate = new Date();
                pDAO.addNewProDuct(shop.getId(), categoryId, createDate, imgUrl, name, productOri, manuDate, expDate, description, price, stock);
                request.setAttribute("shopID",shop.getId());
                request.setAttribute("successMsg","ConGratulation you have create a product!");
                url=SUCCESS;
            }else{
                request.setAttribute("PRODUCT_ERROR", pError);
            }
           
        } catch (Exception e) {
            log("Error at LoadProductByCategoryController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
