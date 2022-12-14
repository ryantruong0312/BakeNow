<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <c:url var="toCart" value="MainController?action=NavToCart"/>
    <c:url var="toLogin" value="MainController?action=NavToLogin"/>
    <c:url var="toRegister" value="MainController?action=NavToRegister"/>
    <c:url var="toBlogHome" value="MainController?action=NavToBlogHome"/>
    <c:url var="toMarketplace" value="MainController?action=NavToMarketplace"/>
    <c:url var="toMyPage" value="MainController?action=NavToMyPage"/>
    <c:url var="toManagement" value="MainController?action=NavToManagement"/>
    <c:url var="toShop" value="MainController?action=NavToViewShopProfile"/>
    <c:url var="logout" value="MainController?action=Logout"/>

    <div style="width:1440px; margin:0 auto;">
        <div class="row" style="height: 120px;">

            <!-- BRAND LOGO -->
            <a href="${toBlogHome}" aria-label="home" class="col-2 d-flex justify-content-left align-items-center">
                <img src="assets/img/logo.png" height="100" width="250" alt="BakeNow logo"/>
            </a>

            <!-- SEARCH BAR -->
            <div class="col-7 py-2 d-flex justify-content-center align-items-center">
                <form class="mb-0 search_box" action="MainController">
                    <input type="text" class="py-1 recipe_search" style="width: 600px; padding-left:20px;" name="search" placeholder="Enter a recipe ..." value="${param.search}">
                    <input type="submit" class="py-1 recipe_search" name="action" value="Find" >
                </form>
            </div>

            <!-- NAV ICONS-->
            <nav class="col-1 py-2 d-flex justify-content-end align-items-center">
                <c:if test="${sessionScope['LOGIN_USER'] == null || sessionScope['LOGIN_USER'].roleId == 2}">
                    <a class="nav_icon" href="${pageScope.toCart}">
                        <i class="bi bi-cart3"></i>
                    </a>
                </c:if>
                <c:if test="${sessionScope['LOGIN_USER'].roleId == 2 || sessionScope['LOGIN_USER'].roleId == 3}">
                    <a id="nav_icon" class="nav_icon" data-bs-toggle="dropdown" data-bs-target="#notification-list">
                        <i class="bi bi-bell"></i>
                    </a>
                    <div class="dropdown-menu">
                        <%@include file="/WEB-INF/popup/notification-list.jsp" %>
                    </div>
                </c:if>

            </nav>

            <!-- ROLE ACTION -->
            <div class="col-2 d-flex justify-content-left align-items-center">
                <c:if test="${sessionScope.LOGIN_USER == null}">
                    <div class="authentication py-1 px-2 d-flex justify-content-center align-items-center" style="">
                        <a class="px-2" href="${pageScope.toLogin}">Login</a> |
                        <a class="px-2" href="${pageScope.toRegister}">Register</a>
                        <img src="assets/img/profile_icon.png"">
                    </div>
                </c:if>
                <c:if test="${sessionScope.LOGIN_USER != null}">
                    <div class="authentication dropdown-profile py-1 d-flex justify-content-center align-items-center">
                        <span class="col-9">${sessionScope.LOGIN_USER.displayName}</span>
                        <img class="col-3" src="${sessionScope.LOGIN_USER.avatarUrl}" alt="profile icon" style="width: 40px; height: 40px; border-radius: 50px;">
                        <div class="dropdown-profile-content">
                            <c:if test="${sessionScope.LOGIN_USER != null}">
                                <a href="${toMyPage}" class="account-nav">
                                    <i class="bi bi-person-square"></i>
                                    <span>My Page</span>
                                </a>
                            </c:if>
                            <c:if test="${sessionScope['LOGIN_USER'].roleId == 3}">   
                                <a href="MainController?action=NavToViewShopProfile&shopId=${sessionScope['LOGIN_SHOP'].id}" class="account-nav">
                                    <i class="bi bi-shop"></i>
                                    <span>My Shop</span>
                                </a>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_USER.roleId == 0 || sessionScope.LOGIN_USER.roleId == 1}">   
                                <a href="${toManagement}" class="account-nav">
                                    <i class="bi bi-clipboard-check"></i>
                                    <span>Management</span>
                                </a>
                            </c:if>
                            <a href="${logout}" class="account-nav">
                                <i class="bi bi-box-arrow-right" ></i>
                                <span>Log out</span>
                            </a>
                        </div>

                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <div style="width:100%;">
        <div class="row align-items-center" style="width:100%; height:150px; margin:0 auto; background-image: url('assets/img/subheader.jpg'); background-size:cover;">
            <div class="row_subheader d-flex" style="justify-content:space-around">
                <button type="button" class="btn btn-outline-dark col-6 subheader" onclick="window.location.href = '${toBlogHome}';"
                        style="margin-left:30%; border-radius: 50px;">RECIPES</button>
                <button type="button" class="btn btn-outline-dark col-6 subheader"  onclick="window.location.href = '${toMarketplace}';" 
                        style="margin-right:30%; border-radius: 50px;">MARKETPLACE</button>
            </div>
        </div>
    </div>
</header>
