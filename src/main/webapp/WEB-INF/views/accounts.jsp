<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
    <%@include file='/WEB-INF/views/css/global.css' %>
    <%@include file='/WEB-INF/views/css/accounts.css' %>
</style>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
        <link rel="icon" type="image/svg+xml" href="/resources/public/favicon.svg">
        <link rel="stylesheet" href="./accounts-1440.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;700&display=swap"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sora:wght@300;500&display=swap"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0" />
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
  </head>
  <body>
      <div class="accounts-1440">
        <nav class="site-bar">
          <div class="logotype">
            <div class="logo">
              <div class="logo-child"></div>
              <div class="logo-item"></div>
              <div class="logo-inner"></div>
            </div>
            <b class="finterest">finterest</b>
          </div>
          <ul class="side-bar">
            <li class="sitebar-item">
              <ion-icon name="grid-outline" role="img" class="md hydrated"></ion-icon>
              <a href="dashboard">Overview</a>
            </li>

            <li class="sitebar-item">
              <ion-icon name="card" role="img" class="md hydrated"></ion-icon>
              <a href="accounts">Accounts</a>
            </li>

            <li class="sitebar-item">
              <ion-icon name="stats-chart-outline" role="img" class="md hydrated"></ion-icon>
              <a href="report">Reports</a>
            </li>

            <li class="sitebar-item">
              <ion-icon name="swap-vertical-outline" role="img" class="md hydrated"></ion-icon>
              <a href="#">Transaction</a>
            </li>

            <li class="sitebar-item">
              <ion-icon name="sparkles-outline" role="img" class="md hydrated"></ion-icon>
              <a href="#">Savings</a>
            </li>

            <li class="sitebar-item">
              <ion-icon name="wallet-outline" role="img" class="md hydrated"></ion-icon>
              <a href="#">Budgets</a>
            </li>

            <li class="sitebar-item">
              <ion-icon name="settings-outline" role="img" class="md hydrated"></ion-icon>
              <a href="#">Settings</a>
            </li>
          </ul>
        </nav>


      <div class="main-part2">
        <div class="hnotification-profile2">
          <div class="h16">Accounts</div>
          <div class="avanotification2">
            <div class="avanamearrow2">
              <i class="fas fa-circle-user fa-lg" style="color: #b9b9b9; font-size: 32px;"></i>

              <button class="namearrow2" id="namearrow">
                <div class="exampleemailcom"><c:out value="${pageContext.request.userPrincipal.name}"/></div>
                <button class="icon-arrowcircledown2" id="iconArrowcircledown">
                  <img class="vector-icon4" alt="" src="./public/vector.svg" />

                  <img class="vector-icon5" alt="" src="./public/vector1.svg" />
                </button>
              </button>
            </div>
          </div>
        </div>
        <div class="all-content1">
          <div class="txtbtn">
            <div class="here-you-can">
              Here you can easily access, change and even delete information
              about your financial accounts as needed. Whether you want to
              review your current information, make changes or delete certain
              details, it's all possible here.
            </div>
            <button class="buttons-primary" id="buttons">Add account <ion-icon name="add-outline"></ion-icon></button>
          </div>
          <div class="list7">
            <div class="balance">
              <div class="cash1">
                <h2 class="h17">current balance</h2>
                <h1 class="h18">₴${totalBalance}</h1>
              </div>
            </div>
            <p>${accountIsNegativeError}</p>
            <div class="account-balance">
              <div class="cash2">
                <div class="txt">
                  <c:forEach var="account" items="${accounts}" varStatus="loop">
                    <div class="hname">
                      <h2 class="h17">${account.name}</h2>
                      <p class="manual-input" style="padding-left: 0px;">Manual input</p>
                    </div>
                    <div class="btn-editsum">
                      <div class="sum">
                        <div class="div10">$</div>
                        <p class="p" style="padding-left: 0px;">${account.balance}</p>
                      </div>
                      <button class="button-icon1" onclick="openPopup(${loop.index})">
                        <ion-icon name="pencil-outline"></ion-icon>
                      </button>
                      <div id="popUpEditAccount${loop.index}" class="popup-overlay" style="display: none">
                        <div class="pop-up-edit-account">
                          <div class="hexit1">
                            <div class="htxt1">
                              <div class="h15">Account actions</div>
                              <div class="change-account-data">Change account data</div>
                            </div>
                            <div class="icon-exit">
                            <button class="buttons-exit" data-popup-index="1"><ion-icon name="close-outline"></ion-icon>
                            </button>
                            </div>
                         <form method="post" id="edit-account" action="${pageContext.request.contextPath}/accounts/edit/${account.id}">
                          </div>
                            <div class="create-new-account1">
                              <div class="hinputs">
                                <div class="hinputs">
                                  <div class="inputs">
                                    <div class="input-field6">
                                      <b class="placeholder3">Account name</b>
                                      <input
                                        class="input-field7"
                                        type="text"
                                        name="nameToChange"
                                        placeholder="Your account name"
                                        maxlength
                                        minlength
                                      />
                                    </div>
                                    <div class="input-field6">
                                      <b class="placeholder3">Account balance</b>
                                      <input
                                        class="input-field7"
                                        type="number"
                                        name="amountToChange"
                                        placeholder="Enter the amount"
                                        maxlength
                                        minlength
                                        required
                                      />
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <button class="buttons-primary custom-width">Save changes</button>
                            </div>
                          </form>
                          <form method="post" id="edit-account" action="${pageContext.request.contextPath}/accounts/delete/${account.id}">
                            <div class="inputs">
                              <button class="buttons-delete custom-width">Delete account</button>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
                  </c:forEach>
                </div>
              </div>
            </div>
        </div>
      </div>
    </div>

    <div id="popUpLogOut" class="popup-overlay" style="display: none">
      <div class="pop-up-log-out">
        <div class="hexit2">
          <div class="htxt2">
            <div class="h20">Name</div>
            <div class="exampleemailcom"><c:out value="${pageContext.request.userPrincipal.name}"/></div>
          </div>
          <button class="icon-exit4" id="popupiconExit">
                          <div class="icon-exit5">
                            <ion-icon name="close-outline"></ion-icon>
                          </div>
                        </button>
        </div>
        <div class="create-new-account2">
          <button class="buttons7">
              <b class="button7"><a href="${pageContext.request.contextPath}/logout" class="logout-btn" style="color: #fff" ">Log out</a></b>
          </button>
        </div>
      </div>
    </div>
    <div id="popUpAddAccount" class="popup-overlay" style="display: none">
      <div class="pop-up-add-account">
        <div class="hexit4">
          <div class="htxt4">
            <div class="h22">Add account</div>
            <div class="enter-your-account">Enter your account details</div>
          </div>
          <button class="buttons-exit" data-popup-index="1"><ion-icon name="close-outline"></ion-icon></button>
          <form method="post" id="account" action="${pageContext.request.contextPath}/accounts">
        </div>

        <div class="create-new-account3">
          <div class="hinputs2">
            <div class="hinputs2">
              <div class="inputs1">
                <div class="input-field16">
                  <b class="placeholder8">Account name</b>
                  <input
                    class="input-field17"
                    type="text"
                    name="name"
                    placeholder="Your account name"
                    maxlength
                    minlength
                    required
                  />
                </div>
                <div class="input-field16">
                  <b class="placeholder8">Starting balance </b>
                  <input
                    class="input-field17"
                    type="number"
                    name="balance"
                    placeholder="Enter the amount"
                    maxlength
                    minlength
                    required
                  />
                </div>
              </div>
            </div>
          </div>
          <button class="buttons-primary custom-width" type="submit">Create</button>
        </div>
      </div>
    </div>
    </form>


    <script>
      var popupiconExit = document.getElementById("popupiconExit");
      if (popupiconExit) {
        popupiconExit.addEventListener("click", function (e) {
          var popup = e.currentTarget.parentNode;
          function isOverlay(node) {
            return !!(
              node &&
              node.classList &&
              node.classList.contains("popup-overlay")
            );
          }
          while (popup && !isOverlay(popup)) {
            popup = popup.parentNode;
          }
          if (isOverlay(popup)) {
            popup.style.display = "none";
          }
        });
      }

      var popupiconExit = document.getElementById("popupiconExit");
      if (popupiconExit) {
        popupiconExit.addEventListener("click", function (e) {
          var popup = e.currentTarget.parentNode;
          function isOverlay(node) {
            return !!(
              node &&
              node.classList &&
              node.classList.contains("popup-overlay")
            );
          }
          while (popup && !isOverlay(popup)) {
            popup = popup.parentNode;
          }
          if (isOverlay(popup)) {
            popup.style.display = "none";
          }
        });
      }

      var popupiconExit = document.getElementById("popupiconExit");
      if (popupiconExit) {
        popupiconExit.addEventListener("click", function (e) {
          var popup = e.currentTarget.parentNode;
          function isOverlay(node) {
            return !!(
              node &&
              node.classList &&
              node.classList.contains("popup-overlay")
            );
          }
          while (popup && !isOverlay(popup)) {
            popup = popup.parentNode;
          }
          if (isOverlay(popup)) {
            popup.style.display = "none";
          }
        });
      }

      var sitebarItemContainer = document.getElementById("sitebarItemContainer");
      if (sitebarItemContainer) {
        sitebarItemContainer.addEventListener("click", function (e) {
          window.location.href = "./reports-1440.html";
        });
      }

      var iconArrowcircledown = document.getElementById("iconArrowcircledown");
      if (iconArrowcircledown) {
        iconArrowcircledown.addEventListener("click", function () {
          var popup = document.getElementById("popUpLogOut");
          if (!popup) return;
          var popupStyle = popup.style;
          if (popupStyle) {
            popupStyle.display = "flex";
            popupStyle.zIndex = 100;
            popupStyle.backgroundColor = "rgba(113, 113, 113, 0.2)";
            popupStyle.alignItems = "center";
            popupStyle.justifyContent = "center";
          }
          popup.setAttribute("closable", "");

          var onClick =
            popup.onClick ||
            function (e) {
              if (e.target === popup && popup.hasAttribute("closable")) {
                popupStyle.display = "none";
              }
            };
          popup.addEventListener("click", onClick);
        });
      }

      var namearrow = document.getElementById("namearrow");
      if (namearrow) {
        namearrow.addEventListener("click", function () {
          var popup = document.getElementById("popUpLogOut");
          if (!popup) return;
          var popupStyle = popup.style;
          if (popupStyle) {
            popupStyle.display = "flex";
            popupStyle.zIndex = 100;
            popupStyle.backgroundColor = "rgba(113, 113, 113, 0.2)";
            popupStyle.alignItems = "center";
            popupStyle.justifyContent = "center";
          }
          popup.setAttribute("closable", "");

          var onClick =
            popup.onClick ||
            function (e) {
              if (e.target === popup && popup.hasAttribute("closable")) {
                popupStyle.display = "none";
              }
            };
          popup.addEventListener("click", onClick);
        });
      }

      var buttons = document.getElementById("buttons");
      if (buttons) {
        buttons.addEventListener("click", function () {
          var popup = document.getElementById("popUpAddAccount");
          if (!popup) return;
          var popupStyle = popup.style;
          if (popupStyle) {
            popupStyle.display = "flex";
            popupStyle.zIndex = 100;
            popupStyle.backgroundColor = "rgba(113, 113, 113, 0.2)";
            popupStyle.alignItems = "center";
            popupStyle.justifyContent = "center";
          }
          popup.setAttribute("closable", "");

          var onClick =
            popup.onClick ||
            function (e) {
              if (e.target === popup && popup.hasAttribute("closable")) {
                popupStyle.display = "none";
              }
            };
          popup.addEventListener("click", onClick);
        });
      }



      </script>

      <script>
        function openPopup(index) {
          var popup = document.getElementById("popUpEditAccount" + index);
          if (!popup) return;
          var popupStyle = popup.style;
          if (popupStyle) {
            popupStyle.display = "flex";
            popupStyle.zIndex = 100;
            popupStyle.backgroundColor = "rgba(113, 113, 113, 0.2)";
            popupStyle.alignItems = "center";
            popupStyle.justifyContent = "center";
          }
          popup.setAttribute("closable", "");

          var onClick = popup.onClick || function (e) {
            if (e.target === popup && popup.hasAttribute("closable")) {
              popupStyle.display = "none";
            }
          };
          popup.addEventListener("click", onClick);
        }
      </script>
            <script>

              const exitButtons = document.querySelectorAll('.buttons-exit');

              exitButtons.forEach(button => {
                button.addEventListener('click', () => {
                  const popup = button.closest('.popup-overlay');
                  popup.style.display = 'none';
                });
              });
            </script>
  </body>
</html>
