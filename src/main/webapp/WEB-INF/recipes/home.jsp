<%-- 
    Document   : index
    Created on : 30 Sept 2022, 20:01:49
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog Home - BakeNow</title>
        <link rel="stylesheet" href="assets/css/recipes/home.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <!-- Popups -->
        <div id="create-recipe-success-popup" style="width: 350px; height: 250px; padding: 20px; border: 2px solid #000; border-radius: 5px; background-color: #56D262;
             <c:if test="${param.returnFromCreation != 1}">
                 display:none;
             </c:if>">
            <div style="text-align: center;">
                <img src="assets/img/logo.png" height="100" width="250"></img>
            </div>
            <hr style="margin: 10px;">
            <div class="popup-content">Create recipe successfully! The recipe is now pending for approval</div>
            <div style="text-align: center;">
                <button class="popupBtn" onclick="window.location.href = 'MainController?action=NavToBlogHome';">
                    OK
                </button>
            </div>
        </div>


        <div id="delete-recipe-success-popup" style="width: 350px; height: 250px; padding: 20px; border: 2px solid #000; border-radius: 5px; background-color: #56D262;
             <c:if test="${param.returnFromDeletion != 1}">
                 display:none;
             </c:if>">
            <div style="text-align: center;">
                <img src="assets/img/logo.png" height="100" width="250"></img>
            </div>
            <hr style="margin: 10px;">
            <div class="popup-content">The recipe was deleted successfully!</div>
            <div style="text-align: center;">
                <button class="popupBtn" onclick="window.location.href = 'MainController?action=NavToBlogHome';">OK</button>
            </div>
        </div>
        <!-- ----------------------------------------- -->
        <%@include file="/WEB-INF/common/header.jsp"%>
        <div class="main-container">
            <div class="d-flex justify-content-end" style="margin: 20px 180px;">
                <c:if test="${sessionScope.LOGIN_USER == NULL}">
                    <c:set var="userId" scope="page" value="0"></c:set>
                </c:if>
                <c:if test="${sessionScope.LOGIN_USER != NULL}">
                    <c:set var="userId" scope="page" value="${sessionScope.LOGIN_USER.id}"></c:set>
                </c:if>
                <c:if test="${sessionScope.LOGIN_USER.roleId != 0 && sessionScope.LOGIN_USER.roleId != 1}">
                    <a class="create_recipe_btn" href="MainController?action=NavToCreateRecipe&userId=${userId}">
                        <div>
                            <i class="bi bi-plus-circle" style="font-size: 30px;"></i>
                        </div>
                        <div class="create_recipe_btn_text d-inline-block mx-2">
                            Create a recipe
                        </div>
                    </a>
                </c:if>
            </div>
            <div class="recipe_list">
                <c:forEach var="recipe" items="${sessionScope.RECIPE_LIST}"> 
                    <c:if test="${recipe.statusId == 1}">
                        <c:set var="orgTitle" value="${recipe.title}"></c:set>
                        <c:set var="title" value="${fn:toLowerCase(orgTitle)}"></c:set>
                        <c:set var="orgSearch" value="${param.search}"></c:set>
                        <c:set var="search" value="${fn:toLowerCase(orgSearch)}"></c:set>
                        <c:if test="${fn:contains(title, search)}">
                            <div class="card mb-3 col-9">
                                <div class="row card_row d-flex">
                                    <div class="col-3">
                                        <img src="${recipe.imgUrl}" class="img-fluid rounded-start recipe_img" alt="recipe image">
                                    </div>
                                    <div class="col-9">
                                        <div class="card-body py-2">
                                            <div class="row d-flex">
                                                <div class="col-10 p-0">
                                                    <div class="recipe_title" style="font-size: 28px; font-weight: bold; margin-bottom: 10px;">${recipe.title}</div>
                                                    <p class="recipe_author">
                                                        <img class="col-3" src="${recipe.authorAvatarUrl}" alt="profile icon" style="width: 30px; height: 30px; border-radius: 50px;">
                                                        <a  
                                                            <c:if test="${recipe.authorId == sessionScope.LOGIN_USER.id}">href="MainController?action=NavToMyPage"</c:if> 
                                                            <c:if test="${recipe.authorId != sessionScope.LOGIN_USER.id}">href="MainController?action=NavToViewUser&userId=${recipe.authorId}"</c:if>>
                                                            ${recipe.authorName}
                                                        </a>
                                                    </p>
                                                </div>
                                                <div class="col-2 p-0 d-flex justify-content-center">
                                                    <button class="button button-like" onclick="toggleLikeButton(this)">
                                                        <i class="fa fa-heart"></i>
                                                        <span>Like</span>
                                                        <span class="recipe_vote_count">${recipe.voteCount}</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="row recipe_desc my-" style="height: 80px; overflow: hidden; text-overflow: ellipsis;">
                                                ${recipe.desc}
                                            </div>
                                            <div class="row d-flex align-items-center my-2">
                                                <div class="recipe_time col-10 p-0"><small class="text-muted">${recipe.approvalTime}</small></div>
                                                <a class="col-2 see_detail_btn" href="MainController?action=ViewRecipe&recipeId=${recipe.id}">See details</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:if>
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
