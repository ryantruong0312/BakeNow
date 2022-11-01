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
                    <div class="d-flex justify-content-center my-3 py-3" style="background-color: #fff;">
                        <form action="" class="edit_product_form col-10">
                            <div class="py-2 details" > 
                                <span style="font-size: 24px; font-weight: bold;">Title</span> 
                                <input type="text" style="width: 500px; padding-left: 10px;" name="title" value="${param.PRODUCT.title}Bơ Anchor cắt sẵn" required="">
                            </div>
                            <div class="py-2 d-flex justify-content-center">
                                <div class="col-4 py-2">
                                    <image src="assets/img/bo_Anchor.jpg" style="height: 256px; width: 256px; display: block; margin: 0 auto; border-radius: 5px;">
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
                                        <input type="text" name="productOrigin" required="" value="${param.PRODUCT.origin}New Zealand" style="margin-left: 30px;">
                                    </div>
                                    <div class="details details_category col-5">
                                        <span>Category</span>
                                        <select name="productCategory">
                                            <c:forEach var="m" begin="1" end="5">
                                                <option>Bột bắp</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                                <div class="details_row d-flex py-2">
                                    <div class="col-1"></div>
                                    <div class="details details_manuDate col-5" value="${param.PRODUCT.mnfDate}">
                                        <span>Mfg.Date</span>
                                        <input type="date" name="manuDate" required="" style="margin-left: 4px;">
                                    </div>
                                    <div class="details details_expDate col-5" value="${param.PRODUCT.expDate}" style="margin-left: 2px;">
                                        <span>Exp.Date</span>
                                        <input type="date" name="expDate">
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                                <div class="details_row d-flex py-2">
                                    <div class="col-1"></div>
                                    <div class="details details_price col-5">
                                        <span>Price</span>
                                        <input type="number" step="0.01" name="productPrice" required="" value="${param.PRODUCT.price}230000" style="margin-left: 37px;">
                                    </div>
                                    <div class="details details_stock col-5" style="margin-left: 27px;">
                                        <span>Stock</span>
                                        <input type="number" name="stockQuantity" required=""  value="${param.PRODUCT.stock}45">
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                            </div>
                            <div class="pt-3" > 
                                <div style="font-size: 24px; font-weight: bold;">Description</div>
                            </div>
                            <div class="details_description my-2">
                                <textarea class="py-2" type="text" style=" " name="title" value="${param.PRODUCT.desc}Bơ khối Anchor cắt sẵn là bơ động vật được sử dụng nhiều trong làm bánh. Hàm lượng chất béo cao, ngậy thơm ngon là thành phần cơ bản để làm cốt bánh gatauex, bánh bông lan, bánh cuộn, bánh quy. Ngoài ra bơ còn được dùng để đánh trang trí kem bơ cho bánh gato, sắc nét và ngậy kem.
                                          Lưu ý: Sản phẩm chỉ ship tại Hà Nội và Hồ Chí Minh
                                          Đặc điểm nổi bật của sản phẩm:
                                          Màu sắc: vàng nhạt, hương vị kem tươi 
                                          Bơ anchor được cắt và đóng gói theo từng khối lượng cắt.
                                          Bơ được dùng và sử dụng rất nhiều trong làm bánh đó nha, đa phần các loại bánh đều cần dùng đến bơ.
                                          Do bơ cần bảo quản mát từ nhiệt độ 0 độ C đến -20 độ C nên bơ chỉ được giao hàng trong khu vực nội thành và chuyển hàng đi xa được 
                                          Có rất nhiều loại bơ khác nhau như có bơ động vật, thực vật với mỗi loại bơ sẽ có những ưu điểm và được dùng cho các loại bánh khác nhau. Bơ Anchor là bơ động vật với hàm lượng chất béo cao, thơm ngậy được sử dụng rất nhiều nên bạn có thể hoàn toàn yên tâm." required=""></textarea>
                            </div>
                            <div class="d-flex justify-content-end my-3">
                                <input class="last_button mx-2" id="edit_product_btn" type="submit" name="action" value="Edit">
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
