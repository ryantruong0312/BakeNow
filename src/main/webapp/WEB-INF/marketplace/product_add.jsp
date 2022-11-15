<%-- 
    Document   : addProduct
    Created on : Oct 12, 2022, 12:48:50 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add A New Product - BakeNow</title>
        <link rel="stylesheet" type="text/css" href="assets/css/marketplace/product-add.css"/>
    </head>
    <body>
        <%@include file="/WEB-INF/common/header.jsp"%>
        <div class="main-container py-3">
            <div class="add_product_container d-flex justify-content-center">
                <div class="add_product col-10">
                    <div class="col-10 add_product_page_title">
                        ADD NEW PRODUCT
                    </div>
                    <div class="d-flex justify-content-center my-3 py-3" style="background-color: #fff;">
                        <form action="AddProductController" method="post" enctype="multipart/form-data" class="add_product_form col-10">
                            <div class="py-2 details" > 
                                <span style="font-size: 24px; font-weight: bold;">Title</span> 
                                <input type="text" style="width: 500px; padding-left: 10px;" name="title" placeholder="Enter product title...${requestScope.PRODUCT_ERROR.getName()}" required="">
                            </div>
                            <div class="py-2 d-flex justify-content-center">
                                <div class="col-4 py-2">
                                    <image src="assets/img/blank_img.png" style="height: 256px; width: 256px; display: block; margin: 0 auto; border-radius: 5px;">
                                    <input type="file" name="img" />
                                </div>
                            </div>
                            <div class="py-2" > 
                                <div style="font-size: 24px; font-weight: bold;">Details</div>
                            </div>
                            <div class="py-2 details_container">
                                <div class="details_row d-flex py-2 justify-content-space-around">
                                    <div class="col-1"></div>
                                    <div class="details details_origin col-5">
                                        <span>Origin</span>
                                        <input type="text"  name="productOrigin" required="" placeholder="Vietnam ${requestScope.PRODUCT_ERROR.getOrigin()}" style="margin-left: 30px;">
                                    </div>
                                    <div class="details details_category col-5">
                                        <span>Category ${requestScope.PRODUCT_ERROR.getCategory()}</span>
                                        <select name="productCategory">
                                            <c:forEach var="subICate" items="${sessionScope.GET_I_CATEGORY}" >
                                                <c:forEach var="smallerICate" items="${subICate.getSmallerCatgory()}">
                                                    <option>${smallerICate.getName()}</option>
                                                </c:forEach></c:forEach>
                                            <c:forEach var="subICate" items="${sessionScope.GET_T_CATEGORY}" >
                                                <c:forEach var="smallerICate" items="${subICate.getSmallerCatgory()}">
                                                    <option>${smallerICate.getName()}</option>
                                                </c:forEach></c:forEach>    
                                            </select>
                                        </div>
                                        <div class="col-1"></div>
                                    </div>
                                    <div class="details_row d-flex py-2">
                                        <div class="col-1"></div>
                                        <div class="details details_manuDate col-5">
                                            <span>Mfg.Date</span>
                                            <input type="date" value="" name="manuDate" required="" style="margin-left: 4px;">
                                            <span>${requestScope.PRODUCT_ERROR.getMnfDate()}</span>
                                    </div>
                                    <div class="details details_expDate col-5"  style="margin-left: 2px;">
                                        <span>Exp.Date</span>
                                        <input type="date" name="expDate" required="">
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                                <div class="details_row d-flex py-2">
                                    <div class="col-1"></div>
                                    <div class="details details_price col-5">
                                        <span>Price</span>
                                        <input min="0.01" type="number" step="0.01" name="productPrice" required="" style="margin-left: 37px;">
                                        <span>${requestScope.PRODUCT_ERROR.getPrice()}</span>
                                    </div>
                                    <div class="details details_stock col-5" style="margin-left: 27px;">
                                        <span>Stock</span>
                                        <input min="1" type="number" name="stockQuantity" required="">
                                        <span>${requestScope.PRODUCT_ERROR.getStock()}</span>
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                            </div>
                            <div class="pt-3" > 
                                <div style="font-size: 24px; font-weight: bold;">Description</div>
                            </div>
                            <div class="details_description my-2">
                                <textarea class="py-2" type="text" style="" name="productDescription" placeholder="Describe your product..." required=""></textarea>
                            </div>
                            <div class="d-flex justify-content-end my-3">
                                <c:set var = "check" scope = "page" value = "${sessionScope.LOGIN_USER == null}"/>
                                <c:choose>
                                    <c:when test = "${check == true}">
                                        <a class="px-2" href="MainController?action=Login">Login</a>
                                    </c:when>
                                    <c:when test = "${check == false}">
                                        <input class="last_button mx-2" type="submit" name="" value="Add Product">
                                    </c:when>
                                </c:choose>
                                <a class="last_button" style="padding-top: 5px;" href="">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>               
        </div>
        <c:if test="${requestScope.successMsg != null || requestScope.PRODUCT_ERROR != null}">
            <div id="stupidnetbeans">
                <div style="position: fixed; top: 0px;bottom: 0px; left: 0px; right: 0px; background: #5F6440; opacity: 50%;">
                </div>
                <div style=" height: 100px;position: absolute; left: 40%; top: 50%; opacity: 1; background: #fff; border-radius: 5px; border: 2px solid #56D262; ">
                    <h2 style=" text-align: center;">Inform</h2>
                    <button style="position: absolute; right: 10px; top: 5px; " onclick="document.getElementById('stupidnetbeans').style.display = 'none'">&times;</button> 
                    <div style="padding: 0 50 0 50">
                        ${requestScope.successMsg}
                        ${requestScope.PRODUCT_ERROR.getName()}
                        ${requestScope.PRODUCT_ERROR.getMnfDate()}
                        ${requestScope.PRODUCT_ERROR.getCategory()}
                        ${requestScope.PRODUCT_ERROR.getPrice()}
                        ${requestScope.PRODUCT_ERROR.getStock()}
                        ${requestScope.PRODUCT_ERROR.getOrigin()}
                        ${requestScope.PRODUCT_ERROR.getImg()}
                    </div>
                </div>
            </div>
        </c:if>  
        <%@include file="/WEB-INF/common/footer.jsp"%>
    </body>
</html>
