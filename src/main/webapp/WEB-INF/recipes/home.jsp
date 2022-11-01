<%-- 
    Document   : index
    Created on : 30 Sept 2022, 20:01:49
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog Home - BakeNow</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/recipes/home.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@include file="/WEB-INF/common/header.jsp"%>
        <c:url var="toViewRecipe" value="MainController?action=NavToViewRecipe"/>
        <c:url var="toViewProfile" value="MainController?action=NavToViewProfile"/>
        <c:url var="toCreateRecipe" value="MainController?action=NavToCreateRecipe"/>
        <div class="main-container">
            <div class="d-flex my-2 justify-content-end">
                <a class="create_recipe_btn" href="${toCreateRecipe}" style="width: 200px; height: 60px;">
                    <div>
                        <i class="bi bi-plus-circle" style="font-size: 30px;"></i>
                    </div>
                    <div class="create_recipe_btn_text d-inline-block mx-2">
                        Create a recipe
                    </div>
                </a>
            </div>
            <div class="recipe_list">
                <c:forEach begin="1" end="12">
                    <div class="recipe_card">
                        <div class="recipe_card_img">
                            <img src="assets/img/img_10.png" alt="recipe">
                        </div>
                        <div class="recipe_body">
                            <a href="${toViewRecipe}"><div class="recipe_title">Bánh Cupcake Nho Khô</div></a>
                            <p class="recipe_author">By: <a href="${toViewProfile}">Peter Parking</a></p><br>
                            <div class="recipe_more">
                                <i class="bi bi-clock" style="font-size: 25px;"></i>
                                <span class="recipe_cookTime" style="margin-top: 0px; padding-left: 3px;">35m</span>
                                <div class="recipe-star">
                                    <span class="fa fa-star fa-star-sized checked"></span>
                                    <span class="fa fa-star fa-star-sized checked"></span>
                                    <span class="fa fa-star fa-star-sized checked"></span>
                                    <span class="fa fa-star fa-star-sized"></span>
                                    <span class="fa fa-star fa-star-sized"></span>
                                    <span class="recipe_text"  style="margin-top: 0px; padding-left: 0px; padding-right: 0px;">(19)</span>
                                </div>
                            </div>
                            <p class="recipe_text-published">Published: 11/7/2022</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%@include file="/WEB-INF/common/footer.jsp"%>
    </body>
</html>
