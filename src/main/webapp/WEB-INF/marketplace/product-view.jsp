<%-- 
    Document   : viewProduct
    Created on : Oct 12, 2022, 12:36:20 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View A Product - BakeNow</title>
        <link rel="stylesheet" href="assets/css/marketplace/product-view.css">
        <script src='//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js'></script>
        <style>
            .checked {
                color: orange;
            }
        </style>
    </head>
    <body>
        <%@include file="/WEB-INF/common/header.jsp"%>
        <c:url var="toShop" value="MainController?action=NavToShop"/>
        <c:url var="toEditProduct" value="MainController?action=NavToEditProduct"/>
        <c:url var="toDeleteProduct" value="MainController?action=ToDeleteProduct"/>
        <c:url var="toReplyComment" value="#"/>
        <c:url var="toProfile" value="MainController?action=NavToProfile"/>
        <div id="page_view-product" class="main-container py-3">
            <div class="row">
                <div class="product_info col-7">
                    <div class="product_info_container">
                        <div class="product_info_title" style=" width: 1377px ;font-size: 30px;">${requestScope.PRODUCT.name}</div>
                        <div class="product-star py-2 mx-0">
                            <c:set var = "rating" scope = "page" value = "${requestScope.PRODUCT.getRating()}"/>
                            <c:choose>
                                <c:when test = "${rating <= 0.5}">
                                    <span class="fa fa-star-half-o checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                </c:when>
                                <c:when test = "${rating <= 1}">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                </c:when>
                                <c:when test = "${rating <= 1.5}">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star-half-o checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                </c:when>
                                <c:when test = "${rating <= 2}">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                </c:when>
                                <c:when test = "${rating <= 2.5}">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star-half-o checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                </c:when>
                                <c:when test = "${rating <= 3}">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                </c:when>
                                <c:when test = "${rating <= 3.5}">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star-half-o checked"></span>
                                    <span class="fa fa-star"></span>
                                </c:when>
                                <c:when test = "${rating <= 4}">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                </c:when>
                                <c:when test = "${rating <= 4.5}">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star-half-o checked"></span>
                                </c:when>
                                <c:when test = "${rating <= 5}">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                </c:when>
                            </c:choose> 
                            <span class="recipe_text"  style="margin-top: 0px; padding-left: 0px; padding-right: 0px;">(${requestScope.PRODUCT.getReviewCount()})<a style="text-decoration: none; color: orange; " onclick="document.getElementById('stupidnetbeans').style.display = 'block'">Want to rate this product? Click me</a> </span>
                        </div>                                                                                                                                 
                        <div class="product_owner d-inline-block" style="width: 75%;">
                            <svg width="25" height="25" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_176_9466)">
                            <path d="M7.425 3.375C7.65972 3.10059 7.95109 2.88028 8.27909 2.72923C8.60708 2.57818 8.9639 2.49998 9.325 2.5H30.675C31.0361 2.49998 31.3929 2.57818 31.7209 2.72923C32.0489 2.88028 32.3403 3.10059 32.575 3.375L39.0975 10.985C39.6799 11.6646 40 12.53 40 13.425V14.0625C40.0001 15.2999 39.6136 16.5065 38.8945 17.5136C38.1754 18.5206 37.1597 19.2778 35.9892 19.6794C34.8187 20.0809 33.552 20.1067 32.3662 19.7532C31.1803 19.3996 30.1345 18.6844 29.375 17.7075C28.8204 18.4219 28.1096 18.9999 27.2971 19.3973C26.4846 19.7947 25.592 20.0008 24.6875 20C23.783 20.001 22.8903 19.7949 22.0778 19.3976C21.2653 19.0002 20.5545 18.4221 20 17.7075C19.4455 18.4221 18.7347 19.0002 17.9222 19.3976C17.1097 19.7949 16.217 20.001 15.3125 20C14.408 20.001 13.5153 19.7949 12.7028 19.3976C11.8903 19.0002 11.1795 18.4221 10.625 17.7075C9.86548 18.6844 8.81971 19.3996 7.63384 19.7532C6.44798 20.1067 5.18129 20.0809 4.01081 19.6794C2.84033 19.2778 1.82456 18.5206 1.10546 17.5136C0.386355 16.5065 -0.000136496 15.2999 3.61613e-08 14.0625V13.425C3.15188e-05 12.53 0.320141 11.6646 0.9025 10.985L7.4275 3.3725L7.425 3.375ZM11.875 14.0625C11.875 14.9742 12.2372 15.8485 12.8818 16.4932C13.5265 17.1378 14.4008 17.5 15.3125 17.5C16.2242 17.5 17.0985 17.1378 17.7432 16.4932C18.3878 15.8485 18.75 14.9742 18.75 14.0625C18.75 13.731 18.8817 13.413 19.1161 13.1786C19.3505 12.9442 19.6685 12.8125 20 12.8125C20.3315 12.8125 20.6495 12.9442 20.8839 13.1786C21.1183 13.413 21.25 13.731 21.25 14.0625C21.25 14.9742 21.6122 15.8485 22.2568 16.4932C22.9015 17.1378 23.7758 17.5 24.6875 17.5C25.5992 17.5 26.4735 17.1378 27.1182 16.4932C27.7628 15.8485 28.125 14.9742 28.125 14.0625C28.125 13.731 28.2567 13.413 28.4911 13.1786C28.7255 12.9442 29.0435 12.8125 29.375 12.8125C29.7065 12.8125 30.0245 12.9442 30.2589 13.1786C30.4933 13.413 30.625 13.731 30.625 14.0625C30.625 14.9742 30.9872 15.8485 31.6318 16.4932C32.2765 17.1378 33.1508 17.5 34.0625 17.5C34.9742 17.5 35.8485 17.1378 36.4932 16.4932C37.1378 15.8485 37.5 14.9742 37.5 14.0625V13.425C37.5 13.1271 37.3936 12.8389 37.2 12.6125L30.675 5H9.325L2.8 12.6125C2.60637 12.8389 2.49998 13.1271 2.5 13.425V14.0625C2.5 14.9742 2.86216 15.8485 3.50682 16.4932C4.15148 17.1378 5.02582 17.5 5.9375 17.5C6.84918 17.5 7.72352 17.1378 8.36818 16.4932C9.01284 15.8485 9.375 14.9742 9.375 14.0625C9.375 13.731 9.5067 13.413 9.74112 13.1786C9.97554 12.9442 10.2935 12.8125 10.625 12.8125C10.9565 12.8125 11.2745 12.9442 11.5089 13.1786C11.7433 13.413 11.875 13.731 11.875 14.0625ZM3.75 21.25C4.08152 21.25 4.39946 21.3817 4.63388 21.6161C4.8683 21.8505 5 22.1685 5 22.5V37.5H35V22.5C35 22.1685 35.1317 21.8505 35.3661 21.6161C35.6005 21.3817 35.9185 21.25 36.25 21.25C36.5815 21.25 36.8995 21.3817 37.1339 21.6161C37.3683 21.8505 37.5 22.1685 37.5 22.5V37.5H38.75C39.0815 37.5 39.3995 37.6317 39.6339 37.8661C39.8683 38.1005 40 38.4185 40 38.75C40 39.0815 39.8683 39.3995 39.6339 39.6339C39.3995 39.8683 39.0815 40 38.75 40H1.25C0.918479 40 0.600537 39.8683 0.366117 39.6339C0.131696 39.3995 3.61613e-08 39.0815 3.61613e-08 38.75C3.61613e-08 38.4185 0.131696 38.1005 0.366117 37.8661C0.600537 37.6317 0.918479 37.5 1.25 37.5H2.5V22.5C2.5 22.1685 2.6317 21.8505 2.86612 21.6161C3.10054 21.3817 3.41848 21.25 3.75 21.25ZM8.75 22.5C9.08152 22.5 9.39946 22.6317 9.63388 22.8661C9.8683 23.1005 10 23.4185 10 23.75V32.5H30V23.75C30 23.4185 30.1317 23.1005 30.3661 22.8661C30.6005 22.6317 30.9185 22.5 31.25 22.5C31.5815 22.5 31.8995 22.6317 32.1339 22.8661C32.3683 23.1005 32.5 23.4185 32.5 23.75V32.5C32.5 33.163 32.2366 33.7989 31.7678 34.2678C31.2989 34.7366 30.663 35 30 35H10C9.33696 35 8.70107 34.7366 8.23223 34.2678C7.76339 33.7989 7.5 33.163 7.5 32.5V23.75C7.5 23.4185 7.6317 23.1005 7.86612 22.8661C8.10054 22.6317 8.41848 22.5 8.75 22.5Z" fill="#56D262"/>
                            </g>
                            <defs>
                            <clipPath id="clip0_176_9466">
                                <rect width="40" height="40" fill="white"/>
                            </clipPath>
                            </defs>
                            </svg>
                            <a style="margin-left: 5px;" href="MainController?action=NavToViewShopProfile&shopID=${requestScope.SHOP.getId()}">${requestScope.SHOP.getName()}</a> 
                        </div>
                        <c:if test="${sessionScope.LOGIN_USER.roleId == 0 || sessionScope.LOGIN_USER.roleId == 1 || sessionScope.LOGIN_SHOP.id == requestScope.PRODUCT.shopId}">
                            <div class="product_action d-inline-block" style="width: 20%; text-align: end;">
                                <span style="color: #56D262" >Manage Product</span>
                                <svg id="product_action_icon" style="border: 2px solid #56D262; border-radius: 5px" width="22" height="22" viewBox="0 0 6 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <circle cx="3" cy="11" r="3" fill="#56D262"/>
                                <circle cx="3" cy="19" r="3" fill="#56D262"/>
                                <circle cx="3" cy="3" r="3" fill="#56D262"/>
                                </svg>
                                <div id="product_action_option" style="position: absolute; top: 140px; left: 670px; width: 120px; display: none;">
                                    <ul style="list-style-type: none; text-align: center; padding: 5px;">
                                        <c:if test="${sessionScope.LOGIN_SHOP.id == requestScope.PRODUCT.shopId}">
                                            <a href="MainController?action=NavToEditProduct&productId=${requestScope.PRODUCT.id}"><li>Edit</li></a>
                                                </c:if>
                                        <a href=""><li>Hide</li></a>
                                        <a href="MainController?action=ToDeleteProduct&productId=${requestScope.PRODUCT.id}"><li>Delete</li></a>
                                                <c:if test="${sessionScope.LOGIN_USER.roleId == 0 || sessionScope.LOGIN_USER.roleId == 1}">
                                            <a href=""><li>Discontinue</li></a>
                                                </c:if>
                                    </ul>
                                </div>
                            </div>                    
                        </c:if>

                        <div class="product_img d-flex justify-content-center">
                            <c:set var = "salary" scope = "page" value = "${requestScope.PRODUCT.checkimgUrl()}"/>
                            <c:choose>
                                <c:when test = "${salary == true}">
                                    <img src="assets/img/${requestScope.PRODUCT.getImgName()}" alt="recipe images" style="width: 256px; height: 256px;">
                                </c:when>
                                <c:when test = "${salary == false}">
                                    <img src="${requestScope.PRODUCT.getImgUrl()}" alt="recipe images" style="width: 256px; height: 256px;">
                                </c:when>
                                <c:otherwise>
                                    <img src="${requestScope.PRODUCT.getImgUrl()}" alt="recipe images" style="width: 256px; height: 256px;">
                                </c:otherwise>
                            </c:choose> 
                        </div>
                        <div class="d-flex justify-content-end">
                            <div class="py-2 col-5" style="padding-top: 50px;">
                                <div class="product_price" style="font-size: 35px; text-align: end; margin: 10px 0;">35.000 VND</div>
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
                    </div>
                    <div class="product_desc">
                        <div style="font-size: 24px; font-weight: bold; margin: 10px 0;">Description</div>
                        <p style="text-align: justify;">
                            ${requestScope.PRODUCT.getDescription()}
                        </p>
                    </div>
                </div>
                <div class="col-5 d-flex justify-content-center">
                    <div class="col-10">
                        <div  class="product_details" style="border: 1px solid #D9D9D9; border-radius: 5px; margin-top: 100px; background-color: #fff; height: fit-content;">
                            <span class="py-2" style="font-size: 24px; font-weight: bold;">Details</span>
                            <ul class="py-1 px-2 list-unstyled">
                                <li class="product_details_item d-flex py-1 px-1">
                                    <div class="col-6">Origin</div>
                                    <div class="col-6">${requestScope.PRODUCT.getOrigin()}</div>
                                </li>
                                <li class="product_details_item d-flex py-1 px-1">
                                    <div class="col-6">Category</div>

                                    <div class="col-6">${requestScope.CATEGORY.name}</div>
                                </li>
                                <li class="product_details_item d-flex py-1 px-1">
                                    <div class="col-6">Manufacturing Date</div>
                                    <div class="col-6">${requestScope.PRODUCT.getMnfDate()}</div>
                                </li>
                                <li class="product_details_item d-flex py-1 px-1">
                                    <div class="col-6">Expiry Date</div>
                                    <div class="col-6">${requestScope.PRODUCT.getExpDate()}</div>
                                </li>
                                <li class="product_details_item d-flex py-1 px-1">
                                    <div class="col-6">Stock</div>
                                    <div class="col-6">${requestScope.PRODUCT.getStock()}</div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>   
            </div>
            <div class="product_comment_add" style="margin-top: 200px;">
                <div class="" style="border: 1px solid #D9D9D9; border-radius: 5px; height: fit-content; background-color: #fff;">
                    <span class="p-3" style="font-size: 24px; font-weight: bold;">Leave your comment here</span>
                    <form class="p-2 mb-0" action="MainController">
                        <div class="p-1"> 
                            <textarea type="text" style="height: 150px; vertical-align: text-top; border: 1px solid #D9D9D9; padding: 10px;" class="col-12" name="commentContent" placeholder="Share your thought..."></textarea>
                        </div>
                        <div class="my-2 d-flex justify-content-end">
                            <input type="hidden" name="productId" value="${requestScope.PRODUCT.id}">
                            <input type="hidden" name="userId" value="${sessionScope.LOGIN_USER.id}">
                            <input type="submit" class="px-2 product_comment_post_button" style="width: 100px; height: 45px;" name="action" value="Post">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>         
<div class="row product_interaction">
    <div class="product_comment_container col-6 d-flex justify-content-center">
        <div class="product_comment col-11 p-2">
            <ul class="py-1 px-2 list-unstyled">
                <c:forEach var="comment" items="${requestScope.PRODUCTCOMMENT}">
                    <li class="p-1 my-1" style="border: 1px solid #D9D9D9; border-radius: 5px; background-color: #fff;">
                        <div class="d-flex" style="padding: 5px;">
                            <c:set var = "salary1" scope = "page" value = "${comment.checkAvatarUrl()}"/>
                            <c:choose>
                                <c:when test = "${salary1 == true}">
                                    <img class="col-1 align-items-center" src="assets/img/${commente.getImgName()}" alt="uservatar" style="width:35px; height:35px; border: 1px solid #D9D9D9; border-radius: 100px;">
                                </c:when>
                                <c:when test = "${salary1 == false}">
                                    <img class="col-1 align-items-center"  src="${comment.getAvatarUrl()}" alt="useravatar" style="width:35px; height:35px; border: 1px solid #D9D9D9; border-radius: 100px;">
                                </c:when>
                            </c:choose> 
                            <div class="col-11 px-1">
                                <a href="${pageScope.ToProfile}">${comment.userName}</a>
                                <div class="product_comment_time" style="font-size: 14px;">${comment.createTime}</div>
                            </div>
                        </div>
                        <hr style="margin: 1px; color: #D9D9D9; height: 3px;">
                        <div class="product_comment_content p-1">
                            ${comment.contents}
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<div id="stupidnetbeans" style="display: none">
    <div style="position: fixed; top: 0px;bottom: 0px; left: 0px; right: 0px; background: #5F6440; opacity: 50%;">
    </div>
    <div style=" height: 450px;position: absolute; left: 40%; top: 50%; opacity: 1; background: #fff; border-radius: 5px; border: 2px solid #56D262; ">
        <h2 style=" text-align: center;">Rating</h2>
        <button style="position: absolute; right: 10px; top: 5px; " onclick="document.getElementById('stupidnetbeans').style.display = 'none'">&times;</button> 
        <div style="padding: 0 50 0 50">
                <form action="RateProductController">
                <p>So many star for you only</p>
                <input type="radio" id="1s" name="rate1" value="0.5">
                <label for="1s"><span class="fa fa-star-half-o checked"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span></label><br>
                <input type="radio" id="2s" name="rate1" value="1">
                <label for="2s"><span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span></label><br>
                  <input type="radio" id="3s" name="rate1" value="1.5">
                <label for="3s"><span class="fa fa-star checked"></span>
                    <span class="fa fa-star-half-o checked"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span></label><br>
                  <input type="radio" id="4s" name="rate1" value="2">
                <label for="4s"><span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span></label><br>
                  <input type="radio" id="5s" name="rate1" value="2.5">
                <label for="5s"><span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star-half-o checked"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span></label><br>
                  <input type="radio" id="6s" name="rate1" value="3">
                  <label for="6s"><span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span></label><br>
                  <input type="radio" id="7s" name="rate1" value="3.5">
                  <label for="7s"><span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star-half-o checked"></span>
                    <span class="fa fa-star"></span></label><br>
                  <input type="radio" id="8s" name="rate1" value="4">
                  <label for="8s"><span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span></label><br>
                  <input type="radio" id="9s" name="rate1" value="4.5">
                  <label for="9s"><span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star-half-o checked"></span></label><br>
                  <input type="radio" id="10s" name="rate1" value="5">
                  <label for="10s"><span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span></label><br>
                    <input type="hidden" name="txtID" value="${requestScope.PRODUCT.id}">
                    <input type="hidden" name="userId" value="${sessionScope.LOGIN_USER.id}">
                    <button type="submit" style="background-color: #fff; border-radius: 10px; color: #56d262 ; width: 100px;height: 60px;margin-left: 48px; border: 1px solid #56d262 ; ">Rate</button>
            </form>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/common/footer.jsp"%>
<script>
    document.getElementById("product_action_icon").onclick = () => {
        if (document.getElementById("product_action_option").style.display === "block") {
            document.getElementById("product_action_option").style.display = "none";
        } else if (document.getElementById("product_action_option").style.display === "none") {
            document.getElementById("product_action_option").style.display = "block";
        }
    };

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
