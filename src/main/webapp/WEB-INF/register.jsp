<%-- 
    Document   : register
    Created on : Oct 12, 2022, 8:33:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/shared.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register - BakeNow</title>
        <link rel="stylesheet" href="assets/css/register.css">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </head>
    <body>
        <c:url var="toBlogHome" value="MainController?action=NavToBlogHome"/>
        <c:url var="toLogin" value="MainController?action=NavToLogin"/>
        <header style="background-color: #56D262; height: 120px;">
            <div style="width:1440px; margin:0 auto;">
                <a href="${toBlogHome}" aria-label="home" class="col-2 d-flex justify-content-left align-items-center">
                    <img src="assets/img/logo.png" height="100" width="250" alt="BakeNow logo"/>
                </a>
            </div>
        </header>
        <div class="subheader" style="width:100%; height:180px; margin:0 auto; background-image: url('assets/img/subheader.jpg'); background-size:cover;"></div>
        <div class="main-container">
            <div class="register_form_container">
                <div class="page_title">Sign Up</div>
                <form method="post" class="register_form">
                    <label for="username">User name</label>
                    <input type="text" name="username" required>
                    <label for="password">Password</label>
                    <input type="password" id="psw" name="password" required pattern="(?=.*\d)(?=.*[a-z]).{8,}" 
                           title="Must contain at least one number and one lowercase letter, and at least 8 or more characters">
                    <div id="message">
                        <div style="font-size: 18px;">Password must contain the following:</div>
                        <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
                        <p id="number" class="invalid">A <b>number</b></p>
                        <p id="length" class="invalid">Minimum <b>8 characters</b></p>
                    </div>
                    <label for="confirm">Confirm password</label>
                    <input type="password" name="confirm" required>
                    <div id="role">
                        <label for="role">Register as</label>
                        <div style="margin: 10px 0; text-align: center;">
                            <input type="radio" name="roleId" required>
                            <span>Baker</span>
                            <input type="radio" name="roleId">
                            <span>Retailer</span>
                        </div>
                    </div>
                    <input class="register_btn" type="submit" name="action" value="Register">
                    <div class="login_link" style="text-align: center;">
                        Already have an account? <a href="${toLogin}">Sign in</a>
                    </div>
                </form>
            </div>
        </div>
        <%@include file="/WEB-INF/common/footer.jsp"%>
        <script>
            var myInput = document.getElementById("psw");
            var letter = document.getElementById("letter");
            var number = document.getElementById("number");
            var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
            myInput.onfocus = function () {
                document.getElementById("message").style.display = "block";
            };

// When the user clicks outside of the password field, hide the message box
            myInput.onblur = function () {
                document.getElementById("message").style.display = "none";
            };

// When the user starts to type something inside the password field
            myInput.onkeyup = function () {
                // Validate lowercase letters
                var lowerCaseLetters = /[a-z]/g;
                if (myInput.value.match(lowerCaseLetters)) {
                    letter.classList.remove("invalid");
                    letter.classList.add("valid");
                } else {
                    letter.classList.remove("valid");
                    letter.classList.add("invalid");
                }

                // Validate numbers
                var numbers = /[0-9]/g;
                if (myInput.value.match(numbers)) {
                    number.classList.remove("invalid");
                    number.classList.add("valid");
                } else {
                    number.classList.remove("valid");
                    number.classList.add("invalid");
                }

                // Validate length
                if (myInput.value.length >= 8) {
                    length.classList.remove("invalid");
                    length.classList.add("valid");
                } else {
                    length.classList.remove("valid");
                    length.classList.add("invalid");
                }
            };
        </script>
    </body>
</html>
