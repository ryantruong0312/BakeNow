<%-- 
    Document   : editProduct
    Created on : Oct 12, 2022, 12:49:05 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit A Product - BakeNow</title>
        <link rel="stylesheet" href="assets/css/marketplace/product-edit.css"/>
    </head>
    <body>
        <%@include file="/WEB-INF/common/header.jsp"%>
        <div class="main-container py-3">
            <div class="edit_product_container d-flex justify-content-center">
                <div class="edit_product col-10">
                    <div class="col-10 edit_product_page_title">
                        EDIT YOUR PRODUCT
                    </div>
                    <!--PRODUCT-->
                    <!--CATEGORY-->
                    <div class="d-flex justify-content-center my-3 py-3" style="background-color: #fff;">
                        <form action="EditProductController" method="post" enctype="multipart/form-data"  class="edit_product_form col-10">
                            <div class="py-2 details" > 
                                <span style="font-size: 24px; font-weight: bold;">Title</span> 
                                <input type="text" style="width: 500px; padding-left: 10px;" name="title1" value="${requestScope.PRODUCT.name}" required="">
                            </div>
                            <div class="py-2 d-flex justify-content-center">
                                <div class="col-4 py-2">
                                    <c:set var = "salary" scope = "page" value = "${requestScope.PRODUCT.checkimgUrl()}"/>
                                    <c:choose>
                                        <c:when test = "${salary == true}">
                                            <img src="assets/img/${requestScope.PRODUCT.getImgName()}" alt="product">
                                        </c:when>
                                        <c:when test = "${salary == false}">
                                            <image src="${requestScope.PRODUCT.getImgUrl()}" style="height: 256px; width: 256px; display: block; margin: 0 auto; border-radius: 5px;">
                                        </c:when>
                                        <c:otherwise>
                                            <image src="${requestScope.PRODUCT.getImgUrl()}" style="height: 256px; width: 256px; display: block; margin: 0 auto; border-radius: 5px;">
                                        </c:otherwise>
                                    </c:choose>  
                                    <div style="text-align: center;">
                                        <input class="my-2 px-4" style="width: 300px; border: none;" type="file" name="img1">
                                    </div>
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
                                            <input type="text" name="productOrigin1" required="" value="${requestScope.PRODUCT.origin}" style="margin-left: 30px;">
                                    </div>
                                    <div class="details details_category col-5">
                                        <span>Category</span>
                                        <select name="productCategory1">
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
                                        <div class="details details_manuDate col-5" value="">
                                            <span>Mfg.Date</span>
                                            <input type="date" name="manuDate1" required="" value="${requestScope.PRODUCT.mnfDate}" style="margin-left: 4px;">
                                    </div>
                                    <div class="details details_expDate col-5" value="" style="margin-left: 2px;">
                                        <span>Exp.Date</span>
                                        <input type="date"  required="" value="${requestScope.PRODUCT.expDate}" name="expDate1">
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                                <div class="details_row d-flex py-2">
                                    <div class="col-1"></div>
                                    <div class="details details_price col-5">
                                        <span>Price</span>
                                        <input  min="0.01" type="number" step="0.01" name="productPrice1" required="" value="${requestScope.PRODUCT.price}" style="margin-left: 37px;">
                                    </div>
                                    <div class="details details_stock col-5" style="margin-left: 27px;">
                                        <span>Stock</span>
                                        <input min="1" type="number" name="stockQuantity1" required=""  value="${requestScope.PRODUCT.stock}">
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                            </div>
                            <div class="pt-3" > 
                                <div style="font-size: 24px; font-weight: bold;">Description</div>
                            </div>
                            <div class="details_description my-2">
                                <textarea class="py-2" type="text" style="" name="productDescription1" value="${requestScope.PRODUCT.description}" required=""> ${requestScope.PRODUCT.description}</textarea>
                            </div>
                            <div style="display: none">
                                <input class="py-2" type="number" style="" name="productId1" value="${requestScope.PRODUCT.getId()}">
                            </div>
                            <div class="d-flex justify-content-end my-3">
                                <input class="last_button mx-2" id="edit_product_btn" name="" type="submit" value="Edit">
                                <a class="last_button" style="padding-top: 5px;" href="">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${requestScope.PRODUCT_ERROR != null}">
        <div id="stupidnetbeans">
            <div style="position: fixed; top: 0px;bottom: 0px; left: 0px; right: 0px; background: #5F6440; opacity: 50%;">
            </div>
            <div style=" height: 100px;position: absolute; left: 40%; top: 50%; opacity: 1; background: #fff; border-radius: 5px; border: 2px solid #56D262; ">
                <h2 style=" text-align: center;">Inform</h2>
                <button style="position: absolute; right: 10px; top: 5px; " onclick="document.getElementById('stupidnetbeans').style.display = 'none'">&times;</button> 
                <div style="padding: 0 50 0 50">
                    ${PRODUCT_ERROR.getName()}
                    ${PRODUCT_ERROR.getCategory()}
                    ${PRODUCT_ERROR.getMnfDate()}
                    ${PRODUCT_ERROR.getOrigin()}
                    ${PRODUCT_ERROR.getPrice()}
                    ${PRODUCT_ERROR.getStock()}
                </div>
            </div>
        </div>
    </c:if>  
    <%@include file="/WEB-INF/common/footer.jsp"%>
</body>
</html>
