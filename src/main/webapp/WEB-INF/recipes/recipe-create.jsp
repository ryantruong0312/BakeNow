<%-- 
    Document   : createRecipe
    Created on : Oct 12, 2022, 12:48:29 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/recipes/recipe-create.css">
        <title>Create a New Recipe - BakeNow</title>
    </head>
    <body>
        <%@include file="/WEB-INF/common/header.jsp"%>
        <div class="main-container py-3">
            <div class="create_recipe_container d-flex justify-content-center">
                <div class="create_recipe col-10">
                    <div class="col-10 create_recipe_page_title">
                        CREATE NEW RECIPE
                    </div>
                    <div class="d-flex justify-content-center my-3 py-3" style="background-color: #fff;">
                        <form action="" class="create_recipe_form col-10">
                            <div class="py-2" > 
                                <span style="font-size: 24px; font-weight: bold;">Title</span> <input type="text" style="width: 500px; padding-left: 10px;" name="title" placeholder="Choose a recipe title..." required="">
                            </div>
                            <div class="py-2" > 
                                <span style="font-size: 24px; font-weight: bold;">Time to make</span> <input type="number" style="width: 75px; padding-left: 10px;" name="cookTime" required="">
                            </div>
                            <div class="py-2 d-flex justify-content-center">
                                <div class="col-4 py-2">
                                    <image src="assets/img/blank_img.png" style="height: 256px; width: 256px; display: block; margin: 0 auto; border-radius: 5px;">
                                    <div style="text-align: center;">
                                        <input class="my-2 px-4" style="width: 300px; border: none;" type="file" name="img">
                                    </div>
                                </div>
                            </div>
                            <div class="py-2" > 
                                <div style="font-size: 24px; font-weight: bold;">Instruction</div>
                            </div>
                            <c:forEach var="m" begin="1" end="1">
                                <div class="recipe_create_form_step">
                                    <div style="font-size: 20px; padding-left: 10px">
                                        <span class="recipe_create_form_step_counter">Step ${m}</span>
                                    </div>
                                    <div class="d-flex">
                                        <textarea class="my-2 py-2 col-11" type="text" style=" padding-left: 10px; height: 150px;" name="stepContent" placeholder="Write an instruction..." required=""></textarea>
                                        <div class="col-1 d-flex justify-content-center align-items-center mx-3" style="font-size: 30px;">
                                            <i class="bi bi-dash-circle remove_step_btn"></i>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div id="add_step" class="my-2 supply_add_button">+ Add</div>
                            <div class="d-flex">
                                <div class="create_recipe_form_supply_ingredient col-7 my-4">
                                    <div style="font-size: 24px; font-weight: bold;">Ingredients</div>
                                    <div class="p-2 my-2" style="border: 1px solid #D9D9D9; border-radius: 5px;">
                                        <div class="d-flex">
                                            <div class="col-7 mx-1 d-flex justify-content-center" style="font-size: 20px;">Name</div>
                                            <div class="col-3 mx-1 d-flex justify-content-center" style="font-size: 20px;">Amount</div>
                                            <div class="col-2"></div>
                                        </div>
                                        <div class="d-flex ingredient-row">
                                            <input type="text" class="supply col-7 mx-1" style="padding-left: 10px;" name="ingredientName" placeholder="Ingredient name..." required="">
                                            <input type="text" class="supply col-3 mx-1" style="padding-left: 10px;" name="ingredientAmount" placeholder="..." required="">
                                            <div class="col-2 d-flex justify-content-center align-items-center" style="font-size: 30px;">
                                                <i class="bi bi-dash-circle remove_ingredient_btn"></i>
                                            </div>
                                        </div>
                                        <div id="add_ingredient" class="mx-1 my-2 supply_add_button">+ Add</div>
                                    </div>
                                </div>
                                <div class="create_recipe_form_supply_tool col-5 my-4 mx-2">
                                    <div style="font-size: 24px; font-weight: bold;">Tools</div>
                                    <div class="p-2 my-2" style="border: 1px solid #D9D9D9; border-radius: 5px;">
                                        <div class="col-10 mx-1 d-flex justify-content-center" style="font-size: 20px;">Name</div>
                                        <div class="d-flex tool-row">
                                            <input type="text" class="supply col-10 mx-1" style="padding-left: 10px;" name="toolName" placeholder="Tool name..." required="">
                                            <div class="col-2 d-flex justify-content-center align-items-center" style="font-size: 30px;">
                                                <i class="bi bi-dash-circle remove_tool_btn"></i>
                                            </div>
                                        </div>
                                        <div id="add_tool" class="mx-1 my-2 supply_add_button">+ Add</div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end">
                                <input class="last_button mx-2" type="submit" name="action" value="Create">
                                <a class="last_button" style="padding-top: 5px;" href="">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/common/footer.jsp"%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            var count = 1;
            //Add new step
            document.getElementById("add_step").onclick = () => {
                var step = document.createElement('div');
                step.setAttribute("class", "recipe_create_form_step");

                var div = document.createElement('div');
                div.setAttribute("style", "font-size: 20px; padding-left: 10px;");

                var counter = document.createElement('span');
                counter.setAttribute("class", "recipe_create_form_step_counter");
                

                div.appendChild(counter);

                var stepRow = document.createElement('div');
                stepRow.setAttribute("class", "d-flex");
                var content = document.createElement('textarea');
                content.setAttribute("class", "my-2 py-2 col-11");
                content.setAttribute("type", "text");
                content.setAttribute("style", "padding-left: 10px; height: 150px;");
                content.setAttribute("name", "stepContent");
                content.setAttribute("placeholder", "Write an instruction...");
                content.setAttribute("required", "");

                var removeButton = document.createElement('div');
                removeButton.setAttribute("class", "col-1 d-flex justify-content-center align-items-center mx-3");
                removeButton.setAttribute("style", "font-size: 30px;");
                var i = document.createElement('i');
                i.setAttribute("class", "bi bi-dash-circle remove_step_btn");
                removeButton.appendChild(i);

                stepRow.appendChild(content);
                stepRow.appendChild(removeButton);

                step.appendChild(div);
                step.appendChild(stepRow);

                document.getElementById("add_step").insertAdjacentElement('beforebegin', step);

                $('.recipe_create_form_step_counter').each((index, el) => {
                    $(el).text('Step ' + (index + 1));
                });
            };

            //Add new ingredient
            document.getElementById("add_ingredient").onclick = () => {
                var ingredientRow = document.createElement('div');
                ingredientRow.setAttribute("class", "d-flex ingredient-row my-2");
                var ingredient = document.createElement('input');
                ingredient.setAttribute("class", "supply col-7 mx-1");
                ingredient.setAttribute("type", "text");
                ingredient.setAttribute("style", "padding-left: 10px;");
                ingredient.setAttribute("name", "ingredientName");
                ingredient.setAttribute("placeholder", "Ingredient name...");
                ingredient.setAttribute("required", "");
                ingredientRow.appendChild(ingredient);
                var amount = document.createElement('input');
                amount.setAttribute("class", "supply col-3 mx-1");
                amount.setAttribute("type", "text");
                amount.setAttribute("style", "padding-left: 10px;");
                amount.setAttribute("name", "ingredientAmount");
                amount.setAttribute("placeholder", "...");
                amount.setAttribute("required", "");
                ingredientRow.appendChild(amount);

                var removeButton = document.createElement('div');
                removeButton.setAttribute("class", "col-2 d-flex justify-content-center align-items-center");
                removeButton.setAttribute("style", "font-size: 30px;");
                var i = document.createElement('i');
                i.setAttribute("class", "bi bi-dash-circle");
                removeButton.appendChild(i);
                ingredientRow.appendChild(removeButton);

                document.getElementById("add_ingredient").insertAdjacentElement('beforebegin', ingredientRow);
            };

            //Add new tool
            document.getElementById("add_tool").onclick = () => {
                var toolRow = document.createElement('div');
                toolRow.setAttribute("class", "d-flex tool-row my-2");
                var tool = document.createElement('input');
                tool.setAttribute("class", "supply col-10 mx-1");
                tool.setAttribute("type", "text");
                tool.setAttribute("style", "padding-left: 10px;");
                tool.setAttribute("name", "toolName");
                tool.setAttribute("placeholder", "Tool name...");
                tool.setAttribute("required", "");
                toolRow.appendChild(tool);

                var removeButton = document.createElement('div');
                removeButton.setAttribute("class", "col-2 d-flex justify-content-center align-items-center");
                removeButton.setAttribute("style", "font-size: 30px;");
                var i = document.createElement('i');
                i.setAttribute("class", "bi bi-dash-circle");
                removeButton.appendChild(i);
                toolRow.appendChild(removeButton);

                document.getElementById("add_tool").insertAdjacentElement('beforebegin', toolRow);

            };

            //Remove step
            $('.remove_step_btn').click(function () {
                $(this).closest('.recipe_create_form_step').remove();
            });
            
            //Remove ingredient
            $('.remove_ingredient_btn').click(function () {
                $(this).closest('.ingredient-row').remove();
            });
            
            //Remove tool
            $('.remove_tool_btn').click(function () {
                $(this).closest('.tool-row').remove();
            });
        </script>

    </body>
</html>