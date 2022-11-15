/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bakenow.core.controller;

import com.bakenow.core.dao.OrderDAO;
import com.bakenow.core.dao.RecipeDAO;
import com.bakenow.core.dao.UserDAO;
import com.bakenow.core.model.Order;
import com.bakenow.core.dao.ProductCategoryDAO;
import com.bakenow.core.model.CategoryGroup;
import com.bakenow.core.model.Recipe;
import com.bakenow.core.model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RenderBlogHomeController", urlPatterns = {"/RenderBlogHomeController"})

public class RenderBlogHomeController extends HttpServlet {

    private static final String ERROR = "/WEB-INF/errorpages/error.jsp";
    private static final String SUCCESS = "/WEB-INF/recipes/home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            RecipeDAO dao = new RecipeDAO();
            ProductCategoryDAO cDao = new ProductCategoryDAO();
            List<Recipe> recipeList = dao.getRecipeList();
            OrderDAO odao = new OrderDAO();
            List<Order> orderList = odao.getOrderList();
            UserDAO udao = new UserDAO();
            List<User> userList = udao.getUserList();
            HttpSession session = request.getSession();
            session.setAttribute("RECIPE_LIST", recipeList);
            session.setAttribute("ORDER_LIST", orderList);
            session.setAttribute("USER_LIST", userList);
            List<CategoryGroup> cIList = cDao.getAllOfABigCategory(1);
            List<CategoryGroup> cTList = cDao.getAllOfABigCategory(2);
            session.setAttribute("GET_I_CATEGORY", cIList);
            session.setAttribute("GET_T_CATEGORY", cTList);
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at RenderBlogHomeController: " + e.toString());
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
