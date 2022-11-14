/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bakenow.core.controller;

import com.bakenow.core.model.Cart;
import com.bakenow.core.model.OrderItem;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author tlminh
 */
public class AddToCartController extends HttpServlet {

    private static final String ERROR = "WEB-INF/errorpages/error.jsp";
    private static final String SUCCESS = "MainController?action=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int shopId = Integer.parseInt(request.getParameter("shopId"));
            int orderQuantity = Integer.parseInt(request.getParameter("orderQuantity"));
            String productName = request.getParameter("productName");
            String shopName = request.getParameter("shopName");
            String productImgUrl = request.getParameter("productImg");
            double price = Double.parseDouble(request.getParameter("price"));
            HttpSession session = request.getSession();
            if (session != null) {
                Cart cart = (Cart) session.getAttribute("CART");
                OrderItem item = new OrderItem(0,0,productId,productName,orderQuantity,price,shopId,shopName,productImgUrl );
                if (cart == null) {
                    cart = new Cart();
                }
                boolean checkAdd = cart.addToCart(item);
                if (checkAdd) {
                    url = SUCCESS;
                    session.setAttribute("CART", cart);
                }
            }
        } catch (Exception e) {
            log("Error at AddToCartController: " + e.toString());
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
