<%-- 
    Document   : recipeSearchResult
    Created on : Oct 12, 2022, 12:40:32 PM
    Author     : tlminh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recipe Search - BakeNow</title>
    </head>
    <body>
        <div id="page_search-result_recipe" class="main-container">
            <p>
                <c:out value="${0}"></c:out> result(s) found
            </p>
        </div>
    </body>
</html>
