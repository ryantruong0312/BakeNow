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
        <%@include file="/WEB-INF/common/header.jsp"%>
        <c:url var="toProfile" value="MainController?action=NavToProfile"/>
        <c:url var="toEditRecipe" value="MainController?action=NavToEditRecipe"/>
        <c:url var="toRateRecipe" value="MainController?action=NavToRateRecipe"/>
        <div id="page_view-recipe" class="main-container py-3">
            <div class="row">
                <div class="recipe_info col-7"">
                    <div class="recipe_info_container">
                        <div class="recipe_title" style="font-size: 30px; font-weight: bold; margin: 10px;">${RECIPE.title}</div>
                        <div class="recipe_desc" style="margin: 10px;">${RECIPE.desc}</div>

                        <div class="recipe_subinfo d-flex">
                            <div class="col-1" style="text-align: center;">
                                <img class="col-1" src="${RECIPE.authorAvatarUrl}" alt="author avatar" style="width: 40px; height: 40px; border-radius: 50px;">
                            </div>
                            <div class="col-10">
                                <a style="text-decoration: none;" href="${toProfile}">${RECIPE.authorName}</a> 
                                <div class="text-muted" style="font-size: 14px;">${RECIPE.approvalTime}</div>
                            </div>
                            <c:if test="${sessionScope.LOGIN_USER.roleId == 0 || sessionScope.LOGIN_USER.roleId == 1 || sessionScope.LOGIN_USER.id == RECIPE.authorId}">
                                <div class="col-1" style="text-align: end;">
                                    <div class="bi bi-three-dots-vertical drop_icon" style="font-size: 30px;">
                                        <div class="dropdown_action_content">
                                            <c:if test="${sessionScope.LOGIN_USER.roleId == 0 || sessionScope.LOGIN_USER.roleId == 1}">
                                                <a href="">Hide</a>
                                            </c:if>
                                            <c:if test="${sessionScope.LOGIN_USER.id == RECIPE.authorId}">
                                                <a href="MainController?action=NavToEditRecipe&recipeId=${RECIPE.id}">Edit</a>
                                            </c:if>
                                            <a href="" id="confirmDeletion">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <div class="recipe_img py-2 d-flex justify-content-center">
                            <image src="${RECIPE.imgUrl}" alt="recipe images" style="width: 256px; height: 256px;">
                        </div>
                        <c:url var="rateRecipe" value="MainController?action=NavToBlogHome"/>
                        <div class="py-2 d-flex justify-content-end">
                            <button class="button button-like" onclick="toggleLikeButton(this)">
                                <i class="fa fa-heart"></i>
                                <span>Like</span>
                                <span class="recipe_vote_count">${RECIPE.voteCount}</span>
                            </button>
                        </div>
                        <div>
                            <i class="bi bi-clock"></i> <span>${RECIPE.cookTime} mins</span>
                        </div>
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
                    <div>
                        <ul class="py-1 list-unstyled">
                            <c:forEach var="comment" items="${RECIPE.comments}">
                                <li class="p-1 my-1" style="border: 1px solid #D9D9D9; border-radius: 5px; background-color: #fff;">
                                    <div class="d-flex" style="padding: 5px;">
                                        <img class="col-1" src="${comment.avatarUrl}" alt="commentor avatar" style="width: 40px; height: 40px; border-radius: 50px;">
                                        <div class="col-11 px-1">
                                            <a href="${pageScope.ToProfile}">${comment.userName}</a>
                                            <div class="text-muted" style="font-size: 14px;">${comment.createTime}</div>
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
        <script>
            function toggleLikeButton(x) {
                x.classList.toggle("liked");
            }
            ;

            document.getElementById("confirmDeletion").onclick = () => {
                var agree = confirm("Are you sure you want to delete this recipe?");
                if (agree)
                    document.getElementById("confirmDeletion").href = "MainController?action=DeleteRecipe&recipeId=${RECIPE.id}";
                else
                    document.getElementById("confirmDeletion").href = "#";

            };
        </script>
    </body>
</html>
