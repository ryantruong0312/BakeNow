<%-- 
    Document   : marketplace
    Created on : 9 Oct 2022, 20:50:30
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="assets/css/marketplace/marketplace.css">
        <title>Marketplace - BakeNow</title>
    </head>
    <body>
        <%@include file="/WEB-INF/common/header.jsp"%>
        <c:url var="toViewProduct" value="MainController?action=NavToViewProduct"/>
        <c:url var="toAddProduct" value="MainController?action=NavToAddProduct"/>
        <c:url var="toViewShop" value="MainController?action=NavToViewShop"/>
        <c:url var="toViewProductByCategory" value="MainController?action=NavToViewProductByCategory"/>
        <div class="main-container">
            <c:set var="shopList" value="${sessionScope.LIST_SHOP}" />
            <div style="width: 1390px" class="page_title">
                <h1>RECENT PRODUCT</h1>
                <form class="body_product_search" action="MainController">
                    <input type="text" class="product_search" name="search" placeholder="Enter a product ...">
                    <iconify-icon class="PageTitle_search_icon" icon="akar-icons:search" width="34" height="34"></iconify-icon>
                    <input type="submit" class="body_search_button" name="action" value="Search">
                </form>
            </div>
        </div>

            <div class="main-container d-flex">
            <aside class="sidebar col-3 my-3">
                <button type="button" class="main-category">Ingredient</button>
                <c:forEach var="subICate" items="${sessionScope.GET_I_CATEGORY}" >
                    <button type="button" class="collapsible category">${subICate.getName()}</button>
                    <div class="content">
                        <c:forEach var="smallerICate" items="${subICate.getSmallerCatgory()}">
                            <li><a class="link_modify" href="${toViewProductByCategory}">${smallerICate.getName()}</a></li>                          
                            </c:forEach>
                    </div>
                </c:forEach>    
                <button type="button" class="main-category">Tool</button>
                <c:forEach var="subTCate" items="${sessionScope.GET_T_CATEGORY}" >
                    <button type="button" class="collapsible category">${subTCate.getName()}</button>
                    <div class="content">
                        <c:forEach var="smallerTCate" items="${subTCate.getSmallerCatgory()}">
                            <li><a class="link_modify" href="${toViewProductByCategory}">${smallerTCate.getName()}</a></li>
                            </c:forEach>
                    </div>
                </c:forEach>    
            </aside>
            <!--/ đây là đoạn thêm product vào -->
            <div class="product_list col-9 my-3">
                <c:forEach var="product" items="${sessionScope.LIST_PRODUCT}">
                    <div class="product_card" style="margin-top: 0px;">
                        <div class="product_card_img">
                            <img src="${product.getImgUrl()}" alt="product">
                        </div>
                        <div class="product_body">
                            <a href="${toViewProduct}"><div class="product_title link_modify--Product">${product.getName()}</div></a>
                            <!<!-- cai cho toviewProduct la gi v -->
                            <p class="product_author"><iconify-icon inline style="color:#56D262;" icon="clarity:store-line" width="22" height="22"></iconify-icon><a href="${toViewShopProfile}">${product.getShopId()}</a></p>
                            <div class="product_info">
                                <div class="product-star">
                                    <span class="fa fa-star fa-star-sized checked"></span>
                                    <span class="fa fa-star fa-star-sized checked"></span>
                                    <span class="fa fa-star fa-star-sized checked"></span>
                                    <span class="fa fa-star fa-star-sized"></span>
                                    <span class="fa fa-star fa-star-sized"></span>
                                    <span class="product_text"  style="margin-top: 0px; padding-left: 0px; padding-right: 0px;">(${product.getReviewCount()})</span>
                                </div>
                            </div>
                            <div class="price">${product.getPrice()} $</div>
                            <form action="Product_addToCart" class="d-flex" >                                                                                                   
                                    <input type="number" class="order_quantity_holder" name="orderQuantity" value="1">                                                                                                              
                                <!--cái này thiệt sự là bỏ đi dùng cái input bình thường được rồi mà-->
                                <button class="addToCartButton" type="submit" formaction="CartController?action=Add" id="createRecipeButton" value="Add to Cart">
                                    <iconify-icon icon="lucide:shopping-cart" width="35" ></iconify-icon>
                                    <p>Add to Cart</p>
                                </button>
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
