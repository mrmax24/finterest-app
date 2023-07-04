<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    <%@include file='/WEB-INF/views/css/global.css' %>
    <%@include file='/WEB-INF/views/css/register.css' %>
</style>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;700&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sora:wght@300&display=swap"/>
  </head>
  <body>
    <div class="register">
      <div class="header1">
        <div class="logodescription1">
          <div class="logotype1">
            <div class="logo1">
              <div class="rectangle-div"></div>
              <div class="logo-child1"></div>
              <div class="logo-child2"></div>
            </div>
            <b class="finterest1">finterest</b>
          </div>
          <img
            class="personal-finance-manager1"
            alt=""
            src="/webapp/public/personal-finance-manager.svg">
        </div>
        <div class="btns1">
          <button class="buttons3" primary>
            <b class="button3">Sign up</b>
          </button>
          <button class="buttons4" secondary id="buttons1">
            <b class="button4">Sign in</b>
          </button>
        </div>
      </div>
      <div class="all-content2">
        <div class="htxt1">
          <h1 class="welcome-to-finterest">Welcome to Finterest</h1>
          <p class="start-your-financial">
            Start your financial journey: Sign up for our personal finance
            manager
          </p>
        </div>
        <form class="all-content3" method="post" id="register" action="${pageContext.request.contextPath}/register">
          <div class="inputs1">
            <div class="names">
              <div class="input-field4">
                <b class="placeholder2">Name</b>
                <input
                  class="input-field5"
                  type="text"
                  name="login"
                  placeholder="Your name"
                  maxlength
                  minlength
                  required
                />
              </div>
            </div>
            <div class="input-field6">
              <b class="placeholder2">Email</b>
              <input
                class="input-field5"
                type="email"
                name="email"
                placeholder="example@email.com"
                maxlength
                minlength
                required
              />
            </div>
            <div class="htxt1">
              <div class="input-field6">
                <b class="placeholder2">Password</b>
                <input
                  class="input-field9"
                  type="password"
                  name="password"
                  placeholder="Create password"
                  minlength="8"
                  required
                />
              </div>
              <div class="icontxt">
                <img class="icon-info" alt="" src="/webapp/public/icon--info.svg">
                <div class="passwords-must-have-container">
                  <span class="passwords-must-have">Passwords must have at least</span>
                  <b class="character-and-has">8 characters and include lowercase, uppercase, number, and a special character</b>
                </div>
              </div>
            </div>
          </div>
          <div class="inputs1">
            <button class="buttons5" type="submit">
              <b class="button5">Sign up</b>
            </button>
            <div class="txtbtn-link1">
              <div class="already-have-an">Already have an account?</div>
              <div class="sign-in" id="signInText">Sign in</div>
            </div>
          </div>
        </form>
      </div>
      <div class="bottom-txt1">
        <div class="footer1">
          <div class="copyright-20231">
            Copyright © 2023 Finterest Company. All rights reserved.
          </div>
          <div class="finterest-your-container1">
            <b>Finterest - your ultimate personal money manager tool for budget control and expense management.</b>
            <span>Unlike other accounting software, Finterest is designed to be user-friendly and accessible to individuals of all backgrounds. Whether you're a busy professional or a homemaker, Finterest simplifies your financial routine, making money management a delightful experience.</span>
          </div>
        </div>
      </div>
    </div>

    <script>
      var buttons1 = document.getElementById("buttons1");
      if (buttons1) {
        buttons1.addEventListener("click", function (e) {
          window.location.href = "/";
        });
      }

      var signInText = document.getElementById("signInText");
      if (signInText) {
        signInText.addEventListener("click", function (e) {
          window.location.href = "/";
        });
      }
    </script>
  </body>
</html>
