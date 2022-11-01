<%-- 
    Document   : header-roleaction-guest
    Created on : 17 Oct 2022, 12:00:49
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-2 d-flex justify-content-left align-items-center">
    <div class="py-1 px-2 d-flex" style="border: 1px solid #D9D9D9; border-radius: 5px; background-color: #f5f5f5;">
        <a class="px-2" href="${pageScope.toLogin}">Login</a> |
        <a class="px-2" href="${pageScope.toRegister}">Register</a>
        <img src="assets/img/profile_icon.png" alt="profile icon" onclick="window.location.href = '${pageScope.toProfile}'" style="border:1px solid; cursor: pointer">
    </div>
</div>