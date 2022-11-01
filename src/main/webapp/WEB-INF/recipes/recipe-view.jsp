<%-- 
    Document   : viewRecipe
    Created on : Oct 11, 2022, 1:11:37 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View A Recipe - BakeNow</title>
        <link rel="stylesheet" href="assets/css/recipes/recipe-view.css">
    </head>
    <body>
        <%@include file="/WEB-INF/common/header.jsp"%>
        <c:url var="toProfile" value="MainController?action=NavToProfile"/>
        <c:url var="toEditRecipe" value="MainController?action=NavToEditRecipe"/>
        <c:url var="toRateRecipe" value="MainController?action=NavToRateRecipe"/>
        <div id="page_view-recipe" class="main-container py-3">
            <div class="row">
                <div class="recipe_info col-7"">
                    <div class="recipe_info_container">
                        <div class="recipe_info_title" style="font-size: 30px;">${requestScope.RECIPE.title}Bánh Kem Socola Topping Dâu</div>
                        <div class="recipe-star py-2 mx-0">
                            <span class="fa fa-star fa-star-sized checked"></span>
                            <span class="fa fa-star fa-star-sized checked"></span>
                            <span class="fa fa-star fa-star-sized checked"></span>
                            <span class="fa fa-star fa-star-sized"></span>
                            <span class="fa fa-star fa-star-sized"></span>
                            <span class="recipe_text"  style="margin-top: 0px; padding-left: 0px; padding-right: 0px;">(25)</span>
                        </div>
                        <div class="recipe_author d-inline-block" style="width: 75%; text-align: left; margin: 0;">
                            <svg width="25" height="25" viewBox="0 0 35 35" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M17.5 15.5556C19.4778 15.5556 21.4112 15.0994 23.0557 14.2448C24.7002 13.3901 25.9819 12.1754 26.7388 10.7542C27.4957 9.333 27.6937 7.76915 27.3079 6.26041C26.922 4.75167 25.9696 3.3658 24.5711 2.27806C23.1725 1.19032 21.3907 0.449558 19.4509 0.149451C17.5111 -0.150656 15.5004 0.00336996 13.6732 0.592051C11.8459 1.18073 10.2841 2.17763 9.1853 3.45668C8.08649 4.73573 7.5 6.23948 7.5 7.77778C7.5 9.84057 8.55357 11.8189 10.4289 13.2775C12.3043 14.7361 14.8478 15.5556 17.5 15.5556ZM17.5 3.88889C18.4889 3.88889 19.4556 4.11697 20.2779 4.54429C21.1001 4.9716 21.741 5.57896 22.1194 6.28957C22.4978 7.00017 22.5969 7.78209 22.4039 8.53646C22.211 9.29083 21.7348 9.98377 21.0355 10.5276C20.3363 11.0715 19.4454 11.4419 18.4755 11.5919C17.5055 11.742 16.5002 11.665 15.5866 11.3706C14.673 11.0763 13.8921 10.5779 13.3427 9.93833C12.7932 9.29881 12.5 8.54693 12.5 7.77778C12.5 6.74638 13.0268 5.75723 13.9645 5.02792C14.9021 4.29861 16.1739 3.88889 17.5 3.88889Z" fill="#56D262"/>
                            <path d="M17.5 19.4443C12.8587 19.4443 8.40752 20.8784 5.12563 23.4309C1.84374 25.9835 0 29.4456 0 33.0554C0 33.5711 0.263393 34.0657 0.732234 34.4304C1.20107 34.795 1.83696 34.9999 2.5 34.9999C3.16304 34.9999 3.79893 34.795 4.26777 34.4304C4.73661 34.0657 5 33.5711 5 33.0554C5 30.477 6.31696 28.0041 8.66117 26.1808C11.0054 24.3575 14.1848 23.3332 17.5 23.3332C20.8152 23.3332 23.9946 24.3575 26.3388 26.1808C28.683 28.0041 30 30.477 30 33.0554C30 33.5711 30.2634 34.0657 30.7322 34.4304C31.2011 34.795 31.837 34.9999 32.5 34.9999C33.163 34.9999 33.7989 34.795 34.2678 34.4304C34.7366 34.0657 35 33.5711 35 33.0554C35 29.4456 33.1563 25.9835 29.8744 23.4309C26.5925 20.8784 22.1413 19.4443 17.5 19.4443Z" fill="#56D262"/>
                            </svg>

                            <a style="margin-left: 5px;" href="${toProfile}">${requestScope.RECIPE.authorName}DuyBuiVu</a> 
                        </div>
                        <div class="recipe_action d-inline-block" style="width: 20%; text-align: end;">
                            <svg id="recipe_action_icon" width="6" height="22" viewBox="0 0 6 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <circle cx="3" cy="11" r="3" fill="black"/>
                            <circle cx="3" cy="19" r="3" fill="black"/>
                            <circle cx="3" cy="3" r="3" fill="black"/>
                            </svg>

                            <div id="recipe_action_option" style="position: absolute; top: 140px; left: 700px; width: 90px; display: none;">
                                <ul style="list-style-type: none; text-align: center; padding: 5px;">
                                    <a href="${pageScope.toEditRecipe}"><li>Edit</li></a>
                                    <a href=""><li>Hide</li></a>
                                    <a href=""><li>Delete</li></a>
                                </ul>
                            </div>
                        </div>
                        <div class="recipe_img py-2 d-flex justify-content-center">
                            <image src="assets/img/img_10.png" alt="recipe images" style="width: 256px; height: 256px;">
                        </div>
                        <c:url var="rateRecipe" value="MainController?action=NavToBlogHome"/>
                        <div class="rate_recipe py-2 d-flex justify-content-end">
                            <button type="button" class="rate-button btn" onclick="window.location.href = '${toRateRecipe}';">Rate this recipe</button>
                        </div>

                        <div class="recipe_instruction">

                            <div style="font-size: 24px; font-weight: bold; margin: 10px 0;">Instruction</div>
                            <c:forEach begin="1" end="5${requestScope.RECIPE.instruction.size()}">
                                <div style="font-size: 20px; font-weight: bold; padding: 10px;">Bước 1</div>
                                <p style="text-align: justify;">
                                    Thêm 40g bột yến mạch vào tô hỗn hợp chất lỏng, trộn đều đến khi không còn bột khô.
                                    Tiếp tục thêm 160g bột mì nguyên cám vào tô, trộn đều đến khi không còn bột khô rồi đậy màng bọc thực phẩm, cho bột nghỉ khoảng 5 phút.
                                    Lưu ý:
                                    - Không để bột nghỉ quá lâu sẽ làm bột bị chai, khô và chảy dầu
                                    - Nếu lần đầu làm có thể chia nhỏ số lượng ra để làm
                                </p>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="recipe_supply col-5 d-flex  justify-content-center">
                    <div class="recipe_supply_container col-10" style="border: 1px solid #D9D9D9; border-radius: 5px; margin-top: 100px; background-color: #fff; height: fit-content;">
                        <div class="recipe_supply_ingredient py-2 px-2">
                            <span class="py-2" style="font-size: 24px; font-weight: bold;">Ingredients</span>
                            <ul class="py-1 px-2 list-unstyled">
                                <c:forEach begin="1" end="5">
                                    <li class="recipe_supply_item d-flex py-1 px-1">
                                        <div class="col-9">Whipping Cream</div>
                                        <div class="col-3">200ml</div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="recipe_supply_tool py-2 px-2">
                            <span class="py-2" style="font-size: 24px; font-weight: bold;">Tools</span>
                            <ul class="py-1 px-2 list-unstyled">
                                <c:forEach begin="1" end="5">
                                    <li class="recipe_supply_item py-1 px-1">Máy đánh trứng</li>
                                    </c:forEach>
                            </ul>
                        </div>
                        <div class="add_shopping_list py-2 d-flex justify-content-center">
                            <button type="button" class="add_shopping_list_button btn" onclick="window.location.href = '${toShoppingList}';">Add to shopping list</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row recipe_comment">
                <div class="recipe_comment_view_container col-7 d-flex justify-content-left">
                    <div class="recipe_comment_view col-10">
                        <ul class="py-1 px-2 list-unstyled">
                            <c:forEach begin="1" end="3">
                                <li class="p-1 my-1" style="border: 1px solid #D9D9D9; border-radius: 5px; background-color: #fff;">
                                    <div class="d-flex" style="padding: 5px;">
                                        <img class="col-1 align-items-center" src="assets/img/profile_icon.png" alt="profile image" style="width:35px; height:35px; border: 1px solid #D9D9D9; border-radius: 100px;"/>
                                        <div class="col-11 px-1">
                                            <a href="${pageScope.ToProfile}">${requestScope.RECIPE.authorName}Nguyễn Văn A</a>
                                            <div class="reicpe_comment_view_time" style="font-size: 14px;">20/09/2022 15:35</div>
                                        </div>
                                    </div>
                                    <hr style="margin: 1px; color: #D9D9D9; height: 3px;">
                                    <div class="recipe_comment_view_content p-1">
                                        Đã thử và nhận ra bánh quá ngon đến nỗi ăn mấy ngày chưa hết!!!.
                                    </div>
                                    <div class="recipe_comment_reply py-2 d-flex justify-content-end">
                                        <button type="button" class="recipe_comment_reply_button btn px-2" style="width: 100px;" onclick="window.location.href = '${replyComment}';">Reply</button>
                                    </div>

                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="recipe_comment_add col-5 d-flex justify-content-center">
                    <div class="recipe_comment_add_container col-10 py-1" style="border: 1px solid #D9D9D9; border-radius: 5px; height: fit-content; background-color: #fff;">
                        <span class="py-2 px-2" style="font-size: 24px; font-weight: bold;">Leave your comment here</span>

                        <form class="p-2 mb-0" action="">
                            <div class="p-1"> 
                                <textarea type="text" style="height: 150px; vertical-align: text-top; border: 1px solid #D9D9D9;" class="col-12" name="commentContent" placeholder="Share your thought..."></textarea>
                            </div>
                            <div class="my-2 d-flex justify-content-end">
                                <input type="submit" class="px-2 recipe_comment_add_button" style="width: 100px; height: 45px;" name="action" value="Post">
                            </div>
                        </form>


                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/common/footer.jsp"%>
        <script>
            document.getElementById("recipe_action_icon").onclick = () => {
                if (document.getElementById("recipe_action_option").style.display === "block") {
                    document.getElementById("recipe_action_option").style.display = "none";
                } else if (document.getElementById("recipe_action_option").style.display === "none") {
                    document.getElementById("recipe_action_option").style.display = "block";
                }

            };
        </script>
    </body>
</html>
