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
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ViewProductByIdController extends HttpServlet {

   public  static String SUCCESS="/WEB-INF/marketplace/product-view.jsp";
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
    protected void processRequest(jakarta.servlet.http.HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
            try {
            String productId = request.getParameter("txtID");
            ProductDAO dao = new ProductDAO();
            Product product = dao.getProductsById(productId);//dang lam toi day
            ShopDAO sDao = new ShopDAO();
            Shop shop = sDao.getShopById( String.valueOf(product.getShopId()));
            ProductCategoryDAO pCDao = new ProductCategoryDAO();
            CategoryGroup pC = pCDao.getCategoryById(String.valueOf(product.getCategoryId()));
            if (product != null) {
                request.setAttribute("PRODUCT", product);
                request.setAttribute("SHOP", shop);
                request.setAttribute("CATEGORY", pC);
               url= SUCCESS;
            }
        } catch (Exception e) {
            log("Error at LoadProductByCategoryController: "+ e.toString());
        }
        finally{
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
