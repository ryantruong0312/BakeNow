<%-- 
    Document   : shop-profile
    Created on : 17 Oct 2022, 02:53:08
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="assets/css/profile/shop-profile-view.css">

        <title>View Shop Profile - BakeNow</title>
    </head>
    <body>  
        <%@include file="/WEB-INF/common/header.jsp"%>
        <div class="container" style="margin-top: 50px;">
            <div class="row">
                <div class="col-9 pb-5">
                    <h3>MY STORE</h3>
                </div>
                <div class="col-3" style="">
                    <c:if test="${sessionScope['LOGIN_USER'].roleId == 3}">
                        <a class="create_recipe_btn" style="" href="MainController?action=NavToAddProduct&shopId=${sessionScope.LOGIN_SHOP.id}">
                            <div>
                                <i class="bi bi-plus-circle" style="font-size: 30px;"></i>
                            </div>
                            <div class="create_recipe_btn_text d-inline-block mx-2">
                                Add a Product 
                            </div>
                        </c:if>
                    </a>
                </div>
                <div class="col-3">
                    <div class="card">
                        <div class="d-flex align-items-start">
                            <div class="nav flex-column nav-pills me-3" id="nav-tab" role="tablist" aria-orientation="vertical">
                                <div class="card-header">
                                    <div class="col-12 d-flex justify-content-start align-items-center">

                                        <c:set var = "salary1" scope = "page" value = "${requestScope.SHOP_PROFILE.checkAvatarUrl()}"/>
                                        <c:choose>
                                            <c:when test = "${salary1 == true}">
                                                <img style="width: 100px;" src="assets/img/${requestScope.SHOP_PROFILE.getImgName()}" alt="shopavatar">
                                            </c:when>
                                            <c:when test = "${salary1 == false}">
                                                <img style="width: 100px;"  src="${requestScope.SHOP_PROFILE.getAvatarUrl()}" alt="shopavatar">
                                            </c:when>
                                        </c:choose> 


                                        <div class="ps-2">
                                            <h5>${requestScope.SHOP_PROFILE.getName()}</h5>
                                        </div>
                                    </div>
                                </div>

                                <button class="nav-link active" style="height: 100px" id="v-pills-profile-tab" data-bs-toggle="pill"
                                        data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile"
                                        aria-selected="true">Profile</button>

                                <button class="nav-link" style="height: 100px" id="v-pills-inventory-tab" data-bs-toggle="pill"
                                        data-bs-target="#v-pills-inventory" type="button" role="tab" aria-controls="v-pills-inventory"
                                        aria-selected="false">Inventory</button>

                                <button class="nav-link" style="height: 100px" id="v-pills-order-tab" data-bs-toggle="pill" data-bs-target="#v-pills-order"
                                        type="button" role="tab" aria-controls="v-pills-order" aria-selected="false">Order</button>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-9">
                    <div class="row">
                        <div class="tab-content" id="v-pills-tabContent">

                            <div class="tab-pane fade show active" id="v-pills-profile" role="tabpanel"
                                 aria-labelledby="v-pills-profile-tab">
                                <div class="col-12">
                                    <form action="EditShopProfileController" method="post" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-3">
                                                <div class="card">
                                                    <c:set var = "salary2" scope = "page" value = "${requestScope.SHOP_PROFILE.checkAvatarUrl()}"/>
                                                    <c:choose>
                                                        <c:when test = "${salary2 == true}">
                                                            <img style="width: 200px;" src="assets/img/${requestScope.SHOP_PROFILE.getImgName()}" alt="shopavatar">
                                                        </c:when>
                                                        <c:when test = "${salary2 == false}">
                                                            <img style="width: 200px;"  src="${requestScope.SHOP_PROFILE.getAvatarUrl()}" alt="shopavatar">
                                                        </c:when>
                                                    </c:choose> 
                                                </div>
                                                <input type="file" name="img" class="form-control">
                                            </div>
                                            <div class="col-9">
                                                <div class="row pb-5">
                                                    <c:set var = "rating" scope = "page" value = "${SHOP_PROFILE.getRating()}"/>
                                                    <c:choose>
                                                        <c:when test = "${rating <= 0.5}">
                                                            <div class="col-3">
                                                                <span class="fa fa-star-half-o checked"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                            </div>
                                                        </c:when>
                                                        <c:when test = "${rating <= 1}">
                                                            <div class="col-3">
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                            </div>
                                                        </c:when>
                                                        <c:when test = "${rating <= 1.5}">
                                                            <div class="col-3">
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star-half-o checked"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                            </div>
                                                        </c:when>
                                                        <c:when test = "${rating <= 2}">
                                                            <div class="col-3">
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                            </div>
                                                        </c:when>
                                                        <c:when test = "${rating <= 2.5}">
                                                            <div class="col-3">
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star-half-o checked"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                            </div>
                                                        </c:when>
                                                        <c:when test = "${rating <= 3}">
                                                            <div class="col-3">
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>
                                                            </div>
                                                        </c:when>
                                                        <c:when test = "${rating <= 3.5}">
                                                            <div class="col-3">
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star-half-o checked"></span>
                                                                <span class="fa fa-star"></span>
                                                            </div>
                                                        </c:when>
                                                        <c:when test = "${rating <= 4}">
                                                            <div class="col-3">
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star"></span>
                                                            </div>
                                                        </c:when>
                                                        <c:when test = "${rating <= 4.5}">
                                                            <div class="col-3">
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star-half-o checked"></span>
                                                            </div>
                                                        </c:when>
                                                        <c:when test = "${rating <= 5}">
                                                            <div class="col-3">
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                            </div>
                                                        </c:when>
                                                    </c:choose> 
                                                    <div class="col-6">
                                                        (${requestScope.SHOP_PROFILE.getRatingCount()})
                                                    </div>    
                                                    <div class="col-3">
                                                        products: ${requestScope.NOP}
                                                    </div>
                                                </div>
                                                <label for="about">About</label>
                                                <input style="height: 138px" type="text" class="form-control" id="comment" name="about" value ="${requestScope.SHOP_PROFILE.getDescription()}"
                                                       placeholder="Describe about your store">
                                            </div>
                                        </div>

                                        <div class="row pt-2">

                                            <div class="col-6">
                                                <label for="name" class="form-label">Display name</label>
                                                <input type="text" class="form-control" id="name" name="name" value="${requestScope.SHOP_PROFILE.getName()}">
                                                <label for="name" class="form-label">Email</label>
                                                <input type="email" class="form-control" id="email" name="email" value="${requestScope.SHOP_PROFILE.getEmail()}">
                                            </div>
                                            <div class="col-6">
                                                <label for="date" class="form-label">Establish Date</label>
                                                <input type="date" class="form-control" id="date" name="date" value="${requestScope.DOE}">
                                                <label for="name" class="form-label">Phone</label>
                                                <input type="text" class="form-control" id="phone" name="phone" value="${requestScope.SHOP_PROFILE.getPhone()}">
                                            </div>
                                            <div class="col-12 d-flex justify-content-center pt-2">
                                                <!--<p>Memeber since</p>-->
                                            </div>
                                            <div class="col-12 pt-5 d-flex justify-content-end">
                                                <c:if test="${sessionScope['LOGIN_USER'].roleId == 3}">
                                                    <button type="submit" class="btn btn-outline-dark">Edits</button>
                                                    <button type="button" class="btn btn-outline-dark ms-2">Cancel</button>                                            
                                                </c:if>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="v-pills-inventory" role="tabpanel" aria-labelledby="v-pills-inventory-tab">

                            <div class="card">
                                <nav class="nav justify-content-center">
                                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                        <button class="nav-link active"  id="nav-published-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-published" type="button" role="tab" aria-controls="nav-published"
                                                aria-selected="true">Published</button>
                                        <c:if test="${sessionScope.LOGIN_USER.roleId == 0 || sessionScope.LOGIN_USER.roleId == 1 ||sessionScope.LOGIN_USER.roleId == 3}">   
                                            <button class="nav-link"  id="nav-pending-tab" data-bs-toggle="tab" data-bs-target="#nav-pending"
                                                    type="button" role="tab" aria-controls="nav-pending" aria-selected="false">Pending</button>
                                            <button class="nav-link"  id="nav-restricted-tab" data-bs-toggle="tab" data-bs-target="#nav-restricted"
                                                    type="button" role="tab" aria-controls="nav-restricted" aria-selected="false">Restricted</button>
                                        </c:if>
                                    </div>
                                </nav>

                                <div class="tab-content" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="nav-published" role="tabpanel"
                                         aria-labelledby="nav-published-tab">
                                        <div style="margin-top: 0px" class="row row-cols-1 row-cols-md-3 g-4">
                                            <c:forEach var="product" items="${requestScope.SHOP_PRODUCTS_LIST}">
                                                <div class="col">
                                                    <div class="card h-100">
                                                        <c:set var = "salary" scope = "page" value = "${product.checkimgUrl()}"/>
                                                        <c:choose>
                                                            <c:when test = "${salary == true}">
                                                                <img src="assets/img/${product.getImgName()}" style="height: 256px" alt="product">
                                                            </c:when>
                                                            <c:when test = "${salary == false}">
                                                                <img src="${product.getImgUrl()}" style="height: 256px" alt="product">
                                                            </c:when>
                                                        </c:choose> 
                                                        <div class="card-body"> 
                                                            <a href="MainController?action=NavToViewProduct&txtID=${product.getId()}"><h5 class="card-title">${product.getName()}</h5></a>
                                                            <h6 class="card-rating">
                                                                <div class="product_info">
                                                                    <div class="product-star">
                                                                        <c:set var = "rating" scope = "page" value = "${product.getRating()}"/>
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
                                                                        <span class="product_text"  style="margin-top: 0px; padding-left: 0px; padding-right: 0px;">(${product.getReviewCount()})</span>
                                                                    </div>
                                                                </div>
                                                            </h6>
                                                            <p class="card-text">${product.getPrice()} $</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="nav-pending" role="tabpanel" aria-labelledby="nav-pending-tab">

                                        <div style="margin-top: 0px"  class="row row-cols-1 row-cols-md-3 g-4">
                                            <c:forEach var="pProduct" items="${requestScope.SHOP_PENDING_PRODUCTS_LIST}">
                                                <div class="col">
                                                    <div class="card h-100">
                                                        <c:set var = "salary" scope = "page" value = "${pProduct.checkimgUrl()}"/>
                                                        <c:choose>
                                                            <c:when test = "${salary == true}">
                                                                <img src="assets/img/${pProduct.getImgName()}" style="height: 256px" alt="product">
                                                            </c:when>
                                                            <c:when test = "${salary == false}">
                                                                <img src="${pProduct.getImgUrl()}" style="height: 256px" alt="product">
                                                            </c:when>
                                                        </c:choose> 
                                                        <div class="card-body"> 
                                                            <a href="MainController?action=NavToViewProduct&txtID=${pProduct.getId()}"><h5 class="card-title">${pProduct.getName()}</h5></a>
                                                            <h6 class="card-rating">
                                                                <div class="product_info">
                                                                    <div class="product-star">
                                                                        <c:set var = "rating" scope = "page" value = "${pProduct.getRating()}"/>
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
                                                                        <span class="product_text"  style="margin-top: 0px; padding-left: 0px; padding-right: 0px;">(${pProduct.getReviewCount()})</span>
                                                                    </div>
                                                                </div>
                                                            </h6>
                                                            <p class="card-text">${pProduct.getPrice()} $</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>


                                            <div class="tab-pane fade" id="nav-restricted" role="tabpanel" aria-labelledby="nav-restricted-tab">

                                                <div style="margin-top: 0px"  class="row row-cols-1 row-cols-md-3 g-4">
                                                    <c:forEach var="rProduct" items="${requestScope.SHOP_RESTRICTED_PRODUCTS_LIST}">
                                                        <div class="col">
                                                            <div class="card h-100">
                                                                <c:set var = "salary" scope = "page" value = "${pProduct.checkimgUrl()}"/>
                                                                <c:choose>
                                                                    <c:when test = "${salary == true}">
                                                                        <img src="assets/img/${pProduct.getImgName()}" style="height: 256px" alt="product">
                                                                    </c:when>
                                                                    <c:when test = "${salary == false}">
                                                                        <img src="${pProduct.getImgUrl()}" style="height: 256px" alt="product">
                                                                    </c:when>
                                                                </c:choose> 
                                                                <div class="card-body"> 
                                                                    <a href="MainController?action=NavToViewProduct&txtID=${rProduct.getId()}"><h5 class="card-title">${rProduct.getName()}</h5></a>
                                                                    <h6 class="card-rating">
                                                                        <div class="product_info">
                                                                            <div class="product-star">
                                                                                <c:set var = "rating" scope = "page" value = "${rProduct.getRating()}"/>
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
                                                                                <span class="product_text"  style="margin-top: 0px; padding-left: 0px; padding-right: 0px;">(${rProduct.getReviewCount()})</span>
                                                                            </div>
                                                                        </div>
                                                                    </h6>
                                                                    <p class="card-text">${rProduct.getPrice()} $</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="v-pills-order" role="tabpanel" aria-labelledby="v-pills-order-tab">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
            <%@include file="/WEB-INF/common/footer.jsp"%>
        </div>                                
    </body>
</html>
