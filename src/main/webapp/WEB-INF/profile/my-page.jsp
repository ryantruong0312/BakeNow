<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${sessionScope.LOGIN_USER.displayName}'s Profile - BakeNow</title>
        <link rel="stylesheet" type="text/css" href="assets/css/profile/my-page.css">
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
                <div class="tablinks" onclick="openTab(event, 'profile')" <c:if test="${param.returnFromCancel != 1}">id="defaultOpenTab" </c:if>>
                        <div class="tab-title col-9">
                            <div  class="d-flex align-items-center" style="height: 100%; padding-left: 30px;">Profile</div>
                        </div>
                    </div>
                <c:if test="${sessionScope.LOGIN_USER.roleId == 2 || sessionScope.LOGIN_USER.roleId == 3}">
                    <div class="tablinks" onclick="openTab(event, 'recipes')">
                        <div class="tab-title col-9">
                            <div class="d-flex align-items-center" style="height: 100%; padding-left: 30px;">Recipes</div>
                        </div>
                    </div>
                    <c:if
                        test="${sessionScope.LOGIN_USER.roleId == 2}">
                        <div class="tablinks" onclick="openTab(event, 'orders')" <c:if test="${param.returnFromCancel == 1}">id="defaultOpenTab" </c:if>>
                            <div class="tab-title col-9">
                                <div class="d-flex align-items-center" style="height: 100%; padding-left: 30px;">Orders</div>
                            </div>
                        </div>
                        <div class="tablinks" onclick="openTab(event, 'to-do')">
                            <div class="tab-title col-9">
                                <div class="d-flex align-items-center" style="height: 100%; padding-left: 30px;">To-do List</div>
                            </div>
                        </div>
                    </c:if>
                </c:if>
            </aside>
            <main class="col-9" style="margin: 50px 0;">
                <div id="profile" class="tabcontent">
                    <form action="MainController" class="edit-profile-form">
                        <div class="d-flex">
                            <div class="col-4 px-2">
                                <div style="text-align: center; margin-bottom: 20px;">
                                    <img src="${sessionScope.LOGIN_USER.avatarUrl}" style="width: 200px; height: 200px; border-radius: 100px;"/>
                                </div>
                                <input class="textfield" type="text" style="width: 100%;" name="avatarUrl" value="${sessionScope.LOGIN_USER.avatarUrl}"/>
                            </div>
                            <div class="col-8 px-3">
                                <div class="info-title">Username</div>
                                <input type="text" class="textfield" name="username" value="${sessionScope.LOGIN_USER.username}" disabled style="background-color: #D9D9D9"; />
                                <div class="info-title">Bio</div>
                                <textarea type="text" name="bio" placeholder="Tell something about yourself ...">${sessionScope.LOGIN_USER.bio}</textarea>
                            </div>
                        </div>
                        <div class="d-flex">
                            <div class="col-6 px-2">
                                <div class="info-title">Display name</div>
                                <input type="text" class="textfield" name="displayName" value="${sessionScope.LOGIN_USER.displayName}"/>
                                <div class="info-title">Account role</div>
                                <c:choose>
                                    <c:when test="${LOGIN_USER.roleId == 0}">
                                        <c:set var="roleName" value="Administrator"></c:set>
                                    </c:when>
                                    <c:when test="${LOGIN_USER.roleId == 1}">
                                        <c:set var="roleName" value="Moderator"></c:set>
                                    </c:when>
                                    <c:when test="${LOGIN_USER.roleId == 2}">
                                        <c:set var="roleName" value="Baker"></c:set>
                                    </c:when>
                                    <c:when test="${LOGIN_USER.roleId == 3}">
                                        <c:set var="roleName" value="Retailer"></c:set>
                                    </c:when>
                                </c:choose>

                                <input type="text" class="textfield" name="roleName" value="${roleName}" disabled style="background-color: #D9D9D9"/>
                                <input type="hidden" class="textfield" name="roleId" value="${sessionScope.LOGIN_USER.roleId}"/>
                                <div class="info-title">Phone</div>
                                <input type="phone" class="textfield" name="phone" value="${sessionScope.LOGIN_USER.phone}"/>
                            </div>
                            <div class="col-6 px-3">
                                <div class="info-title">Date of birth</div>
                                <input type="date" class="textfield" name="dob" value="${sessionScope.LOGIN_USER.dob}"/>
                                <div class="info-title">Email</div>
                                <input type="email" class="textfield" name="email" value="${sessionScope.LOGIN_USER.email}"/>
                                <div class="info-title">Address</div>
                                <input type="text" class="textfield" name="address" value="${sessionScope.LOGIN_USER.address}"/>
                            </div>
                        </div>
                        <div style="text-align: center; margin: 20px; font-weight: bold;">
                            Member since ${sessionScope.LOGIN_USER.createTime}
                        </div>
                        <div class="d-flex justify-content-end">
                            <input type="hidden" name="userId" value="${sessionScope.LOGIN_USER.id}">
                            <input type="submit" style="width: 180px;" name="action" value="Save information">
                        </div>
                    </form>
                </div>
                <div id="recipes" class="tabcontent">
                    <div class="subtab">
                        <button class="subtablinks subtab-title" onclick="openSubTab(event, 'published')" id="defaultOpenSubTab">
                            Published
                        </button>
                        <button class="subtablinks subtab-title" onclick="openSubTab(event, 'pending')">
                            Pending
                        </button>
                        <button class="subtablinks subtab-title" onclick="openSubTab(event, 'restricted')">
                            Restricted
                        </button>
                    </div>
                    <div id="published" class="subtabcontent">
                        <c:forEach var="recipe" items="${sessionScope.RECIPE_LIST}"> 
                            <c:if test="${recipe.statusId == 1 && recipe.authorId == sessionScope.LOGIN_USER.id}">
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
                    <div id="restricted" class="subtabcontent">
                        <c:forEach var="recipe" items="${sessionScope.RECIPE_LIST}"> 
                            <c:if test="${recipe.statusId == 2 && recipe.authorId == sessionScope.LOGIN_USER.id}">
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
                                                    <div class="recipe_time col-2 p-0"><small class="text-muted">${recipe.restrictionTime}</small></div>
                                                    <div class="restrict_reason col-8 p-0" style="color: red;">${recipe.restrictionReason}</div>
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
                            <button class="subtablinks2 subtab-title" onclick="openSubTab2(event, 'pendingOrder')" id="defaultOpenSubTab2">
                                Pending
                            </button>
                            <button class="subtablinks2 subtab-title" onclick="openSubTab2(event, 'intransit')">
                                In Transit
                            </button>
                            <button class="subtablinks2 subtab-title" onclick="openSubTab2(event, 'delivered')">
                                Delivered
                            </button>
                            <button class="subtablinks2 subtab-title" onclick="openSubTab2(event, 'cancelled')">
                                Cancelled
                            </button>
                        </div>
                        <div id="pendingOrder" class="subtabcontent2">

                        <c:forEach var="order" items="${sessionScope.ORDER_LIST}"> 
                            
                            <c:if test="${order.buyerId == sessionScope.LOGIN_USER.id && order.statusId == 0}">
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
                                                <button type="button" onclick="window.location.href = 'MainController?action=CancelOrder&orderId=${order.orderId}'"
                                                        style="height: 45px; width: 100px; border: 1px solid #56D262; border-radius: 50px;">
                                                    Cancel
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div id="intransit" class="subtabcontent2">
                        <c:forEach var="order" items="${sessionScope.ORDER_LIST}"> 
                            <c:if test="${order.buyerId == sessionScope.LOGIN_USER.id && order.statusId == 1}">
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
                            <c:if test="${order.buyerId == sessionScope.LOGIN_USER.id && order.statusId == 2}">
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
                                            <div class="col-2">
                                                <div class="d-flex align-items-end justify-content-end" style="height: 100px;">
                                                    $${orderItem.price}
                                                </div>
                                                <div class="d-flex justify-content-end" style="margin: 10px 0";>
                                                    <button type="button" onclick="window.location.href = 'MainController?action=RateOrder&orderId=${orderItem.orderId}'"
                                                            style="height: 45px; width: 130px; border: 1px solid #56D262; border-radius: 50px;">
                                                        Rate product
                                                    </button>
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
                            <c:if test="${order.buyerId == sessionScope.LOGIN_USER.id && order.statusId == 3}">
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
                                                <button type="button" onclick="window.location.href = 'MainController?action=ReOrder&orderId='"
                                                        style="height: 45px; width: 100px; border: 1px solid #56D262; border-radius: 50px;">
                                                    Re-order
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div id="to-do" class="tabcontent">
                    1648435
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

            function openCancelPopup() {
                document.getElementById("confirm-cancel-order-popup").style.display = "block";
            }
        </script>

    </body>
</html>
