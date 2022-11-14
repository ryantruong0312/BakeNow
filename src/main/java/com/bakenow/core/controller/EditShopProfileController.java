/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bakenow.core.controller;

import com.bakenow.core.dao.ShopDAO;
import com.bakenow.core.model.ProductError;
import com.bakenow.core.model.Shop;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class EditShopProfileController extends HttpServlet {

    private static final String ERROR = "RenderBlogHomeController";
//    private static final String SUCCESS = "";

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
        String url = ERROR;
        try {
            ShopDAO sDao = new ShopDAO();
            HttpSession session = request.getSession();
            Shop shop = (Shop) session.getAttribute("LOGIN_SHOP");
            ProductError pError = new ProductError();

            String name = request.getParameter("name");
            //kiem tra ten cua product
            if ("".equals(name) || name == null) {
                pError.setName("Name must be fullfil!");
            } else {
                sDao.editShopName(shop.getId(), name);
            }

            //for handeling file
            Part part = request.getPart("img");
            String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();
            if (fileName == null || fileName.equals("")) {
                pError.setImg("image must be fullfil!");
            } else {
                String realPath = request.getServletContext().getRealPath("/assets/img");
                if (!Files.exists(Path.of(realPath))) {
                    Files.createDirectories(Path.of(realPath));
                }
                part.write(realPath + "/" + fileName);
                String imgUrl = realPath + "/" + fileName;
                sDao.editShopAva(shop.getId(), imgUrl);
            }

            String email = request.getParameter("email");
            if ("".equals(email) || email == null) {
                pError.setCategory("Email must be fullfil!");
            } else {
                sDao.editShopEmail(shop.getId(), email);
            }

            String phone = request.getParameter("phone");
            if ("".equals(phone) || phone == null) {
                pError.setPrice("Phone must be fullfil!");
            } else {
                sDao.editShopPhone(shop.getId(), phone);
            }

            String about = request.getParameter("about");
            if ("".equals(about) || about == null) {
                pError.setOrigin("About must be fullfil!");
            } else {
                sDao.editShopDis(shop.getId(), about);
            }
            request.setAttribute("PRODUCT_ERROR", pError);
//            url = SUCCESS;
        } catch (ServletException | IOException | SQLException e) {
            log("Error at EditShopProfileController: " + e.toString());
//            url = ERROR;
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
            throws ServletException, IOException  {
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
