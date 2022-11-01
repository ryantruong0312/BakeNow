<%-- 
    Document   : recipe-rate
    Created on : 17 Oct 2022, 02:37:42
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/shared.jsp"%>
<link rel="stylesheet" href="assets/css/popup/recipe-rate.css"/>
<body class="d-flex justify-content-center align-items-center">
    <div class="rating-form">
        <img src="assets/img/logo.png" height="100" width="250"></img>
        <a id="close_btn" href="#">
            <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M15 15L9 9M15 9L9 15" stroke="black" stroke-width="2" stroke-linecap="round"/>
                <path d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22Z" stroke="black" stroke-width="2"/>
            </svg>
        </a>
        <div style="font-size: 24px; font-weight: bold;">Bánh Kem Chocolate Topping Dâu</div>
        <hr style="height: 3px; color: #000; margin: 20px;"></hr>
        <div style="font-size: 20px;">Rate this recipe</div>
        <form action="#">
            <div class="d-flex justify-content-center" style="width: 500px;">
                <fieldset class="rating ">
                    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
                    <input type="radio" id="star4half" name="rating" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
                    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
                    <input type="radio" id="star3half" name="rating" value="3 and a half" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
                    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
                    <input type="radio" id="star2half" name="rating" value="2 and a half" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
                    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
                    <input type="radio" id="star1half" name="rating" value="1 and a half" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
                    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
                    <input type="radio" id="starhalf" name="rating" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
                </fieldset>
            </div>
            <input type="submit" name="action" value="Submit">
        </form>
    </div>
</body>
