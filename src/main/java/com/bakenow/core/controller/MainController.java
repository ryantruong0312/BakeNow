/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bakenow.core.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String ERROR_404 = "/WEB-INF/errorpages/error404.jsp";

    //TODO?: read these from file?
    private static final String ACT_NAV_BLOG_HOME = "NavToBlogHome";
    private static final String DEST_NAV_BLOG_HOME = "RenderBlogHomeController";
    private static final String ACT_NAV_LOGIN = "NavToLogin";
    private static final String DEST_NAV_LOGIN = "/WEB-INF/login.jsp";
    private static final String ACT_LOGIN = "Login";
    private static final String DEST_LOGIN = "LoginController";
    private static final String ACT_NAV_REGISTER = "NavToRegister";
    private static final String DEST_NAV_REGISTER = "/WEB-INF/register.jsp";

    private static final String ACT_NAV_VIEW_PROFILE = "NavToViewProfile";
    private static final String DEST_NAV_VIEW_PROFILE = "/WEB-INF/profile/user-profile-view.jsp";
    private static final String ACT_NAV_VIEW_SHOP = "NavToViewShop";
    private static final String DEST_NAV_VIEW_SHOP = "/WEB-INF/profile/shop-profile-view.jsp";

    private static final String ACT_NAV_VIEW_RECIPE = "NavToViewRecipe";
    private static final String DEST_NAV_VIEW_RECIPE = "/WEB-INF/recipes/recipe-view.jsp";
    private static final String ACT_NAV_CREATE_RECIPE = "NavToCreateRecipe";
    private static final String DEST_NAV_RATE_RECIPE = "/WEB-INF/popup/recipe-rate.jsp";
    private static final String ACT_NAV_RATE_RECIPE = "NavToRateRecipe";
    private static final String DEST_NAV_CREATE_RECIPE = "/WEB-INF/recipes/recipe-create.jsp";
    private static final String ACT_NAV_EDIT_RECIPE = "NavToEditRecipe";
    private static final String DEST_NAV_EDIT_RECIPE = "/WEB-INF/recipes/recipe-edit.jsp";
    
    private static final String ACT_NAV_MARKETPLACE = "NavToMarketplace";
    private static final String DEST_NAV_MARKETPLACE = "/WEB-INF/marketplace/marketplace.jsp";
    private static final String ACT_NAV_VIEW_PRODUCT = "NavToViewProduct";
    private static final String DEST_NAV_VIEW_PRODUCT = "/WEB-INF/marketplace/product-view.jsp";
    private static final String ACT_NAV_ADD_PRODUCT = "NavToAddProduct";
    private static final String DEST_NAV_ADD_PRODUCT = "/WEB-INF/marketplace/product-add.jsp";
    private static final String ACT_NAV_EDIT_PRODUCT = "NavToEditProduct";
    private static final String DEST_NAV_EDIT_PRODUCT = "/WEB-INF/marketplace/product-edit.jsp";
    private static final String ACT_ADD_TO_CART = "AddToCart";
    private static final String DEST_ADD_TO_CART = "AddToCartController";
    private static final String ACT_NAV_CART = "NavToCart";
    private static final String DEST_NAV_CART = "/WEB-INF/marketplace/cart-view.jsp";

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
        String dest = ERROR_404;

        try {
            String action = request.getParameter("action");

            dest = switch (action) {
                case ACT_NAV_BLOG_HOME ->
                    DEST_NAV_BLOG_HOME;
                case ACT_NAV_LOGIN ->
                    DEST_NAV_LOGIN;
                case ACT_LOGIN ->
                    DEST_LOGIN;
                case ACT_NAV_REGISTER ->
                    DEST_NAV_REGISTER;

                case ACT_NAV_VIEW_PROFILE ->
                    DEST_NAV_VIEW_PROFILE;
                case ACT_NAV_VIEW_SHOP ->
                    DEST_NAV_VIEW_SHOP;

                case ACT_NAV_VIEW_RECIPE ->
                    DEST_NAV_VIEW_RECIPE;
                case ACT_NAV_RATE_RECIPE ->
                    DEST_NAV_RATE_RECIPE;
                case ACT_NAV_CREATE_RECIPE ->
                    DEST_NAV_CREATE_RECIPE;
                case ACT_NAV_EDIT_RECIPE ->
                    DEST_NAV_EDIT_RECIPE;

                case ACT_NAV_MARKETPLACE ->
                    DEST_NAV_MARKETPLACE;
                case ACT_NAV_VIEW_PRODUCT ->
                    DEST_NAV_VIEW_PRODUCT;
                case ACT_NAV_ADD_PRODUCT ->
                    DEST_NAV_ADD_PRODUCT;
                case ACT_NAV_EDIT_PRODUCT ->
                    DEST_NAV_EDIT_PRODUCT;
                case ACT_ADD_TO_CART ->
                    DEST_ADD_TO_CART;
                case ACT_NAV_CART ->
                    DEST_NAV_CART;
                default ->
                    ERROR_404;
            };
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
