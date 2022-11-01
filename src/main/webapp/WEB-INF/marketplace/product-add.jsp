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
        <link rel="stylesheet" href="assets/css/marketplace/product-add.css"/>
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
                        <form action="" class="add_product_form col-10">
                            <div class="py-2 details" > 
                                <span style="font-size: 24px; font-weight: bold;">Title</span> 
                                <input type="text" style="width: 500px; padding-left: 10px;" name="title" placeholder="Enter product title..." required="">
                            </div>
                            <div class="py-2 d-flex justify-content-center">
                                <div class="col-4 py-2">
                                    <image src="assets/img/blank_img.png" style="height: 256px; width: 256px; display: block; margin: 0 auto; border-radius: 5px;">
                                    <div style="text-align: center;">
                                        <input class="my-2 px-4" style="width: 300px; border: none;" type="file" name="img">
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
                                        <input type="text" name="productOrigin" required="" placeholder="Vietnam" style="margin-left: 30px;">
                                    </div>
                                    <div class="details details_category col-5">
                                        <span>Category</span>
                                        <select name="productCategory">
                                            <c:forEach var="m" begin="1" end="5">
                                                <option>m</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                                <div class="details_row d-flex py-2">
                                    <div class="col-1"></div>
                                    <div class="details details_manuDate col-5">
                                        <span>Mfg.Date</span>
                                        <input type="date" name="manuDate" required="" style="margin-left: 4px;">
                                    </div>
                                    <div class="details details_expDate col-5" style="margin-left: 2px;">
                                        <span>Exp.Date</span>
                                        <input type="date" name="expDate">
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                                <div class="details_row d-flex py-2">
                                    <div class="col-1"></div>
                                    <div class="details details_price col-5">
                                        <span>Price</span>
                                        <input type="number" step="0.01" name="productPrice" required="" style="margin-left: 37px;">
                                    </div>
                                    <div class="details details_stock col-5" style="margin-left: 27px;">
                                        <span>Stock</span>
                                        <input type="number" name="stockQuantity" required="">
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                            </div>
                            <div class="pt-3" > 
                                <div style="font-size: 24px; font-weight: bold;">Description</div>
                            </div>
                            <div class="details_description my-2">
                                <textarea class="py-2" type="text" style=" " name="title" placeholder="Describe your product..." required=""></textarea>
                            </div>
                            <div class="d-flex justify-content-end my-3">
                                <input class="last_button mx-2" type="submit" name="action" value="Add">
                                <a class="last_button" style="padding-top: 5px;" href="">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/common/footer.jsp"%>
</body>
</html>
