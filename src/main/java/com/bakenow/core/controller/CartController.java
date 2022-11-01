/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bakenow.core.controller;

import static com.bakenow.core.model.Cart.*;
import static com.bakenow.core.model.Product.*;

import com.bakenow.core.model.Cart;
import com.bakenow.core.model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.annotation.Resource;
import jakarta.servlet.http.Cookie;
import java.util.Optional;
import javax.sql.DataSource;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

    @Resource(name = "jdbc/AzureSQLDB")
    private DataSource dataSource;

    private Cart getSessionCart(HttpServletRequest request, HttpServletResponse response) {
        Cart cart = (Cart) request.getSession().getAttribute("SESSION_CART");
        if (cart == null) {
            cart = aCart();
        }

        Cookie[] cookies = Optional.ofNullable(request.getCookies()).orElse(new Cookie[]{});
        boolean hadSession = false;
        for (Cookie cookie : cookies) {
            if ("SESSION_ID".equals(cookie.getName())) {
                hadSession = true;
                if (!cookie.getValue().equals(request.getSession().getId())) {
                    //TODO: Get the Cart w/ this session ID from database
                    //cart = dao.getCart();
                }
                break;
            }
        }
        if (!hadSession) {
            Cookie cookie = new Cookie("SESSION_ID", request.getSession().getId());
            cookie.setHttpOnly(true);
            cookie.setPath(request.getContextPath());
            response.addCookie(cookie);
        }

        return cart;
    }

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
        String dest = "/WEB-INF/cart.jsp";

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            Product product = aProduct();
            product.setId(productId);
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            Cart cart = this.getSessionCart(request, response);
            cart.add(product, quantity);

            request.getSession().setAttribute("SESSION_CART", cart);
        } catch (Exception ex) {
//            Logger.getLogger().log();
        } finally {
            request.getRequestDispatcher(dest).forward(request, response);
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
