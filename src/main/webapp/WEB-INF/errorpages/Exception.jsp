<%--
    Document   : Exception
    Created on : 13 Oct 2022, 02:43:26
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>An exception has occurred</title>
    </head>
    <body>
        <%@include file="/WEB-INF/common/header.jsp"%>
        <div class="main-container container">
            <h1 class="error_title">An Exception has occurred</h1>
            <h3>If you could spare some time, please send the error log below to the developers, and we'll hopefully look into it</h3>
            <%=exception.getMessage() %>
            Server Version: <%= application.getServerInfo() %><br>
            Servlet Version: <%= application.getMajorVersion() %>.<%= application.getMinorVersion() %>
            JSP Version: <%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %> <br>
        </div>
        <%@include file="/WEB-INF/common/footer.jsp"%>
    </body>
</html>
