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
                    <div class="p-3 my-3" style="background-color: #fff; border: 1px solid #D9D9D9;">
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
                        <a style="margin-left: 5px;" href="${pageScope.ToShop}">Asian Store</a> 
                        <hr style="height: 3px;"></hr>
                        <div class="d-flex">
                            <div class="col-2 d-flex justify-content-center"> 
                                <img src = assets/img/bo_Anchor.jpg style="width: 120px; height: 120px;">
                            </div>
                            <div class="col-6">
                                <div style="padding: 10px 0;">Sữa đặc Ông Thọ đỏ - Hộp 380g - Vinamilk eShop</div>
                                <form action="" class="col-3 my-2">
                                    <div class="d-flex align-items-center" style="border: 1px solid #000; font-size: 20px; text-align: center; border-radius: 5px;">
                                        <div class="dec button col-3">–</div>
                                        <div class="order_quantity col-6 px-0">
                                            <input type="number" class="order_quantity_holder" name="orderQuantity" style="width: 60px; height: 45px; text-align: center;" value="1">
                                        </div>
                                        <div class="inc button col-3">+</div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-2 d-flex justify-content-end align-items-center" style="font-weight: bold;">35.000đ</div>
                            <div class="col-2 d-flex justify-content-end align-items-center">
                                <button type="submit" class="remove_btn">Remove</button>
                            </div>
                        </div>
                        <hr style="height: 3px;"></hr>
                        <div class="d-flex">
                            <div class="col-2 d-flex justify-content-center"> 
                                <img src = assets/img/bo_Anchor.jpg style="width: 120px; height: 120px;">
                            </div>
                            <div class="col-6">
                                <div style="padding: 10px 0;">Bộ 3 dao thép Nhíp 100% ( Chặt - Thái - Lọc)</div>
                                <form action="" class="col-3 my-2">
                                    <div class="d-flex align-items-center" style="border: 1px solid #000; font-size: 20px; text-align: center; border-radius: 5px;">
                                        <div class="dec button col-3">–</div>
                                        <div class="order_quantity col-6 px-0">
                                            <input type="number" class="order_quantity_holder" name="orderQuantity" style="width: 60px; height: 45px; text-align: center;" value="1">
                                        </div>
                                        <div class="inc button col-3">+</div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-2 d-flex justify-content-end align-items-center" style="font-weight: bold;">450.000đ</div>
                            <div class="col-2 d-flex justify-content-end align-items-center">
                                <button class="remove_btn" type="submit">Remove</button>
                            </div>
                        </div>
                        <hr style="height: 3px;"></hr>
                        <div class="d-flex">
                            <div class="col-2"></div>
                            <div class="col-6"></div>
                            <div class="col-2 d-flex justify-content-end align-items-center" style="font-weight: bold;">Total: 625.000đ</div>
                            <div class="col-2 d-flex justify-content-end align-items-center"></div>
                        </div>
                    </div>
                    <div class="p-3 my-3" style="background-color: #fff; border: 1px solid #D9D9D9;">
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
                        <a style="margin-left: 5px;" href="${pageScope.ToShop}">FPT Shop</a> 
                        <hr style="height: 3px;"></hr>
                        <div class="d-flex">
                            <div class="col-2 d-flex justify-content-center"> 
                                <img src = assets/img/bo_Anchor.jpg style="width: 120px; height: 120px;">
                            </div>
                            <div class="col-6">
                                <div style="padding: 10px 0;">Máy xay sinh tố Kangaroo</div>
                                <form action="" class="col-3 my-2">
                                    <div class="d-flex align-items-center" style="border: 1px solid #000; font-size: 20px; text-align: center; border-radius: 5px;">
                                        <div class="dec button col-3">–</div>
                                        <div class="order_quantity col-6 px-0">
                                            <input type="number" class="order_quantity_holder" name="orderQuantity" style="width: 60px; height: 45px; text-align: center;" value="1">
                                        </div>
                                        <div class="inc button col-3">+</div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-2 d-flex justify-content-end align-items-center" style="font-weight: bold;">1.250.000đ</div>
                            <div class="col-2 d-flex justify-content-end align-items-center">
                                <button type="submit" class="remove_btn">Remove</button>
                            </div>
                        </div>
                        <hr style="height: 3px;"></hr>
                        <div class="d-flex">
                            <div class="col-2"></div>
                            <div class="col-6"></div>
                            <div class="col-2 d-flex justify-content-end align-items-center" style="font-weight: bold;">Total: 1.250.000đ</div>
                            <div class="col-2 d-flex justify-content-end align-items-center"></div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end my-3">
                        <input class="last_button mx-2" id="edit_product_btn" type="submit" name="action" value="Clear All">
                        <a class="last_button" style="padding-top: 5px;" href="">Checkout</a>
                    </div>
                </div>
            </div>

            <c:forEach var="cartItem" items="${sessionScope.SESSION_CART.cartItems}" varStatus="cartItemIdx">
                <div class="row">
                    <div class="column">
                        <div class="card">
                            <h5>Product #${cartItemIdx.count}</h5>
                            <p>Product ID: ${cartItem.value.product.id}</p>
                            <p>You're trying to buy ${cartItem.value.quantity}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
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