<%-- 
   Document   : editRecipe
   Created on : Oct 12, 2022, 12:48:37 PM
   Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit A Recipe - BakeNow</title>
        <link rel="stylesheet" href="assets/css/recipes/recipe-edit.css">
    </head>
    <body>
        <%@include file="/WEB-INF/common/header.jsp"%>
        <div class="main-container py-3">
            <div class="edit_recipe_container d-flex justify-content-center">
                <div class="edit_recipe col-10">
                    <div class="col-10 edit_recipe_page_title">
                        EDIT YOUR RECIPE
                    </div>
                    <div class="d-flex justify-content-center my-3 py-3" style="background-color: #fff;">
                        <form action="" class="edit_recipe_form col-10">
                            <div class="py-2" > 
                                <span style="font-size: 24px; font-weight: bold;">Title</span> <input type="text" style="width: 100%; padding-left: 10px;" name="title" required="" value="${RECIPE.title}">
                            </div>
                            <div class="py-2" > 
                                <span style="font-size: 24px; font-weight: bold;">Description</span> <textarea type="text" style="padding-left: 10px; width: 100%; height: 120px;" name="desc" required="">${RECIPE.desc}</textarea>
                            </div>
                            <div class="py-2" > 
                                <span style="font-size: 24px; font-weight: bold;">Cook time</span> <input type="number" style="width: 75px; padding-left: 10px;" name="cookTime" required="" value="${RECIPE.cookTime}">
                            </div>
                            <div class="py-2 d-flex justify-content-center">
                                <div class="col-4 py-2">
                                    <image src="${RECIPE.imgUrl}" style="height: 256px; width: 256px; display: block; margin: 0 auto; border-radius: 5px;">
                                    <div style="text-align: center; margin-top: 10px;">
                                        <span>Image URL</span><input style="width: 300px; margin: 10px;" type="text" name="imgUrl" value="${RECIPE.imgUrl}">
                                    </div>
                                </div>
                            </div>
                            <div class="py-2" > 
                                <div style="font-size: 24px; font-weight: bold;">Instruction</div>
                            </div>
                            <c:forEach var="step" items="${RECIPE.steps}">
                                <div class="recipe_edit_form_step">
                                    <div style="font-size: 20px; padding-left: 10px">
                                        <span class="recipe_create_form_step_counter">Step ${step.key}</span>
                                    </div>
                                    <div class="d-flex">
                                        <div class="col-11">
                                            <textarea class="my-2 py-2" type="text" style=" padding-left: 10px; width: 100%; min-height: 130px;" name="stepContent" required="">${step.value}</textarea>
                                        </div>
                                        <div class="col-1 d-flex align-items-center justify-content-center">
                                            <i class="bi bi-dash-circle removeStep" style="font-size: 30px;"></i>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div id="add_step" class="my-2 supply_add_button">+ Add</div>
                            <div class="d-flex">
                                <div class="edit_recipe_form_supply_ingredient col-7 my-4">
                                    <div style="font-size: 24px; font-weight: bold;">Ingredients</div>
                                    <div class="p-2 my-2" style="border: 1px solid #D9D9D9; border-radius: 5px;">
                                        <div class="d-flex">
                                            <div class="col-7 mx-1 d-flex justify-content-center" style="font-size: 20px;">Name</div>
                                            <div class="col-4 mx-1 d-flex justify-content-center" style="font-size: 20px;">Amount</div>
                                            <div class="col-1 d-flex align-items-center"></div>
                                        </div>
                                        <c:forEach var="ingredient" items="${RECIPE.ingredients}">
                                            <div class="d-flex">
                                                <input type="text" class="supply col-7 mx-1 my-2" style="padding-left: 10px;" name="ingredientName" value="${ingredient.key}" required="">
                                                <input type="text" class="supply col-4 mx-1 my-2" style="padding-left: 10px;" name="amount" value="${ingredient.value}">
                                                <i class="bi bi-dash-circle col-1 d-flex align-items-center removeSupply" style="font-size: 30px;"></i>
                                            </div>
                                        </c:forEach>
                                        <div class="mx-1 my-2 supply_add_button" id="add_ingredient">+ Add</div>
                                    </div>
                                </div>
                                <div class="edit_recipe_form_supply_tool col-5 my-4 mx-2">
                                    <div style="font-size: 24px; font-weight: bold;">Tools</div>
                                    <div class="p-2 my-2" style="border: 1px solid #D9D9D9; border-radius: 5px;">
                                        <div class="col-10 mx-1 d-flex justify-content-center" style="font-size: 20px;">Name</div>
                                        <c:forEach var="tool" items="${RECIPE.tools}">
                                            <div class="d-flex">
                                                <input type="text" class="supply col-10 mx-1 my-2" style="padding-left: 10px;" name="toolName" value="${tool}" required="">
                                                <i class="bi bi-dash-circle col-1 d-flex align-items-center removeSupply" style="font-size: 30px;"></i>
                                            </div>
                                        </c:forEach>
                                        <div class="mx-1 my-2 supply_add_button" id="add_tool">+ Add</div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end">
                                <input type="hidden" name="recipeId" value="${RECIPE.id}">
                                <input class="last_button mx-2" type="submit" name="action" value="Save">
                                <a class="last_button" style="padding-top: 5px;" href="MainController?action=ViewRecipe&recipeId=${RECIPE.id}">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/common/footer.jsp"%>
        <!--<script src="assets/js/create-recipe.js"></script>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <c:set var="stepCount" value="1"></c:set>
        <script>

            document.getElementById("add_step").onclick = () => {
                var step = document.createElement('div');
                step.setAttribute("class", "recipe_create_form_step");
                var stepNumDiv = document.createElement('div');
                stepNumDiv.setAttribute("style", "font-size: 20px; padding-left: 10px");
                var counter = document.createElement('span');
                counter.setAttribute("class", "recipe_create_form_step_counter");
                stepNumDiv.appendChild(counter);
                var contentAndBtnDiv = document.createElement('div');
                contentAndBtnDiv.setAttribute("class", "d-flex");
                var contentDiv = document.createElement('div');
                contentDiv.setAttribute("class", "col-11");
                var content = document.createElement('textarea');
                content.setAttribute("class", "my-2 py-2");
                content.setAttribute("type", "text");
                content.setAttribute("style", "padding-left: 10px; width: 100%; height: 130px;");
                content.setAttribute("name", "stepContent");
                content.setAttribute("placeholder", "Write an instruction...");
                content.setAttribute("required", "");
                contentDiv.appendChild(content);
                var btnDiv = document.createElement('div');
                btnDiv.setAttribute("class", "col-1 d-flex align-items-center justify-content-center");
                var removeBtn = document.createElement('i');
                removeBtn.setAttribute("class", "bi bi-dash-circle removeStep");
                removeBtn.setAttribute("style", "font-size: 30px;");
                btnDiv.appendChild(removeBtn);
                contentAndBtnDiv.appendChild(contentDiv);
                contentAndBtnDiv.appendChild(btnDiv);
                step.appendChild(stepNumDiv);
                step.appendChild(contentAndBtnDiv);
                document.getElementById("add_step").previousElementSibling.insertAdjacentElement('afterend', step);

                $('.recipe_create_form_step_counter').each((index, el) => {
                    $(el).text('Step ' + (index + 1));
                });
            };

            document.getElementById("add_ingredient").onclick = () => {
                var ingredient = document.createElement('div');
                ingredient.setAttribute("class", "d-flex");
                var name = document.createElement('input');
                name.setAttribute("type", "text");
                name.setAttribute("class", "supply col-7 m-1 my-2");
                name.setAttribute("style", "padding-left: 10px;");
                name.setAttribute("name", "ingredientName");
                name.setAttribute("required", "");
                var amount = document.createElement('input');
                amount.setAttribute("type", "text");
                amount.setAttribute("class", "supply col-4 m-1 my-2");
                amount.setAttribute("style", "padding-left: 10px;");
                amount.setAttribute("name", "amount");
                var removeBtn = document.createElement('i');
                removeBtn.setAttribute("class", "bi bi-dash-circle col-1 d-flex align-items-center removeSupply");
                removeBtn.setAttribute("style", "font-size: 30px;");
                ingredient.appendChild(name);
                ingredient.appendChild(amount);
                ingredient.appendChild(removeBtn);
                document.getElementById("add_ingredient").previousElementSibling.insertAdjacentElement('afterend', ingredient);
            };

            document.getElementById("add_tool").onclick = () => {
                var tool = document.createElement('div');
                tool.setAttribute("class", "d-flex");
                var name = document.createElement('input');
                name.setAttribute("type", "text");
                name.setAttribute("class", "supply col-10 mx-1 my-2");
                name.setAttribute("style", "padding-left: 10px;");
                name.setAttribute("name", "toolName");
                name.setAttribute("required", "");
                var removeBtn = document.createElement('i');
                removeBtn.setAttribute("class", "bi bi-dash-circle col-1 d-flex align-items-center removeSupply");
                removeBtn.setAttribute("style", "font-size: 30px;");
                tool.appendChild(name);
                tool.appendChild(removeBtn);
                document.getElementById("add_tool").previousElementSibling.insertAdjacentElement('afterend', tool);
            };

            $('.removeStep').click(function () {
                $(this).parent().parent().parent().remove();
                $('.recipe_create_form_step_counter').each((index, el) => {
                    $(el).text('Step ' + (index + 1));
                });
            });
            
            $('.removeSupply').click(function () {
                $(this).parent().remove();
            });
        </script>
    </body>
</html>
