<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${USER.displayName}'s Profile - BakeNow</title>
        <link rel="stylesheet" type="text/css" href="assets/css/profile/user-view.css">
    </head>
    <body>
        <%@include file="/WEB-INF/common/header.jsp"%>
        <div id="page_profile" class="main-container d-flex">
            <aside class="sidebar col-3">
                <div class="d-flex justify-content-center">
                    <div class="col-9 d-flex" style="height: 100px; border: 1px solid #D9D9D9; background-color: #fff;">
                        <div class="col-3 d-flex align-items-center justify-content-center">
                            <img src="${USER.avatarUrl}" style="width: 60px; height: 60px; border-radius: 50px;"/>
                        </div>
                        <span class="col-9 d-flex align-items-center" style="font-size: 22px; padding-left: 10px;">${USER.displayName}</span>
                    </div>
                </div>
                <div class="tablinks" onclick="openTab(event, 'profile')" id="defaultOpenTab">
                    <div class="tab-title col-9">
                        <div  class="d-flex align-items-center" style="height: 100%; padding-left: 30px;">Profile</div>
                    </div>
                </div>
                <c:if test="${USER.roleId == 2 || USER.roleId == 3}">
                    <div class="tablinks" onclick="openTab(event, 'recipes')">
                        <div class="tab-title col-9">
                            <div class="d-flex align-items-center" style="height: 100%; padding-left: 30px;">Recipes</div>
                        </div>
                    </div>
                </c:if>
                        <c:if test="${sessionScope.LOGIN_USER.roleId == 0 || USER.roleId == 1}">
                    <div class="tablinks" onclick="openTab(event, 'orders')">
                        <div class="tab-title col-9">
                            <div class="d-flex align-items-center" style="height: 100%; padding-left: 30px;">Orders</div>
                        </div>
                    </div>
                </c:if>
            </aside>
            <main class="col-9" style="margin: 50px 0;">
                <div id="profile" class="tabcontent">
                    <div class="d-flex">
                        <div class="col-4 px-2 d-flex justify-content-center align-items-center">
                            <div style="text-align: right; margin-bottom: 20px;">
                                <img src="${USER.avatarUrl}" style="width: 200px; height: 200px; border-radius: 100px;"/>
                            </div>
                        </div>
                        <div class="col-8 px-3">
                            <div class="info-title">Bio</div>
                            <div style="margin-bottom: 10px;">${USER.bio}</div>
                            <div class="info-title">Birthday</div>
                            <div style="margin-bottom: 10px;">${USER.dob}</div>
                            <div class="info-title">Phone</div>
                            <div style="margin-bottom: 10px;"> ${USER.phone}</div>
                            <div class="info-title">Email</div>
                            <div style="margin-bottom: 10px;">${USER.email}</div>
                            <div class="info-title">Address</div>
                            <div style="margin-bottom: 10px;">${USER.address}</div>
                        </div>
                    </div>
                    <div style="text-align: right; margin: 20px; font-weight: bold;">
                        Member since ${USER.createTime}
                    </div>
                </div>
                <c:if test="${sessionScope.LOGIN_USER.roleId == 0 || sessionScope.LOGIN_USER.roleId == 1}">
                    <div id="recipes" class="tabcontent">
                        <div class="subtab">
                            <button class="subtablinks" onclick="openSubTab(event, 'published')" id="defaultOpenSubTab">
                                Published
                            </button>
                            <button class="subtablinks" onclick="openSubTab(event, 'pending')">
                                Pending
                            </button>
                            <button class="subtablinks" onclick="openSubTab(event, 'restricted')">
                                Restricted
                            </button>
                        </div>
                        <div id="published" class="subtabcontent">
                            <c:forEach var="recipe" items="${sessionScope.RECIPE_LIST}"> 
                                <c:if test="${recipe.statusId == 1 && recipe.authorId == USER.id}">
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
                            </c:forEach>
                        </div>
                        <div id="pending" class="subtabcontent">
                            <c:forEach var="recipe" items="${sessionScope.RECIPE_LIST}"> 
                                <c:if test="${recipe.statusId == 0 && recipe.authorId == USER.id}">
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
                        <div id="restricted" class="subtabcontent">
                            <c:forEach var="recipe" items="${sessionScope.RECIPE_LIST}"> 
                                <c:if test="${recipe.statusId == 2 && recipe.authorId == USER.id}">
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
                                                        <div class="col-2 p-0 d-flex justify-content-center">
                                                            <button class="button button-like">
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
                            </c:forEach>
                        </div>
                    </div>
                        <div id="orders" class="tabcontent">
                            <div class="subtab2">
                                <button class="subtablinks2" onclick="openSubTab2(event, 'pendingOrder')" id="defaultOpenSubTab2">
                                    Pending
                                </button>
                                <button class="subtablinks2" onclick="openSubTab2(event, 'awaiting')">
                                    Awaiting Pickup
                                </button>
                                <button class="subtablinks2" onclick="openSubTab2(event, 'intransit')">
                                    In Transit
                                </button>
                                <button class="subtablinks2" onclick="openSubTab2(event, 'delivered')">
                                    Delivered
                                </button>
                                <button class="subtablinks2" onclick="openSubTab2(event, 'cancelled')">
                                    Cancelled
                                </button>
                            </div>
                            <div id="pendingOrder" class="subtabcontent2">
                                <c:forEach var="order" items="${sessionScope.ORDER_LIST}"> 
                                    <c:if test="${order.buyerId == USER.id && order.statusId == 0}">
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
                                                <div class="d-flex justify-content-end" style="margin: 10px 0;">Total: $${order.total}</div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div id="awaiting" class="subtabcontent2">
                                <c:forEach var="order" items="${sessionScope.ORDER_LIST}"> 
                                    <c:if test="${order.buyerId == USER.id && order.statusId == 1}">
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
                                                <div class="d-flex justify-content-end" style="margin: 10px 0;">Total: $${order.total}</div>

                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div id="intransit" class="subtabcontent2">
                                <c:forEach var="order" items="${sessionScope.ORDER_LIST}"> 
                                    <c:if test="${order.buyerId == USER.id && order.statusId == 2}">
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
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div id="delivered" class="subtabcontent2">
                                <c:forEach var="order" items="${sessionScope.ORDER_LIST}"> 
                                    <c:if test="${order.buyerId == USER.id && order.statusId == 3}">
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
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div id="cancelled" class="subtabcontent2">
                                <c:forEach var="order" items="${sessionScope.ORDER_LIST}"> 
                                    <c:if test="${order.buyerId == USER.id && order.statusId == 4}">
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
                                                <div class="d-flex justify-content-end" style="margin: 10px 0;">Total: $${order.total}</div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>
                    <!-- Guest/Baker/Retailer only see published recipes of a user -->
                    <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleId == 2 || sessionScope.LOGIN_USER.roleId == 3}">
                        <div id="recipes" class="tabcontent">
                            <c:forEach var="recipe" items="${sessionScope.RECIPE_LIST}"> 
                                <c:if test="${recipe.statusId == 1 && recipe.authorId == USER.id}">
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
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
            </main>
        </div>
        <%@include file="/WEB-INF/common/footer.jsp"%>
        <script>
            // Toggle vote button
            function toggleLikeButton(x) {
                x.classList.toggle("liked");
            }

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


            /*Making tab for recipe table*/
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

            /*Making tab for order table*/
            function openSubTab2(evt, subtabName) {
                // Declare all variables
                var i, subtabcontent, subtablinks;

                // Get all elements with class="tabcontent" and hide them
                subtabcontent = document.getElementsByClassName("subtabcontent2");
                for (i = 0; i < subtabcontent.length; i++) {
                    subtabcontent[i].style.display = "none";
                }

                // Get all elements with class="tablinks" and remove the class "active"
                subtablinks = document.getElementsByClassName("subtablinks2");
                for (i = 0; i < subtablinks.length; i++) {
                    subtablinks[i].className = subtablinks[i].className.replace("active", "");
                }

                // Show the current tab, and add an "active" class to the button that opened the tab
                document.getElementById(subtabName).style.display = "block";
                evt.currentTarget.className += " active";
            }

            // Get the element with id="defaultOpen" and click on it
            document.getElementById("defaultOpenSubTab2").click();
        </script>

    </body>
</html>
