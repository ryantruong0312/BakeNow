/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bakenow.core.controller;

import com.bakenow.core.dao.ProductCategoryDAO;
import com.bakenow.core.dao.ProductDAO;
import com.bakenow.core.dao.ShopDAO;
import com.bakenow.core.model.CategoryGroup;
import com.bakenow.core.model.Product;
import com.bakenow.core.model.Shop;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/**
 *
 * @author Admin
 */
public class RenderProductMarketPlaceController extends HttpServlet {
    public  static String SUCCESS="/WEB-INF/marketplace/marketplace.jsp";
    public  static String ERROR="/WEB-INF/errorpages/error.jsp";
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
            ProductDAO pDao = new ProductDAO();
            ProductCategoryDAO cDao = new ProductCategoryDAO();
            ShopDAO sDa0 = new ShopDAO();
            List<Product> pList = pDao.getAllProduct();
            List<CategoryGroup> cIList = cDao.getAllOfABigCategory(1);
            List<CategoryGroup> cTList = cDao.getAllOfABigCategory(2);
            List<Shop> sList = sDa0.getAllShop();
            HttpSession session = request.getSession();
            session.setAttribute("LIST_PRODUCT", pList);
            session.setAttribute("GET_I_CATEGORY", cIList);
            session.setAttribute("GET_T_CATEGORY", cTList);
            session.setAttribute("LIST_SHOP", sList);   
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
