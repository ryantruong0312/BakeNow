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
                                <span style="font-size: 24px; font-weight: bold;">Title</span> <input type="text" style="width: 500px; padding-left: 10px;" name="title" required="" value="${param.RECIPE.title}Bánh Cupcake Nho Khô">
                            </div>
                            <div class="py-2" > 
                                <span style="font-size: 24px; font-weight: bold;">Time to make</span> <input type="number" style="width: 75px; padding-left: 10px;" name="cookTime" required="" value="${param.RECIPE.timeToCook}35">
                            </div>
                            <div class="py-2 d-flex justify-content-center">
                                <div class="col-4 py-2">
                                    <image src="${param.RECIPE.imgUrl}assets/img/img_10.png" style="height: 256px; width: 256px; display: block; margin: 0 auto; border-radius: 5px;">
                                    <div style="text-align: center;">
                                        <input class="my-2 px-4" style="width: 300px; border: none;" type="file" name="img">
                                    </div>
                                </div>
                            </div>
                            <div class="py-2" > 
                                <div style="font-size: 24px; font-weight: bold;">Instruction</div>
                            </div>
                            <c:forEach var="m" begin="1" end="${param.RECIPE.stepCount}3">
                                <div class="recipe_edit_form_step">

                                    <div style="font-size: 20px; padding-left: 10px">
                                        <span class="recipe_create_form_step_counter">Step ${m}</span>
                                    </div>
                                    <textarea class="my-2 py-2" type="text" style=" padding-left: 10px; width: 100%; height: 150px;" name="title" value="" required=""></textarea>
                                </div>
                            </c:forEach>
                            <div id="add_step" class="my-2 supply_add_button">+ Add</div>
                            <div class="d-flex">
                                <div class="edit_recipe_form_supply_ingredient col-7 my-4">
                                    <div style="font-size: 24px; font-weight: bold;">Ingredients</div>
                                    <div class="p-2 my-2" style="border: 1px solid #D9D9D9; border-radius: 5px;">
                                        <div class="d-flex">
                                            <div class="col-7 mx-1 d-flex justify-content-center" style="font-size: 20px;">Name</div>
                                            <div class="col-3 mx-1 d-flex justify-content-center" style="font-size: 20px;">Quantity</div>
                                            <div class="col-2"></div>
                                        </div>
                                        <div class="d-flex">
                                            <input type="text" class="supply col-7 mx-1" style="padding-left: 10px;" name="ingredientName" placeholder="Ingredient name..." required="">
                                            <input type="text" class="supply col-3 mx-1" style="padding-left: 10px;" name="ingredientQuantity" placeholder="..." required="">
                                            <a class="col-2 d-flex justify-content-center align-items-center"><svg width="30" height="30" viewBox="0 0 42 41" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <g opacity="0.35">
                                                <path d="M21 38.4375C16.1266 38.4375 11.4529 36.5477 8.00691 33.1837C4.56093 29.8198 2.625 25.2573 2.625 20.5C2.625 15.7427 4.56093 11.1802 8.00691 7.81627C11.4529 4.45234 16.1266 2.5625 21 2.5625C25.8734 2.5625 30.5471 4.45234 33.9931 7.81627C37.4391 11.1802 39.375 15.7427 39.375 20.5C39.375 25.2573 37.4391 29.8198 33.9931 33.1837C30.5471 36.5477 25.8734 38.4375 21 38.4375ZM21 41C26.5695 41 31.911 38.8402 35.8492 34.9957C39.7875 31.1512 42 25.9369 42 20.5C42 15.0631 39.7875 9.84881 35.8492 6.00431C31.911 2.15982 26.5695 0 21 0C15.4305 0 10.089 2.15982 6.15076 6.00431C2.21249 9.84881 0 15.0631 0 20.5C0 25.9369 2.21249 31.1512 6.15076 34.9957C10.089 38.8402 15.4305 41 21 41Z" fill="black"/>
                                                <rect x="11" y="20" width="20" height="2.5" rx="1.25" fill="black"/>
                                                </g>
                                                </svg>
                                            </a>
                                        </div>
                                        <div class="mx-1 my-2 supply_add_button">+ Add</div>
                                    </div>
                                </div>
                                <div class="edit_recipe_form_supply_tool col-5 my-4 mx-2">
                                    <div style="font-size: 24px; font-weight: bold;">Tools</div>
                                    <div class="p-2 my-2" style="border: 1px solid #D9D9D9; border-radius: 5px;">
                                        <div class="col-10 mx-1 d-flex justify-content-center" style="font-size: 20px;">Name</div>
                                        <div class="d-flex">
                                            <input type="text" class="supply col-10 mx-1" style="padding-left: 10px;" name="toolName" placeholder="Tool name..." required="">
                                            <a class="col-2 d-flex justify-content-center align-items-center"><svg width="30" height="30" viewBox="0 0 42 41" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <g opacity="0.35">
                                                <path d="M21 38.4375C16.1266 38.4375 11.4529 36.5477 8.00691 33.1837C4.56093 29.8198 2.625 25.2573 2.625 20.5C2.625 15.7427 4.56093 11.1802 8.00691 7.81627C11.4529 4.45234 16.1266 2.5625 21 2.5625C25.8734 2.5625 30.5471 4.45234 33.9931 7.81627C37.4391 11.1802 39.375 15.7427 39.375 20.5C39.375 25.2573 37.4391 29.8198 33.9931 33.1837C30.5471 36.5477 25.8734 38.4375 21 38.4375ZM21 41C26.5695 41 31.911 38.8402 35.8492 34.9957C39.7875 31.1512 42 25.9369 42 20.5C42 15.0631 39.7875 9.84881 35.8492 6.00431C31.911 2.15982 26.5695 0 21 0C15.4305 0 10.089 2.15982 6.15076 6.00431C2.21249 9.84881 0 15.0631 0 20.5C0 25.9369 2.21249 31.1512 6.15076 34.9957C10.089 38.8402 15.4305 41 21 41Z" fill="black"/>
                                                <rect x="11" y="20" width="20" height="2.5" rx="1.25" fill="black"/>
                                                </g>
                                                </svg>
                                            </a>
                                        </div>
                                        <div class="mx-1 my-2 supply_add_button">+ Add</div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end">
                                <input class="last_button mx-2" type="submit" name="action" value="Edit">
                                <a class="last_button" style="padding-top: 5px;" href="">Cancel</a>
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
                step.setAttribute("style", "font-size: 20px; padding-left: 10px; padding: 0;");
                var counter = document.createElement('span');
                counter.setAttribute("class", "recipe_create_form_step_counter");
                step.appendChild(counter);
                var content = document.createElement('textarea');
                content.setAttribute("class", "my-2 py-2");
                content.setAttribute("type", "text");
                content.setAttribute("style", "padding-left: 10px; width: 100%; height: 150px;");
                content.setAttribute("name", "step_content");
                content.setAttribute("placeholder", "Write an instruction...");
                content.setAttribute("required", "");
                step.appendChild(content);
                document.getElementById("add_step").previousElementSibling.insertAdjacentElement('afterend', step);

                $('.recipe_create_form_step_counter').each((index, el) => {
//                        $(el).css("background-color", "red");
                    $(el).text('Step ' + (index + 1));
                });
            };
        </script>
    </body>
</html>
