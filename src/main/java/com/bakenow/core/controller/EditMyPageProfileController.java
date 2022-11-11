/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bakenow.core.controller;

import com.bakenow.core.dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;

/**
 *
 * @author tlminh
 */
public class EditMyPageProfileController extends HttpServlet {

    private static final String ERROR = "WEB-INF/errorpages/error.jsp";
    private static final String SUCCESS = "MainController?action=NavToMyPage";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String displayName = request.getParameter("displayName");
            String bio = request.getParameter("bio");
            String phone = request.getParameter("phone");
            Date dob = Date.valueOf(request.getParameter("dob"));
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String avatarUrl = request.getParameter("avatarUrl");
            UserDAO dao = new UserDAO();
            boolean checkUpdate = dao.updateRecipe(userId,displayName,bio,phone,dob,email,address,avatarUrl);
            if (checkUpdate) {
                url = SUCCESS;
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", dao.getUserById(userId));
            }
        } catch (Exception e) {
            log("Error at EditMyPageProfileController: " + e.toString());
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
