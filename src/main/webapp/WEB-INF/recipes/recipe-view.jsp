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

                        <div class="recipe_subinfo d-flex">
                            <div class="col-1" style="text-align: center;">
                                <img class="col-1" src="${RECIPE.authorAvatarUrl}" alt="author avatar" style="width: 50px; height: 40px; border-radius: 50px;">
                            </div>
                            <div class="col-10">
                                <a style="text-decoration: none;" href="${toProfile}">${RECIPE.authorName}</a> 
                                <div class="text-muted" style="font-size: 14px;">${RECIPE.approvalTime}</div>
                            </div>
                            <div class="col-1" style="text-align: end;">
                                <i class="bi bi-three-dots-vertical" id="drop_icon" style="font-size: 30px;"></i>
                                <div id="dropdown_action_content">
                                    <a href="">Edit</a>
                                    <a href="">Hide</a>
                                    <a href="">Delete</a>
                                </div>
                            </div>
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
                        <div class="recipe_instruction">

                            <div style="font-size: 24px; font-weight: bold; text-align: center;">Instruction</div>
                            <c:forEach var="step" items="${RECIPE.steps}">
                                <div style="font-size: 20px; font-weight: bold;">
                                    <span>Step ${step.key}</span>
                                </div>
                                <p style="text-align: justify;">
                                    ${step.value}
                                </p>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="recipe_supply col-5 d-flex  justify-content-center">
                    <div class="recipe_supply_container col-10" style="border: 1px solid #D9D9D9; border-radius: 5px; margin-top: 100px; background-color: #fff; height: fit-content;">
                        <div class="recipe_supply_ingredient py-2">
                            <div style="font-size: 24px; font-weight: bold; text-align: center;">Ingredients</div>
                            <ul class="py-1 px-2 m-0 list-unstyled">
                                <c:forEach var="ingredient" items="${RECIPE.ingredients}">
                                    <li class="recipe_supply_item d-flex py-1 px-1">
                                        <div class="col-8">${ingredient.alias}</div>
                                        <div class="col-4">${ingredient.amount}</div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="recipe_supply_tool py-2 px-2">
                            <div style="font-size: 24px; font-weight: bold; text-align: center;">Tools</div>
                            <ul class="py-1 px-2 m-0 list-unstyled">
                                <c:forEach var="tool" items="${RECIPE.tools}">
                                    <li class="recipe_supply_item py-1 px-1">
                                        ${tool.alias}
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="add_shopping_list py-2 d-flex justify-content-center">
                            <button type="button" class="add_shopping_list_button btn" onclick="window.location.href = '${toShoppingList}';">Add to shopping list</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row recipe_comment">
                <div class="recipe_comment_view_container col-7 d-flex justify-content-left">
                    <div class="recipe_comment_view col-10">
                        <ul class="py-1 px-2 list-unstyled">
                            <c:forEach begin="1" end="3">
                                <li class="p-1 my-1" style="border: 1px solid #D9D9D9; border-radius: 5px; background-color: #fff;">
                                    <div class="d-flex" style="padding: 5px;">
                                        <img class="col-1 align-items-center" src="assets/img/profile_icon.png" alt="profile image" style="width:35px; height:35px; border: 1px solid #D9D9D9; border-radius: 100px;"/>
                                        <div class="col-11 px-1">
                                            <a href="${pageScope.ToProfile}">${requestScope.RECIPE.authorName}Nguyễn Văn A</a>
                                            <div class="reicpe_comment_view_time" style="font-size: 14px;">20/09/2022 15:35</div>
                                        </div>
                                    </div>
                                    <hr style="margin: 1px; color: #D9D9D9; height: 3px;">
                                    <div class="recipe_comment_view_content p-1">
                                        Đã thử và nhận ra bánh quá ngon đến nỗi ăn mấy ngày chưa hết!!!.
                                    </div>
                                    <div class="recipe_comment_reply py-2 d-flex justify-content-end">
                                        <button type="button" class="recipe_comment_reply_button btn px-2" style="width: 100px;" onclick="window.location.href = '${replyComment}';">Reply</button>
                                    </div>

                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="recipe_comment_add col-5 d-flex justify-content-center">
                    <div class="recipe_comment_add_container col-10 py-1" style="border: 1px solid #D9D9D9; border-radius: 5px; height: fit-content; background-color: #fff;">
                        <span class="py-2 px-2" style="font-size: 24px; font-weight: bold;">Leave your comment here</span>

                        <form class="p-2 mb-0" action="">
                            <div class="p-1"> 
                                <textarea type="text" style="height: 150px; vertical-align: text-top; border: 1px solid #D9D9D9;" class="col-12" name="commentContent" placeholder="Share your thought..."></textarea>
                            </div>
                            <div class="my-2 d-flex justify-content-end">
                                <input type="submit" class="px-2 recipe_comment_add_button" style="width: 100px; height: 45px;" name="action" value="Post">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/common/footer.jsp"%>
        <script>
        </script>
    </body>
</html>
