<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <c:url var="toHome" value="/"/>
    <c:url var="toCart" value="MainController?action=NavToCart"/>
    <c:url var="toLogin" value="MainController?action=NavToLogin"/>
    <c:url var="toRegister" value="MainController?action=NavToRegister"/>
    <c:url var="toBlogHome" value="MainController?action=NavToBlogHome"/>
    <c:url var="toMarketplace" value="MainController?action=NavToMarketplace"/>
    <c:url var="toProfile" value="MainController?action=NavToProfile"/>

    <div style="width:1440px; margin:0 auto;">
        <div class="row" style="height: 120px;">

            <!-- BRAND LOGO -->
            <a href="${toHome}" aria-label="home" class="col-2 d-flex justify-content-left align-items-center">
                <img src="assets/img/logo.png" height="100" width="250" alt="BakeNow logo"/>
            </a>

            <!-- SEARCH BAR -->
            <div class="col-6 py-2 d-flex justify-content-center align-items-center">
                <form class="mb-0" action="MainController">
                    <input type="text" class="py-1 recipe_search" style="width: 550px; padding-left:10px;" name="search" placeholder="Enter a recipe ...">
                    <input type="submit" class="py-1 recipe_search" name="action" value="Search" >
                </form>
            </div>

            <!-- NAV ICONS-->
            <nav class="col-2 py-2 d-flex justify-content-space-around align-items-center">
                <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 2}">
                    <a class="nav_icon" href="${pageScope.toCart}">
                        <i class="bi bi-basket"></i>
                    </a>
                </c:if>
                <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 3}">
                    <a id="nav_notification" class="nav_icon" data-bs-toggle="dropdown" data-bs-target="#notification-list">
                        <i class="bi bi-bell"></i>
                    </a>
                </c:if>
                <div class="dropdown-menu">
                    <%@include file="/WEB-INF/popup/notification-list.jsp" %>
                </div>
                <a class="nav_icon" data-bs-toggle="dropdown" aria-expanded="false">
                    <!--<img  src="assets/img/announcement_icon.png" alt="announcement icon" />-->
                    <i class="bi bi-megaphone"></i>
                </a>
                <div class="dropdown-menu">
                    <%@include file="/WEB-INF/popup/announcement-list.jsp" %>
                </div>




            </nav>

            <!-- ROLE ACTION -->
            <div class="col-2 d-flex justify-content-left align-items-center">
                <div class="py-1 px-2 d-flex" style="border: 1px solid #D9D9D9; border-radius: 5px; background-color: #f5f5f5;">
                    <a class="px-2" href="${pageScope.toLogin}">Login</a> |
                    <a class="px-2" href="${pageScope.toRegister}">Register</a>
                    <img src="assets/img/profile_icon.png" alt="profile icon" onclick="window.location.href = '${pageScope.toProfile}'" style="border:1px solid; cursor: pointer">
                </div>
            </div>
        </div>
    </div>
    <div style="width:100%; background-color:#F5F5F5">
        <div class="row align-items-center" style="width:100%; height:180px; margin:0 auto; background-image: url('assets/img/subheader.jpg'); background-size:cover;">
            <div class="row_subheader d-flex" style="justify-content:space-around">
                <button type="button" class="btn btn-outline-dark col-6 subheader" onclick="window.location.href = '${toBlogHome}';"
                        style="margin-left:30%;">RECIPES</button>
                <button type="button" class="btn btn-outline-dark col-6 subheader"  onclick="window.location.href = '${toMarketplace}';" 
                        style="margin-right:30%;">MARKETPLACE</button>
            </div>
        </div>
    </div>
</header>
