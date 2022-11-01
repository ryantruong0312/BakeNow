<%-- 
    Document   : marketplace
    Created on : 9 Oct 2022, 20:50:30
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marketplace - BakeNow</title>
        <link rel="stylesheet" href="assets/css/marketplace/marketplace.css">
    </head>
    <body>
        <%@include file="/WEB-INF/common/header.jsp"%>
        <c:url var="toViewProduct" value="MainController?action=NavToViewProduct"/>
        <c:url var="toAddProduct" value="MainController?action=NavToAddProduct"/>
        <c:url var="toViewShop" value="MainController?action=NavToViewShop"/>
        <div class="main-container d-flex">
            <aside class="sidebar col-3 my-3">
                <button type="button" class="main-category">Ingredient</button>
                    <button type="button" class="collapsible category">Flour</button>
                    <div class="content">
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                    </div>
                    <button type="button" class="collapsible category">Leavener</button>
                    <div class="content">
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                    </div>
                    <button type="button" class="collapsible category">Sweetener</button>
                    <div class="content">
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                    </div>
                    <button type="button" class="collapsible category">Fats and Oil</button>
                    <div class="content">
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                    </div>
                    <button type="button" class="collapsible category">Milk and Cheese</button>
                    <div class="content">
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                    </div>
                    <button type="button" class="collapsible category">Icing and Filling</button>
                    <div class="content">
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                    </div>
                    <button type="button" class="collapsible category">Flavor and Color</button>
                    <div class="content">
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                    </div>
                    <button type="button" class="collapsible category">Chocolate</button>
                    <div class="content">
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                    </div>
                    <button type="button" class="collapsible category">Chocolate Chips</button>
                    <div class="content">
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                    </div>
                    <button type="button" class="collapsible category">Fruits and Nuts</button>
                    <div class="content">
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                    </div>
                    <button type="button" class="collapsible category">Others</button>
                    <div class="content">
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                    </div>
                    <button type="button" class="main-category">Tool</button>
                    <div class="content">
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                    </div>

            </aside>
            <div class="product_list col-9 my-3">
                <c:forEach begin="1" end="20">
                    <div class="product_card">
                        <div class="product_card_img">
                            <img src="assets/img/bo_Anchor.jpg" alt="product">
                        </div>
                        <div class="product_body">
                            <a href="${toViewProduct}"><div class="product_title">Bơ Anchor cắt sẵn</div></a>
                            <p class="product_author">By: <a href="${toViewShop}">Asian Store</a></p><br>
                            <div class="product_info">
                                <div class="product-star">
                                    <span class="fa fa-star fa-star-sized checked"></span>
                                    <span class="fa fa-star fa-star-sized checked"></span>
                                    <span class="fa fa-star fa-star-sized checked"></span>
                                    <span class="fa fa-star fa-star-sized"></span>
                                    <span class="fa fa-star fa-star-sized"></span>
                                    <span class="product_text"  style="margin-top: 0px; padding-left: 0px; padding-right: 0px;">(19)</span>
                                </div>
                            </div>
                            <div class="price">35.000 đ</div>
                            <form action="" class="d-flex">
                                <div class="col-1"></div>
                                <div class="col-5">
                                    <div class="d-flex align-items-center" style="border: 1px solid #000; font-size: 20px; text-align: center; border-radius: 5px;">
                                        <div class="dec button col-3">–</div>
                                        <div class="order_quantity col-6 px-0">
                                            <input type="number" class="order_quantity_holder" name="orderQuantity" style="width: 60px; height: 45px; text-align: center;" value="1">
                                        </div>
                                        <div class="inc button col-3">+</div>
                                    </div>
                                </div>
                                <div class="col-1"></div>
                                <input type="submit" id="add_to_cart_btn" class="btn product_add-to-cart_btn col-5" name="action" value="AddToCart">
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- Trang add-product / Hàng xài tạm vì chưa có trang marketplace -->
        <c:url var="toAddProduct" value="MainController?action=NavToAddProduct"/>
        <a href="${pageScope.toAddProduct}">Add Product</a>
    </div>
    <%@include file="/WEB-INF/common/footer.jsp"%>
    <script>
        var coll = document.getElementsByClassName("collapsible");
        var i;

        for (i = 0; i < coll.length; i++) {
            coll[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var content = this.nextElementSibling;
                if (content.style.display === "block") {
                    content.style.display = "none";
                } else {
                    content.style.display = "block";
                }
            });
        }
    </script>
</body>
</html>
