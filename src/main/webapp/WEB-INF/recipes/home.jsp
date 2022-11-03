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
            <div class="d-flex justify-content-end" style="margin: 20px 80px;">
                <a class="create_recipe_btn" href="${toCreateRecipe}">
                    <div>
                        <i class="bi bi-plus-circle" style="font-size: 30px;"></i>
                    </div>
                    <div class="create_recipe_btn_text d-inline-block mx-2">
                        Create a recipe
                    </div>
                </a>
            </div>
            <div class="recipe_list">
                <c:forEach var="recipe" items="${sessionScope.RECIPE_LIST}"> 
                <%--<c:forEach begin="1" end="10">--%>
                    <div class="card mb-3 col-9">
                        <div class="row card_row d-flex">
                            <div class="col-3">
                                <img src="${recipe.imgUrl}" class="img-fluid rounded-start recipe_img" alt="recipe image">
                            </div>
                            <div class="col-9">
                                <div class="card-body">
                                    <div class="row d-flex">
                                        <div class="col-10">
                                            <h5 class="recipe_title">${recipe.title}</h5>
                                            <p class="recipe_author">By: <a href="${toViewProfile}">${recipe.authorName}</a></p>
                                        </div>
                                        <div class="col-2 p-0 d-flex justify-content-center">
                                            <button class="button button-like" onclick="toggleLikeButton(this)">
                                                <i class="fa fa-heart"></i>
                                                <span>Like</span>
                                                <span class="recipe_vote_count">${recipe.voteCount}</span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="recipe_desc my-1" style="height: 80px;">
                                        ${recipe.desc}
                                    </div>
                                    <div class="row d-flex align-items-center">
                                        <div class="recipe_time col-10"><small class="text-muted">${recipe.approvalTime}</small></div>
                                        <a class="col-2 see_detail_btn" href="MainController?action=NavToViewRecipe&recipeId=${recipe.id}">See details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%@include file="/WEB-INF/common/footer.jsp"%>
        <script>
            function toggleLikeButton(x) {
                x.classList.toggle("liked");
            }
        </script>
    </body>
</html>
