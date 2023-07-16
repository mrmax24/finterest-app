<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    <%@include file='/WEB-INF/views/css/global.css' %>
    <%@include file='/WEB-INF/views/css/login.css' %>
</style>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="icon" type="image/svg+xml" href="/resources/public/favicon.svg">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;700&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sora:wght@300;500&display=swap"/>
  </head>
  <body>
    <div class="login">
      <div class="header">
        <div class="logodescription">
          <div class="logotype3">
            <div class="logo3">
              <div class="logo-child7"></div>
              <div class="logo-child8"></div>
              <div class="logo-child9"></div>
            </div>
            <b class="finterest3">finterest</b>
          </div>
          <img
            class="personal-finance-manager"
            alt=""
            src="/public/personal-finance-manager.svg" />
        </div>
        <div class="btns4">
          <button class="buttons11" id="buttons">
            <b class="button11">Sign up</b>
          </button>
          <button class="buttons12">
            <b class="button12">Sign in</b>
          </button>
        </div>
      </div>
      <form class="all-content2" method="post" action="${pageContext.request.contextPath}/login">
        <div class="htxt5">
          <h1 class="welcome-back">Welcome back</h1>
          <p class="sign-in-for">Sign in for smarter money management</p>
        </div>
        <div class="btnlink">
          <div class="input-field20">
            <b class="placeholder10">Email</b>
            <input
              class="input-field21"
              type="email"
              name="username"
              placeholder="example@email.com"
              maxlength
              minlength
              required
            />
          </div>
          <div class="fieldtxt">
            <div class="input-field20">
              <b class="placeholder10">Password</b>
              <input
                class="input-field23"
                type="password"
                name="password"
                placeholder="Create password"
                maxlength
                minlength="{4}"
                required
              />
            </div>
            <div class="forget-password">Forget Password?</div>
          </div>
        </div>
        <div class="btnlink">
          <button class="buttons13" type="submit">
            <b class="button13">Sign in</b>
          </button>
          <div style="font-size: 16px; color: red;">
                        <c:if test="${param.error != null}">
                            <p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
                        </c:if>
                    </div>
          <div class="txtbtn-link">
            <div class="dont-have-an">Don’t have an account?</div>
            <a class="sign-up" href="/register">Sign up</a>
          </div>
        </div>
      </form>
      <div class="bottom-txt">
        <div class="footer">
          <div class="copyright-2023">
            Copyright © 2023 Finterest Company. All rights reserved.
          </div>
          <div class="finterest-your-container">
            <b
              >Finterest - your ultimate personal money manager tool for budget
              control and expense management.
            </b>
            <span
              >Unlike other accounting software, Finterest is designed to be
              user-friendly and accessible to individuals of all backgrounds.
              Whether you're a busy professional or a homemaker, Finterest
              simplifies your financial routine, making money management a
              delightful experience.
            </span>
          </div>
        </div>
      </div>
    </div>

    <script>
      var buttons = document.getElementById("buttons");
      if (buttons) {
        buttons.addEventListener("click", function (e) {
          window.location.href = "/register";
        });
      }
    </script>
  </body>
</html>
