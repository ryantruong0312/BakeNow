<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : profile
    Created on : 17 Oct 2022, 00:28:04
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${requestScope.USER.displayName}'s Profile - BakeNow</title>
    </head>
    <body>
        <div id="page_profile" class="main-container container">

            <div>
                <ul class="tab-nav">
                    <li class="tab-btn">
                        <p class="tab-btn_link"></p>
                    </li>
                    <li class="tab-btn"></li>
                    <li class="tab-btn"></li>
                    <li class="tab-btn"></li>
                </ul>
            </div>

            <div>
                <section id="tab1" class="tab-content">
                    <h1>My Profile</h1>
                    <%@include file="./profile-info.jsp" %>
                </section>

                <section id="tab2" class="tab-content">
                    <h1>My Recipes</h1>
                    <%@include file="./profile-recipes.jsp" %>
                </section>

                <section id="tab3" class="tab-content">
                    <h1>My Orders</h1>
                    <%@include file="./profile-shoppinglist.jsp" %>
                </section>

                <section id="tab4" class="tab-content">
                    <h1>My Shopping List</h1>
                    <%@include file="./profile-orders.jsp" %>
                </section>
            </div>
        </div>
    </body>
</html>
