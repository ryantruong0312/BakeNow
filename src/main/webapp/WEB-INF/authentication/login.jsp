<%-- 
    Document   : login
    Created on : 30 Sept 2022, 20:12:09
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - BakeNow</title>
        <link rel="stylesheet" href="assets/css/authentication/login.css">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </head>
    <body>
        <c:url var="toBlogHome" value="MainController?action=NavToBlogHome"/>
        <c:url var="toRegister" value="MainController?action=NavToRegister"/>
        <header style="background-color: #56D262; height: 120px;">
            <div style="width:1440px; margin:0 auto;">
                <a href="${toBlogHome}" aria-label="home" class="col-2 d-flex justify-content-left align-items-center">
                    <img src="assets/img/logo.png" height="100" width="250" alt="BakeNow logo"/>
                </a>
            </div>
        </header>
        <div class="subheader" style="width:100%; height:180px; margin:0 auto; background-image: url('assets/img/subheader.jpg'); background-size:cover;"></div>
        <div class="main-container">
            <div class="loginform_container">
                <div class="page_title">Sign In</div>
                <form method="post" class="login_form" action="MainController">
                    <label>User name</label>
                    <input name="username" type="text">
                    <label>Password</label>
                    <input name="password" type="password">
                    <div class="loginError" >
                        <c:if test="${requestScope.ERROR == null}">
                            <br>
                        </c:if>
                        ${requestScope.ERROR}
                    </div>
                    <input class="login_btn" type="submit" name="action" value="Login">

                    <div class="register_link" style="text-align: center; margin: 20px 0;">
                        Don't have an account? <a href="${toRegister}">Register now</a>
                    </div>
                </form>
            </div>
        </div>
        <%@include file="/WEB-INF/common/footer.jsp"%>
    </body>
</html>
