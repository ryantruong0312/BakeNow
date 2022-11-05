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
        <div class="page_title">
            <h1>RECENT PRODUCT</h1>
            <form class="body_product_search" action="MainController">
                <input type="text" class="product_search" name="search" placeholder="Enter a product ...">
                <svg width="31" height="31" viewBox="0 0 31 31" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g clip-path="url(#clip0_163_9221)">
                <path d="M21.282 18.7484C23.0371 16.3536 23.8231 13.3843 23.483 10.4348C23.1428 7.48522 21.7015 4.77286 19.4474 2.84036C17.1933 0.907857 14.2926 -0.102281 11.3257 0.0120395C8.35878 0.12636 5.54445 1.35671 3.44572 3.45693C1.347 5.55716 0.118666 8.37238 0.00646872 11.3394C-0.105728 14.3063 0.906485 17.2063 2.8406 19.459C4.77472 21.7117 7.4881 23.1511 10.4379 23.4892C13.3877 23.8272 16.3564 23.0391 18.75 21.2823H18.7482C18.8025 21.3548 18.8605 21.4237 18.9258 21.4908L25.9039 28.4689C26.2438 28.809 26.7048 29.0001 27.1856 29.0003C27.6664 29.0005 28.1276 28.8096 28.4677 28.4698C28.8078 28.1299 28.999 27.6689 28.9991 27.1881C28.9993 26.7073 28.8085 26.2461 28.4686 25.906L21.4905 18.9279C21.4257 18.8623 21.356 18.8017 21.282 18.7466V18.7484ZM21.7497 11.7812C21.7497 13.0903 21.4918 14.3866 20.9908 15.5961C20.4899 16.8055 19.7556 17.9045 18.8299 18.8302C17.9042 19.7558 16.8053 20.4901 15.5958 20.9911C14.3863 21.4921 13.09 21.7499 11.7809 21.7499C10.4718 21.7499 9.17551 21.4921 7.96605 20.9911C6.75658 20.4901 5.65764 19.7558 4.73195 18.8302C3.80627 17.9045 3.07198 16.8055 2.571 15.5961C2.07002 14.3866 1.81217 13.0903 1.81217 11.7812C1.81217 9.13731 2.86245 6.60172 4.73195 4.73222C6.60146 2.86271 9.13705 1.81244 11.7809 1.81244C14.4248 1.81244 16.9604 2.86271 18.8299 4.73222C20.6994 6.60172 21.7497 9.13731 21.7497 11.7812V11.7812Z" fill="#56D262"/>
                </g>
                <defs>
                <clipPath id="clip0_163_9221">
                    <rect width="31" height="31" fill="white"/>
                </clipPath>
                </defs>
                </svg>
                <input type="submit" class="body_search_button" name="action" value="Search">
            </form>
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
                    <div class="product_card">
                        <div class="product_card_img">
                            <img src="${product.getImgUrl()}" alt="product">
                        </div>
                        <div class="product_body">
                            <a href="${toViewProduct}"><div class="product_title link_modify--Product">${product.getName()}</div></a>
                            <!<!-- cai cho toviewProduct la gi v -->
                            <p class="product_author">By: <a href="${toViewShop}">Asian Store</a></p>
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
                            <form action="" class="d-flex">                      
                                <div class="col-5">                                                                             
                                    <input type="number" class="order_quantity_holder" name="orderQuantity" style="width: 60px; height: 45px; text-align: center;" value="1">                                                                                                  
                                </div>                   
                                <!--cái này thiệt sự là bỏ đi dùng cái input bình thường được rồi mà--> 
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
