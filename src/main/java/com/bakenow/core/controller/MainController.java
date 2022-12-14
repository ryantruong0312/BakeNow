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
    // để gọi đến 1 cái nào đó thì action là cái ở trên nè
    // dòng ngay dưới action sẽ tạo request nha. ví dụ nếu để là rederbloghome thì có nghĩa là 
    // gọi đến servlet renderblock home để xử lý đó
    // còn nếu để /..../..../ gì đó thì nav thẳng đến trang mà hình như là ko nên như vậy
    // vì chưa được servlet xử lý qua
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

    private static final String ACT_VIEW_MY_PAGE = "NavToMyPage";
    private static final String DEST_VIEW_MY_PAGE = "/WEB-INF/profile/my-page.jsp";
    private static final String ACT_NAV_VIEW_USER = "NavToViewUser";
    private static final String DEST_NAV_VIEW_USER = "RenderUserPageController";
    private static final String ACT_EDIT_MY_PAGE_PROFILE = "Save information";
    private static final String DEST_EDIT_MY_PAGE_PROFILE = "EditMyPageProfileController";
    private static final String ACT_NAV_VIEW_SHOP = "NavToShop";
    private static final String DEST_NAV_VIEW_SHOP = "/WEB-INF/profile/shop-profile-view.jsp";
    private static final String ACT_NAV_MANAGEMENT = "NavToManagement";
    private static final String DEST_NAV_MANAGEMENT = "/WEB-INF/admin/management.jsp";

    private static final String ACT_SEARCH_RECIPE = "Find";
    private static final String DEST_SEARCH_RECIPE = "/WEB-INF/recipes/home.jsp";
    private static final String ACT_VIEW_RECIPE = "ViewRecipe";
    private static final String DEST_VIEW_RECIPE = "ViewRecipeController";
    private static final String ACT_COMMENT_RECIPE = "Comment";
    private static final String DEST_COMMENT_RECIPE = "CommentRecipeController";
    private static final String ACT_COMMENT_PRODUCT = "Post";
    private static final String DEST_COMMENT_PRODUCT = "CommentProductController";
    private static final String ACT_NAV_CREATE_RECIPE = "NavToCreateRecipe";
    private static final String DEST_NAV_CREATE_RECIPE = "RenderCreateRecipeController";
    private static final String ACT_NAV_EDIT_RECIPE = "NavToEditRecipe";
    private static final String DEST_NAV_EDIT_RECIPE = "RenderEditRecipeController";
    private static final String ACT_EDIT_RECIPE = "Save";
    private static final String DEST_EDIT_RECIPE = "EditRecipeController";
    private static final String ACT_CREATE_RECIPE = "Create";
    private static final String DEST_CREATE_RECIPE = "CreateRecipeController";
    private static final String ACT_DELETE_RECIPE = "DeleteRecipe";
    private static final String DEST_DELETE_RECIPE = "DeleteRecipeController";
    private static final String ACT_DELETE_RECIPE_COMMENT = "DeleteRecipeComment";
    private static final String DEST_DELETE_RECIPE_COMMENT = "DeleteRecipeCommentController";
    private static final String ACT_APPROVE_RECIPE = "ApproveRecipe";
    private static final String DEST_APPROVE_RECIPE = "ApproveRecipeController";
    private static final String ACT_REJECT_RECIPE = "Submit";
    private static final String DEST_REJECT_RECIPE = "RejectRecipeController";

    private static final String ACT_NAV_MARKETPLACE = "NavToMarketplace";
    // đáng lẽ ở đây phải là gọi đến servlet của market place để load dữ liệu chứ nhỉ
    private static final String DEST_NAV_MARKETPLACE = "RenderProductMarketPlaceController"; //vì tránh thay đổi trong web.xml sr vì tên ko được chuẩn
    private static final String ACT_NAV_VIEW_PRODUCT_BY_CATE = "NavToViewProductByCategory";
    private static final String DEST_NAV_VIEW_PRODUCT_BY_CATE = "LoadProductByCategoryController";
    private static final String ACT_NAV_VIEW_PRODUCT = "NavToViewProduct";
    private static final String DEST_NAV_VIEW_PRODUCT = "ViewProductByIdController";
    private static final String ACT_TO_ADD_PRODUCT = "NavToAddProduct";
    private static final String DEST_TO_ADD_PRODUCT = "/WEB-INF/marketplace/product_add.jsp";
    private static final String ACT_NAV_EDIT_PRODUCT = "NavToEditProduct";
    private static final String DEST_NAV_EDIT_PRODUCT = "LoadAProductBeforeEditController";
    private static final String ACT_ADD_TO_CART = "Add to cart";
    private static final String DEST_ADD_TO_CART = "AddToCartController";
    private static final String ACT_NAV_CART = "NavToCart";
    private static final String DEST_NAV_CART = "/WEB-INF/marketplace/cart-view.jsp";
    private static final String ACT_NAV_SHOP_PROFILE = "toViewShopProfile";
    private static final String DEST_NAV_SHOP_PROFILE = "/WEB-INF/profile/shop-profile-view.jsp";
    private static final String ACT_CANCEL_ORDER = "CancelOrder";
    private static final String DEST_CANCEL_ORDER = "CancelOrderController";
    private static final String ACT_NAV_SHOPPROFILE = "NavToViewShopProfile";
    private static final String DEST_NAV_SHOPPROFILE = "ViewShopProfileController";
    private static final String ACT_SEARCH_PRODUCT_BY_NAME = "Search";
    private static final String DEST_SEARCH_PRODUCT_BY_NAME = "SearchProductByNameController";
    private static final String ACT_DELETE_PRODUCT_BY_ID = "ToDeleteProduct";
    private static final String DEST_DELETE_PRODUCT_BY_ID = "DeleteProductByIdController";
    private static final String ACT_EDIT_SHOP_PROFILE = "ToEditShopProfile";
    private static final String NAV_EDIT_SHOP_PROFILE = "EditShopProfileController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            System.out.println(request.getQueryString());
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
                case ACT_VIEW_MY_PAGE:
                    url = DEST_VIEW_MY_PAGE;
                    break;
                case ACT_EDIT_MY_PAGE_PROFILE:
                    url = DEST_EDIT_MY_PAGE_PROFILE;
                    break;
                case ACT_NAV_VIEW_USER:
                    url = DEST_NAV_VIEW_USER;
                    break;
                case ACT_NAV_VIEW_SHOP:
                    url = DEST_NAV_VIEW_SHOP;
                    break;
                case ACT_NAV_MANAGEMENT:
                    url = DEST_NAV_MANAGEMENT;
                    break;
                case ACT_VIEW_RECIPE:
                    url = DEST_VIEW_RECIPE;
                    break;
                case ACT_SEARCH_RECIPE:
                    url = DEST_SEARCH_RECIPE;
                    break;
                case ACT_COMMENT_RECIPE:
                    url = DEST_COMMENT_RECIPE;
                    break;
                case ACT_NAV_CREATE_RECIPE:
                    url = DEST_NAV_CREATE_RECIPE;
                    break;
                case ACT_CREATE_RECIPE:
                    url = DEST_CREATE_RECIPE;
                    break;
                case ACT_NAV_EDIT_RECIPE:
                    url = DEST_NAV_EDIT_RECIPE;
                    break;
                case ACT_EDIT_RECIPE:
                    url = DEST_EDIT_RECIPE;
                    break;
                case ACT_DELETE_RECIPE:
                    url = DEST_DELETE_RECIPE;
                    break;
                case ACT_DELETE_RECIPE_COMMENT:
                    url = DEST_DELETE_RECIPE_COMMENT;
                    break;
                case ACT_APPROVE_RECIPE:
                    url = DEST_APPROVE_RECIPE;
                    break;
                case ACT_REJECT_RECIPE:
                    url = DEST_REJECT_RECIPE;
                    break;
                case ACT_NAV_MARKETPLACE:
                    url = DEST_NAV_MARKETPLACE;
                    break;
                case ACT_NAV_VIEW_PRODUCT:
                    url = DEST_NAV_VIEW_PRODUCT;
                    break;
                case ACT_TO_ADD_PRODUCT:
                    url = DEST_TO_ADD_PRODUCT;
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
                case ACT_NAV_VIEW_PRODUCT_BY_CATE:
                    url = DEST_NAV_VIEW_PRODUCT_BY_CATE;
                    break;
                case ACT_CANCEL_ORDER:
                    url = DEST_CANCEL_ORDER;
                    break;
                case ACT_NAV_SHOPPROFILE:
                    url = DEST_NAV_SHOPPROFILE;
                    break;
                case ACT_SEARCH_PRODUCT_BY_NAME:
                    url = DEST_SEARCH_PRODUCT_BY_NAME;
                    break;
                case ACT_DELETE_PRODUCT_BY_ID:
                    url = DEST_DELETE_PRODUCT_BY_ID;
                    break;  
                case ACT_EDIT_SHOP_PROFILE:
                    url = NAV_EDIT_SHOP_PROFILE;
                    break;  
                case ACT_COMMENT_PRODUCT:
                    url = DEST_COMMENT_PRODUCT;
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