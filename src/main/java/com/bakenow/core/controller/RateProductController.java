/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bakenow.core.controller;

import com.bakenow.core.dao.CommentDAO;
import com.bakenow.core.dao.ProductCategoryDAO;
import com.bakenow.core.dao.ProductDAO;
import com.bakenow.core.dao.ShopDAO;
import com.bakenow.core.dao.UserDAO;
import com.bakenow.core.model.CategoryGroup;
import com.bakenow.core.model.Comment;
import com.bakenow.core.model.Product;
import com.bakenow.core.model.Shop;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
public class RateProductController extends HttpServlet {
    private static final String SUCCESS = "ViewProductByIdController?txtID=";
    private static final String ERROR = "MainController?action=NavToLogin";
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
            String productId = request.getParameter("txtID");
            String rating = request.getParameter("rate1");
            String userId = request.getParameter("userId");
            if( userId == null || userId.equals("") ){
                    url = ERROR;
            }else{
                ProductDAO dao = new ProductDAO();
                dao.setProductRate(productId,Double.parseDouble(rating.trim()));
                url = SUCCESS+productId;
            }
            
        } catch (Exception e) {
            log("Error at LoadProductByCategoryController: "+ e.toString());
        }
        finally{
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
