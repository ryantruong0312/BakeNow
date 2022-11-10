/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bakenow.core.controller;

import com.bakenow.core.dao.ProductDAO;
import com.bakenow.core.dao.ShopDAO;
import com.bakenow.core.dao.UserDAO;
import com.bakenow.core.model.Product;
import com.bakenow.core.model.Shop;
import com.bakenow.core.model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ViewShopProfileController extends HttpServlet {

    public static final String ERROR = "/WEB-INF/errorpages/error.jsp";
    public static final String SUCCESS = "/WEB-INF/profile/shop-profile-view.jsp";

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
        String url = ERROR;
        try {
            //neu sai logic o day thi sao
            String shopId = request.getParameter("shopID");
            ProductDAO pDao = new ProductDAO();
            ShopDAO sDao = new ShopDAO();
            UserDAO dao = new UserDAO();
            // neu user trong session co role id = 3 thi goi qua shop trong sesion
            //khong thi goi qua shop trong request 
            //co may duong vao view shop theo minh thay
            //1. la qua product post
            //2. qua cai nav tren account
            //3. 1 nguoui chu da login van coi duoc shop ng khac qua request dung ko?
            //        - vay thi xac bang viec request co thi chay trong request neu quequest = null thi chay trong session   
            //xem shop qua request
            if (shopId != null) {
                Shop randomViewShop = sDao.getShopById(shopId);
                List<Product> pList = pDao.getAllProductByShopId(shopId);
                if (randomViewShop != null) {
                    request.setAttribute("SHOP_PROFILE", randomViewShop);
                }
                if (!pList.isEmpty()) {
                    request.setAttribute("SHOP_PRODUCTS_LIST", pList);
                }
                url = SUCCESS;
            } else {//xem shop qua session dong nghia da login //dong nghia neu la da chac chan co shop roi vi muon xem phai di qua cai kia
                HttpSession session = request.getSession(false);
                if (session != null) {
                    //a session exists
                    //check user ne xem coi co phai la 1 chu shop ko
                    User tmpUser = (User) session.getAttribute("LOGIN_USER");//lay user trong session
                    if (tmpUser != null) { //neu co user
                        if (tmpUser.getRoleId() == 3) {//xem coi user co phai shopowner ko
                            Shop haveOwnerShop = (Shop) session.getAttribute("LOGIN_SHOP");//lay shop de in ra
                            if (haveOwnerShop != null) {
                                request.setAttribute("SHOP_PROFILE", haveOwnerShop);
                            }
                            List<Product> pList = pDao.getAllProductByShopId(Integer.toString(haveOwnerShop.getId()));
                            List<Product> pPList = pDao.getAllProductByShopId(Integer.toString(haveOwnerShop.getId()),0);
                            List<Product> pRList = pDao.getAllProductByShopId(Integer.toString(haveOwnerShop.getId()),2);
                            if (!pList.isEmpty()) {
                                request.setAttribute("SHOP_PRODUCTS_LIST", pList);
                                request.setAttribute("SHOP_PENDING_PRODUCTS_LIST", pPList);
                                request.setAttribute("SHOP_RESTRICTED_PRODUCTS_LIST", pRList); 
                            }
                        }
                    }
                    url = SUCCESS;
                }
               
            }
        } catch (Exception e) {
            log("Error at ViewRecipeController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        } 
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
