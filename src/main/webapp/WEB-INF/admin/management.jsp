<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Management - BakeNow</title>
        <link rel="stylesheet" type="text/css" href="assets/css/admin/management.css">
    </head>
    <body>
        <%@include file="/WEB-INF/common/header.jsp"%>
        <div class="main-container d-flex">
            <aside class="sidebar col-3">
                <div class="d-flex justify-content-center">
                    <div class="col-9 d-flex" style="height: 100px; border: 1px solid #D9D9D9; background-color: #fff;">
                        <div class="col-3 d-flex align-items-center justify-content-center">
                            <img src="${sessionScope.LOGIN_USER.avatarUrl}" style="width: 60px; height: 60px; border-radius: 50px;"/>
                        </div>
                            <span class="col-9 d-flex align-items-center" style="font-size: 22px; padding-left: 10px;">${sessionScope.LOGIN_USER.displayName}</span>
                    </div>
                </div>
                <div class="tablinks" onclick="openTab(event, 'requests')" id="defaultOpenTab">
                    <div class="tab-title col-9">
                        <div class="d-flex align-items-center" style="height: 100%; padding-left: 30px;">Approval Requests</div>
                    </div>
                </div>
                <c:if test="${sessionScope.LOGIN_USER.roleId == 0}">
                    <div class="tablinks" onclick="openTab(event, 'users')">
                        <div class="tab-title col-9">
                            <div class="d-flex align-items-center" style="height: 100%; padding-left: 30px;">Users</div>
                        </div>
                    </div>
                    <div class="tablinks" onclick="openTab(event, 'orders')">
                        <div class="tab-title col-9">
                            <div class="d-flex align-items-center" style="height: 100%; padding-left: 30px;">Orders</div>
                        </div>
                    </div>
                </c:if>
            </aside>
            <main class="col-9" style="margin: 50px 0;">
                <div id="requests" class="tabcontent">
                    <div class="subtab">
                        <button class="subtablinks subtab-title" onclick="openSubTab(event, 'recipes')" id="defaultOpenSubTab">
                            Recipes
                        </button>
                        <button class="subtablinks subtab-title" onclick="openSubTab(event, 'products')">
                            Products
                        </button>
                    </div>
                    <div id="recipes" class="subtabcontent">
                        <c:forEach var="recipe" items="${sessionScope.RECIPE_LIST}"> 
                            <c:if test="${recipe.statusId == 0}">
                                <div class="card my-3">
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
                                                            <a href="MainController?action=NavToViewUser&userId=${recipe.authorId}">${recipe.authorName}</a>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="row recipe_desc my-" style="height: 80px; overflow: hidden; text-overflow: ellipsis;">
                                                    ${recipe.desc}
                                                </div>
                                                <div class="row d-flex align-items-center my-2">
                                                    <div class="recipe_time col-10 p-0"><small class="text-muted">${recipe.createTime}</small></div>
                                                    <a class="col-2 see_detail_btn" href="MainController?action=ViewRecipe&recipeId=${recipe.id}">See details</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div id="products" class="subtabcontent">
                        <c:forEach var="recipe" items="${sessionScope.RECIPE_LIST}"> 
                            <c:if test="${recipe.statusId == 0 && recipe.authorId == sessionScope.LOGIN_USER.id}">
                                <div class="card my-3">
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
                                                            <a href="${toViewProfile}">${recipe.authorName}</a>
                                                        </p>
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
                        </c:forEach>
                    </div>
                </div>
                <div id="users" class="tabcontent">
                    List users
                </div>
                <div id="orders" class="tabcontent">
                    <c:forEach var="order" items="${sessionScope.ORDER_LIST}"> 
                        <div class="my-3 px-3 py-1" style="background-color: #fff; border: 1px solid #D9D9D9; border-radius: 5px;">
                            <div class="d-flex justify-content-center" style="border-bottom: 1px solid #D9D9D9; height: 50px;">
                                <div class="col-8 d-flex align-items-center">Order number: ${order.orderNumber}</div>
                                <div class="col-4 d-flex justify-content-end align-items-center">${order.createTime}</div>
                            </div>
                            <c:forEach var="orderItem" items="${order.orderItems}">
                                <div class="d-flex align-items-center" style="height: 180px; border-bottom: 1px solid #D9D9D9;">
                                    <div class="col-3 d-flex justify-content-center align-items-center">
                                        <div>
                                            <img src="${orderItem.productImgUrl}" style="width: 160px; height: 160px" alt="alt"/>
                                        </div>
                                    </div>
                                    <div class="col-7">
                                        <div class="d-flex align-items-center" style="height: 50px; font-size: 20px;">
                                            <i class="bi bi-shop"></i>
                                            <span style="padding-left: 10px;">${orderItem.shopName}</span>
                                        </div>
                                        <div style="height: 100px; font-size: 22px; font-weight: bold;">${orderItem.productName}</div>
                                        <div style="height: 30px;"> x ${orderItem.orderQuantity}</div>
                                    </div>
                                    <div class="col-2 d-flex justify-content-end align-items-center">
                                        <div>
                                            $${orderItem.price}
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div>
                                <div>
                                    <div class="d-flex justify-content-end" style="margin: 10px 0;">Total: $${order.total}</div>
                                    <div class="d-flex justify-content-end" style="margin: 10px 0";>
                                        <button type="button" onclick="window.location.href = 'MainController?action=CancelOrder&orderId='"
                                                style="height: 45px; width: 100px; border: 1px solid #56D262; border-radius: 50px;">
                                            Cancel
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </main>
        </div>
        <%@include file="/WEB-INF/common/footer.jsp"%>
        <script>
            /*Making tab for sidebar*/
            function openTab(evt, tabName) {
                // Declare all variables
                var i, tabcontent, tablinks;

                // Get all elements with class="tabcontent" and hide them
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }

                // Get all elements with class="tablinks" and remove the class "active"
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace("active", "");
                }

                // Show the current tab, and add an "active" class to the button that opened the tab
                document.getElementById(tabName).style.display = "block";
                evt.currentTarget.className += " active";
            }

            // Get the element with id="defaultOpen" and click on it
            document.getElementById("defaultOpenTab").click();


            /*Making tab for approval request table*/
            function openSubTab(evt, subtabName) {
                // Declare all variables
                var i, subtabcontent, subtablinks;

                // Get all elements with class="tabcontent" and hide them
                subtabcontent = document.getElementsByClassName("subtabcontent");
                for (i = 0; i < subtabcontent.length; i++) {
                    subtabcontent[i].style.display = "none";
                }

                // Get all elements with class="tablinks" and remove the class "active"
                subtablinks = document.getElementsByClassName("subtablinks");
                for (i = 0; i < subtablinks.length; i++) {
                    subtablinks[i].className = subtablinks[i].className.replace("active", "");
                }

                // Show the current tab, and add an "active" class to the button that opened the tab
                document.getElementById(subtabName).style.display = "block";
                evt.currentTarget.className += " active";
            }

            // Get the element with id="defaultOpen" and click on it
            document.getElementById("defaultOpenSubTab").click();


        </script>

    </body>
</html>
