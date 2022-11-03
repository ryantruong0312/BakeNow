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

    private static final String ERROR = "/WEB-INF/errorpages/error.jsp";

    private static final String ACT_NAV_BLOG_HOME = "NavToBlogHome";
    private static final String DEST_NAV_BLOG_HOME = "RenderBlogHomeController";
    private static final String ACT_NAV_LOGIN = "NavToLogin";
    private static final String DEST_NAV_LOGIN = "/WEB-INF/authentication/login.jsp";
    private static final String ACT_LOGIN = "Login";
    private static final String DEST_LOGIN = "LoginController";
    private static final String ACT_NAV_REGISTER = "NavToRegister";
    private static final String DEST_NAV_REGISTER = "/WEB-INF/authentication/register.jsp";
    private static final String ACT_REGISTER = "Register";
    private static final String DEST_REGISTER = "RegisterController";
    private static final String ACT_LOGOUT = "Logout";
    private static final String DEST_LOGOUT = "LogoutController";

    private static final String ACT_NAV_VIEW_PROFILE = "NavToProfile";
    private static final String DEST_NAV_VIEW_PROFILE = "/WEB-INF/profile/user-profile-view.jsp";
    private static final String ACT_NAV_VIEW_SHOP = "NavToShop";
    private static final String DEST_NAV_VIEW_SHOP = "/WEB-INF/profile/shop-profile-view.jsp";

    private static final String ACT_VIEW_RECIPE = "ViewRecipe";
    private static final String DEST_VIEW_RECIPE = "ViewRecipeController";
    private static final String ACT_NAV_CREATE_RECIPE = "NavToCreateRecipe";
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            switch (action) {
                case ACT_NAV_BLOG_HOME:
                    url = DEST_NAV_BLOG_HOME;
                    break;
                case ACT_NAV_LOGIN:
                    url = DEST_NAV_LOGIN;
                    break;
                case ACT_LOGIN:
                    url = DEST_LOGIN;
                    break;
                case ACT_NAV_REGISTER:
                    url = DEST_NAV_REGISTER;
                    break;
                case ACT_REGISTER:
                    url = DEST_REGISTER;
                    break;
                case ACT_LOGOUT:
                    url = DEST_LOGOUT;
                    break;
                case ACT_NAV_VIEW_PROFILE:
                    url = DEST_NAV_VIEW_PROFILE;
                    break;
                case ACT_NAV_VIEW_SHOP:
                    url = DEST_NAV_VIEW_SHOP;
                    break;
                case ACT_VIEW_RECIPE:
                    url = DEST_VIEW_RECIPE;
                    break;
                case ACT_NAV_CREATE_RECIPE:
                    url = DEST_NAV_CREATE_RECIPE;
                    break;
                case ACT_NAV_EDIT_RECIPE:
                    url = DEST_NAV_EDIT_RECIPE;
                    break;
                case ACT_NAV_MARKETPLACE:
                    url = DEST_NAV_MARKETPLACE;
                    break;
                case ACT_NAV_VIEW_PRODUCT:
                    url = DEST_NAV_VIEW_PRODUCT;
                    break;
                case ACT_NAV_ADD_PRODUCT:
                    url = DEST_NAV_ADD_PRODUCT;
                    break;
                case ACT_NAV_EDIT_PRODUCT:
                    url = DEST_NAV_EDIT_PRODUCT;
                    break;
                case ACT_ADD_TO_CART:
                    url = DEST_ADD_TO_CART;
                    break;
                case ACT_NAV_CART:
                    url = DEST_NAV_CART;
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
//            Logger.getLogger().log();
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