<%-- 
    Document   : cart
    Created on : 9 Oct 2022, 22:07:33
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Cart - BakeNow</title>
        <link rel="stylesheet" href="assets/css/marketplace/cart-view.css"/>
    </head>
    <body>
        <%@include file="/WEB-INF/common/header.jsp"%>
        <div class="main-container py-3">
            <div class="edit_product_container d-flex justify-content-center">
                <div class="edit_product col-10">
                    <div class="col-10 cart_page_title">
                        MY CART
                    </div>
                    <c:forEach var="item" items="${CART}">
                        <div class="p-3 my-3" style="background-color: #fff; border: 1px solid #D9D9D9;">
                            <i class="bi bi-shop"></i>
                            <a style="margin-left: 5px;" href="${item.value.shopName}">Asian Store</a> 
                            <hr style="height: 3px;"></hr>
                            <div class="d-flex">
                                <div class="col-2 d-flex justify-content-center"> 
                                    <img src="${item.value.productImgUrl}" style="width: 120px; height: 120px;">
                                </div>
                                <div class="col-6">
                                    <div style="padding: 10px 0;">${item.value.productName}</div>
                                    <form action="" class="col-3 my-2">
                                        <div class="d-flex align-items-center" style="border: 1px solid #000; font-size: 20px; text-align: center; border-radius: 5px;">
                                            <div class="dec button col-3">–</div>
                                            <div class="order_quantity col-6 px-0">
                                                <input type="number" class="order_quantity_holder" name="orderQuantity" style="width: 60px; height: 45px; text-align: center;" value="${item.value.orderQuantity}">
                                            </div>
                                            <div class="inc button col-3">+</div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-2 d-flex justify-content-end align-items-center" style="font-weight: bold;">${item.value.price}</div>
                                <div class="col-2 d-flex justify-content-end align-items-center">
                                    <button type="submit" class="remove_btn">Remove</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/common/footer.jsp"%>
        <script>
            $(function () {
                $(".button").on("click", function () {
                    var $button = $(this);
                    var oldValue = $button.parent().find(".order_quantity_holder").val();
                    if ($button.text() === "+") {
                        var newVal = parseFloat(oldValue) + 1;
                    } else {
                        // Don't allow decrementing below zero
                        if (oldValue > 0) {
                            var newVal = parseFloat(oldValue) - 1;
                        } else {
                            newVal = 0;
                        }
                    }
                    $button.parent().find(".order_quantity_holder").val(newVal);
                });
            });
        </script>
    </body>
</html>
