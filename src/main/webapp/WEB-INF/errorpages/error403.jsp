<%-- 
    Document   : 404
    Created on : 13 Oct 2022, 02:01:35
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>403 Forbidden</title>
    </head>
    <body>
        <%@include file="/WEB-INF/common/header.jsp"%>
        <div class="main-container container">
            <h1 class="error_title">403 Forbidden</h1>
            <h3>Unless you have some connections, that resource is not for you</h3>
            <c:url var="ToHome" value="/"/>
            <button onclick="window.location.href = ${pageScope.ToHome}">GO BACK TO HOME</button>
    <!--        Server Version: <%= application.getServerInfo() %><br>
            Servlet Version: <%= application.getMajorVersion() %>.<%= application.getMinorVersion() %>
            JSP Version: <%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %> <br>-->
        </div>
        <%@include file="/WEB-INF/common/footer.jsp"%>
    </body>
</html>
