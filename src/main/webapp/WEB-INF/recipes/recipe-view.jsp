<%-- 
    Document   : viewRecipe
    Created on : Oct 11, 2022, 1:11:37 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View A Recipe - BakeNow</title>
        <link rel="stylesheet" href="assets/css/recipes/recipe-view.css">
    </head>
    <body>
        <!-- Pop up -->
        <div id="confirm-delete-recipe-popup">
            <div style="text-align: center;">
                <img src="assets/img/logo.png" height="100" width="250"></img>
            </div>
            <hr style="margin: 10px;">
            <div class="popup-content">Are you sure to delete this recipe</div>
            <div style="text-align: center;">
                <button class="popupBtn" onclick="window.location.href = 'MainController?action=DeleteRecipe&recipeId=${RECIPE.id}';">OK</button>
                <button class="popupBtn" onclick="window.location.href = 'MainController?action=ViewRecipe&recipeId=${RECIPE.id}';">Cancel</button>
            </div>
        </div>

        <div id="reject-recipe-popup">
            <div style="text-align: center;">
                <img src="assets/img/logo.png" height="100" width="250"></img>
            </div>
            <hr style="margin: 10px;">
            <div class="popup-content">Provide a reason for rejection</div>
            <form class="reject-form" action="MainController">
                <div class="reasons" style="padding-left: 80px;">
                    <div>
                        <input type="radio" name="reason" value="Nudity" required> Nudity
                    </div>
                    <div>
                        <input type="radio" name="reason" value="Violent"> Violent
                    </div>
                    <div>
                        <input type="radio" name="reason" value="Harassment"> Harassment
                    </div>
                    <div>
                        <input type="radio" name="reason" value="Hate speech"> Hate speech
                    </div>
                    <div>
                        <input type="radio" name="reason" value="Terrorism"> Terrorism
                    </div>
                    <div>
                        <input type="radio" name="reason" value="Copyright infringement"> Copyright infringement
                    </div>
                    <div>
                        <input type="radio" name="reason" value="False information"> False information
                    </div>
                    <div>
                        <input type="radio" name="reason" value="Others"> Others
                    </div>
                </div>
                <div style="text-align: center;">
                    <input type="hidden" name="recipeId" value="${RECIPE.id}">
                    <input type="hidden" name="restricterId" value="${sessionScope.LOGIN_USER.id}">
                    <input class="popupBtn" type="submit" name="action" value="Submit" style="height: 45px; border: 1px solid #D9D9D9; border-radius: 50px;">
                    <button class="popupBtn" onclick="window.location.href = 'MainController?action=ViewRecipe&recipeId=${RECIPE.id}';">Cancel</button>
                </div>
            </form>
        </div>

        <!-- ----------------------------------------- -->
        <%@include file="/WEB-INF/common/header.jsp"%>
        <c:url var="toEditRecipe" value="MainController?action=NavToEditRecipe"/>
        <div id="page_view-recipe" class="main-container py-3">
            <div class="row">
                <div class="recipe_info col-7"">
                    <div class="recipe_info_container">
                        <div class="recipe_title" style="font-size: 30px; font-weight: bold; margin: 10px;">${RECIPE.title}</div>
                        <div class="recipe_desc" style="margin: 10px;">${RECIPE.desc}</div>
                        <div class="recipe_desc" style="margin: 10px;"> Time to make: ${RECIPE.cookTime} mins</div>

                        <div class="recipe_subinfo d-flex">
                            <div class="col-1" style="text-align: center;">
                                <img class="col-1" src="${RECIPE.authorAvatarUrl}" alt="author avatar" style="width: 40px; height: 40px; border-radius: 50px;">
                            </div>
                            <div class="col-10">
                                <a style="text-decoration: none;" 
                                   <c:if test="${RECIPE.authorId == sessionScope.LOGIN_USER.id}">href="MainController?action=NavToMyPage"</c:if> 
                                   <c:if test="${RECIPE.authorId != sessionScope.LOGIN_USER.id}">href="MainController?action=NavToViewUser&userId=${RECIPE.authorId}"</c:if>
                                   >${RECIPE.authorName}</a> 
                                <div class="text-muted" style="font-size: 14px;">${RECIPE.approvalTime}</div>
                            </div>
                            <c:if test="${sessionScope.LOGIN_USER.roleId == 0 || sessionScope.LOGIN_USER.roleId == 1 || sessionScope.LOGIN_USER.id == RECIPE.authorId}">
                                <div class="col-1" style="text-align: end;">
                                    <div class="bi bi-three-dots-vertical drop_icon" style="font-size: 30px;">
                                        <div class="dropdown_action_content">
                                            <c:if test="${sessionScope.LOGIN_USER.roleId == 0 || sessionScope.LOGIN_USER.roleId == 1}">
                                                <c:if test="${RECIPE.statusId == 1}">
                                                    <a href="">Hide</a>
                                                </c:if>
                                                <c:if test="${RECIPE.statusId == 0}">
                                                    <a href="MainController?action=ApproveRecipe&recipeId=${RECIPE.id}&approverId=${sessionScope.LOGIN_USER.id}">Approve</a>
                                                    <a onclick="openRejectPopup()">Reject</a>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${sessionScope.LOGIN_USER.id == RECIPE.authorId}">
                                                <c:if test="${RECIPE.statusId == 0 || RECIPE.statusId == 1}">
                                                    <a href="MainController?action=NavToEditRecipe&recipeId=${RECIPE.id}">Edit</a>
                                                </c:if>
                                                <a  onclick="openDeletePopup()">Delete</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <div class="recipe_img py-2 d-flex justify-content-center">
                            <image src="${RECIPE.imgUrl}" alt="recipe images" style="width: 256px; height: 256px;">
                        </div>
                        <c:url var="rateRecipe" value="MainController?action=NavToBlogHome"/>
                        <c:if test="${RECIPE.statusId == 1 || RECIPE.statusId == 2}">
                            <div class="py-2 d-flex justify-content-end">
                                <button class="button button-like" <c:if test="${RECIPE.statusId == 1}"> onclick="toggleLikeButton(this)" </c:if>>
                                        <i class="fa fa-heart"></i>
                                        <span>Like</span>
                                        <span class="recipe_vote_count">${RECIPE.voteCount}</span>
                                </button>
                            </div>       
                        </c:if>
                        <div style="font-size: 24px; width: 150px; padding-left: 5px; font-weight: bold; border-bottom: 2px solid #000;">Instructions</div>
                        <div class="recipe_instruction my-2">
                            <c:forEach var="step" items="${RECIPE.steps}">
                                <p style="text-align: justify;">
                                    <span style="font-weight: bold;">Step ${step.key}: </span> ${step.value}
                                </p>
                            </c:forEach>
                        </div>
                    </div>
                    <div style="font-size: 24px; width: 150px; font-weight: bold; padding-left: 5px;border-bottom: 2px solid #000;">Comments</div>
                    <c:if test="${RECIPE.statusId == 1}">
                        <div class="add_comment_container my-2" style="border: 1px solid #D9D9D9; border-radius: 5px; background-color: #fff;">
                            <form class="p-2 mb-0" action="MainController">
                                <div style="font-weight: bold; font-size: 20px; margin-bottom: 5px;">Leave your comment here</div>
                                <div> 
                                    <textarea type="text" style="height: 100px; width: 100%; vertical-align: text-top; border: 1px solid #D9D9D9; padding: 10px;" name="contents" placeholder="Share your thought..."></textarea>
                                </div>
                                <div class="my-2 d-flex justify-content-end">
                                    <input type="hidden" name="recipeId" value="${RECIPE.id}">
                                    <input type="hidden" name="userId" value="${sessionScope.LOGIN_USER.id}">
                                    <input type="submit" class="px-2 recipe_comment_button" style="width: 100px; height: 45px;" name="action" value="Comment">
                                </div>
                            </form>
                        </div>
                    </c:if>
                    <div>
                        <ul class="py-1 list-unstyled">
                            <c:forEach var="comment" items="${RECIPE.comments}">
                                <li class="p-1 my-1" style="border: 1px solid #D9D9D9; border-radius: 5px; background-color: #fff;">
                                    <div class="d-flex" style="padding: 5px;">
                                        <div class="col-1 d-flex justify-content-center">
                                            <img src="${comment.avatarUrl}" alt="commentor avatar" style="width: 40px; height: 40px; border-radius: 50px;">
                                        </div>
                                        <div class="col-10 px-1">
                                            <a href="${pageScope.ToProfile}">${comment.userName}</a>
                                            <div class="text-muted" style="font-size: 14px;">${comment.createTime}</div>
                                        </div>
                                        <div class="col-1 d-flex justify-content-end">
                                            <c:if test="${sessionScope.LOGIN_USER.id == comment.userId}">
                                                <div class="bi bi-three-dots-vertical drop_icon" style="font-size: 30px;">
                                                    <div class="dropdown_action_content">
                                                        <a href="MainController?action=DeleteRecipeComment&commentId=${comment.id}&recipeId=${RECIPE.id}">Delete</a>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <hr style="margin: 1px; color: #D9D9D9; height: 3px;">
                                    <div class="recipe_comment_view_content" style="padding: 10px 30px;">
                                        ${comment.contents}
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="recipe_supply col-5 d-flex justify-content-center">
                    <div class="recipe_supply_container col-10" style="border: 1px solid #D9D9D9; border-radius: 5px; margin-top: 100px; background-color: #fff; height: fit-content;">
                        <div class="recipe_supply_ingredient p-2">
                            <div style="font-size: 24px; font-weight: bold; text-align: center; margin-bottom: 10px;">Ingredients</div>
                            <ul class="m-0 list-unstyled" style="border: 1px solid #D9D9D9;">
                                <c:forEach var="ingredient" items="${RECIPE.ingredients}">
                                    <li class="recipe_supply_item d-flex py-1 px-1">
                                        <div class="col-8">${ingredient.key}</div>
                                        <div class="col-4">${ingredient.value}</div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="recipe_supply_tool p-2">
                            <div style="font-size: 24px; font-weight: bold; text-align: center; margin-bottom: 10px;">Tools</div>
                            <ul class="m-0 list-unstyled" style="border: 1px solid #D9D9D9;">
                                <c:forEach var="tool" items="${RECIPE.tools}">
                                    <li class="recipe_supply_item py-1 px-1">
                                        ${tool}
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/common/footer.jsp"%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
                                    function toggleLikeButton(x) {
                                        x.classList.toggle("liked");
                                    }
                                    ;
                                    function openDeletePopup() {
                                        document.getElementById("confirm-delete-recipe-popup").style.display = "block";
                                    }
                                    function openRejectPopup() {
                                        document.getElementById("reject-recipe-popup").style.display = "block";
                                    }
        </script>
    </body>
</html>
