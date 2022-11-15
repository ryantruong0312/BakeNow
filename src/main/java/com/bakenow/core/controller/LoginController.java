/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bakenow.core.controller;

import com.bakenow.core.dao.ShopDAO;
import com.bakenow.core.dao.UserDAO;
import com.bakenow.core.model.Shop;
import com.bakenow.core.model.User;
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
public class LoginController extends HttpServlet {

    private static final String ERROR = "/WEB-INF/authentication/login.jsp";
    private static final String SUCCESS = "RenderBlogHomeController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAO();
            User loginUser = dao.checkLogin(username, password);
            ShopDAO sDao = new ShopDAO();
            //sau khi login chẹck coi co phai la nguoi ban do khong neu co 
            //de vao trong sesion scope cai shop  id luon
            //check user bằng cách nào đây ???
            if (loginUser != null) {
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", loginUser);
                if(loginUser.getRoleId() == 3){
                    Shop shop = sDao.getShopByOwnerId(loginUser.getId());
                    session.setAttribute("LOGIN_SHOP", shop);
                }
                url = SUCCESS;
            } else {
                request.setAttribute("ERROR", "Incorrect userID or password !!!");
            }
        } catch (Exception e) {
            log("Error at SignInController: " + e.toString());
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
