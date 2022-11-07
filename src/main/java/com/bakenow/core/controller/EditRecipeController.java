/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bakenow.core.controller;

import com.bakenow.core.dao.RecipeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author tlminh
 */
public class EditRecipeController extends HttpServlet {

    private static final String ERROR = "WEB-INF/errorpages/error.jsp";
    private static final String SUCCESS = "ViewRecipeController?recipeId=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int recipeId = Integer.parseInt(request.getParameter("recipeId"));
            String title = request.getParameter("title");
            String desc = request.getParameter("desc");
            int cookTime = Integer.parseInt(request.getParameter("cookTime"));
            String imgUrl = request.getParameter("imgUrl");
            String[] stepContents = request.getParameterValues("stepContent");
            for (String stepContent : stepContents) {
                System.out.println(stepContent);
            }
            String[] ingredientNames = request.getParameterValues("ingredientName");
            String[] amounts = request.getParameterValues("amount");
            String[] tools = request.getParameterValues("toolName");
            RecipeDAO dao = new RecipeDAO();
            boolean checkUpdate = dao.updateRecipe(recipeId, title, desc, cookTime, imgUrl, stepContents, ingredientNames, amounts, tools);
            if (checkUpdate) {
                url = SUCCESS + recipeId;
            }
        } catch (Exception e) {
            log("Error at EditRecipeController: " + e.toString());
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
