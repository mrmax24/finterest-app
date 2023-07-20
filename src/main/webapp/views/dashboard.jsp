<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<style>
    <%@include file='/WEB-INF/views/css/global.css' %>
    <%@include file='/WEB-INF/views/css/dashboard.css' %>
</style>

<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="icon" type="image/svg+xml" href="/resources/public/favicon.svg">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;700&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sora:wght@300;500&display=swap"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0" />
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
  </head>
  <body>
    <div class="main">
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
             <ion-icon name="grid" role="img" class="md hydrated"></ion-icon>
             <a href="dashboard">Overview</a>
           </li>

           <li class="sitebar-item">
             <ion-icon name="card-outline" role="img" class="md hydrated"></ion-icon>
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
      <div class="main-part">
        <div class="hnotification-profile">
          <div class="h">Overviews</div>
          <div class="avanotification">
            <div class="avanamearrow">
              <i class="fas fa-circle-user fa-lg" style="color: #b9b9b9; font-size: 32px;"></i>
              <button class="namearrow" id="namearrow">
                <div class="alice-johnson"><c:out value="${pageContext.request.userPrincipal.name}"/></div>
                <button class="icon-arrowcircledown" id="iconArrowcircledown">
                  <img class="vector-icon" alt="" src="./public/vector.svg" />
                  <img class="vector-icon1" alt="" src="./public/vector1.svg" />
                </button>
              </button>
            </div>
          </div>
        </div>
        <div class="dashboards">
          <div class="all">
            <div class="left-part">
              <div class="cash">
                <div class="div">₴${currentBalance}</div>
                <div class="h1">Current balance</div>
              </div>
              <div class="my-accounts">
                <div class="hbtn-add">
                  <div class="h2">My accounts</div>
                  <button class="button-icon" id="buttonIcon">
                    <ion-icon name="add-outline" style="color: white"></ion-icon>
                  </button>
                </div>
                <div class="list-items">
                  <c:forEach var="account" items="${accounts}">
                    <div class="item-account">
                      <div class="h3">${account.name}</div>
                      <div class="div1">${account.balance}</div>
                    </div>
                  </c:forEach>
                </div>
                </div>
              </div>
              <div class="savings" id="savings">
                <div class="hbtn-add1">
                  <div class="h2">Savings</div>
                  <div class="button-small">
                    <div class="see-all">See all</div>
                    <ion-icon name="chevron-down-outline"></ion-icon>
                  </div>
                </div>
                <div class="list-items">
                  <div class="all-txtpercentage">
                    <div class="all-txt">
                      <div class="h-">
                        <div class="trip-to-vienna">Trip to Vienna</div>
                        <div class="div3">50%</div>
                      </div>
                      <div class="process">
                        <div class="process-child"></div>
                        <div class="process-item"></div>
                      </div>
                      <div class="price">
                        <b class="see-all">$1 500,00</b>
                        <div class="h6">of $3 000,00</div>
                      </div>
                    </div>
                  </div>
                  <div class="all-txtpercentage">
                    <div class="all-txt">
                      <div class="h-">
                        <div class="trip-to-vienna">MINI Cooper S 2016</div>
                        <div class="div3">13%</div>
                      </div>
                      <div class="process">
                        <div class="process-child"></div>
                        <div class="rectangle-div"></div>
                      </div>
                      <div class="price">
                        <b class="see-all">$1 580,00</b>
                        <div class="h6">of $12 000,00</div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="add-a-transactionlast">
            <form method="post" id="transaction" action="${pageContext.request.contextPath}/dashboard">
              <div class="add-a-transaction">
                <div class="htab">
                  <div class="h2">Create expense</div>
                  <div class="tab">
                    <div class="tab1">
                      <div class="see-all">Expense</div>
                    </div>
                    <div class="tab3">
                      <div class="see-all">Income</div>
                    </div>
                    <div class="tab3">
                      <div class="see-all">Transfer</div>
                    </div>
                  </div>
                </div>
                <div class="dropdowns">
                  <div class="labeldropdown">
                    <b class="from-account">From account</b>
                    <select class="dropdown" name="account" size="{58}">
                    <c:forEach items="${accounts}" var="account">
                      <option value="${account.id}">${account.name}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <div class="labeldropdown">
                    <b class="from-account">Category</b>
                    <select class="dropdown" name="category" size="{58}">
                    <c:forEach items="${allCategories}" var="category">
                      <option value="${category.id}">${category.category}</option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
                <div class="amountnotedate">
                  <div class="amountcurrency">
                    <div class="input-field">
                      <b class="placeholder">Amount*</b>
                      <input
                        class="input-field1"
                        type="number"
                        name="amount"
                        placeholder="0.00"
                        maxlength
                        minlength

                      />
                    </div>
                    <div class="labeldropdown2">
                      <b class="placeholder">Currency</b>
                      <select class="dropdown2" name="currency">
                      <option value="UAH">UAH</option>
                      <option value="USD">USD</option>
                      <option value="EUR">EUR</option>
                      </select>
                    </div>
                  </div>
                  <div class="notedate">
                    <div class="input-field2">
                      <b class="from-account">Note</b>
                      <input
                        class="input-field3"
                        type="text"
                        name="note"
                        placeholder="Write your note"
                        maxlength
                        minlength
                      />
                    </div>
                    <div class="input-field4">
                      <b class="from-account">Date</b>
                      <input
                        class="input-field3"
                        type="text"
                        id="date-input"
                        name="date"
                        maxlength
                        minlength
                        required
                      />
                    </div>
                  </div>
                </div>
                <div class="btns">
                  <div class="checkboxtxt">
                    <input class="checkbox" type="checkbox" />
                    <div class="see-all">Create template</div>
                  </div>
                  <div class="buttons-primary">
                    <input type="submit" class="button" value="Add expense">
                  </div>
                </div>
                </form>
              </div>
              <p>${insufficientAmountError}</p>
              <p>${accountIsNegativeError}</p>
              <p>${amountIsNotValidError}</p>
              <p>${amountIsNullError}</p>
              <div class="transactions">
                <div class="table-cell">
                  <div class="column">
                    <div class="cell">
                      <div class="date">Date</div>
                    </div>
                  </div>
                  <div class="column">
                    <div class="cell">
                      <div class="date1">Account</div>
                    </div>
                  </div>
                  <div class="column2">
                    <div class="cell2">
                      <div class="date">Category</div>
                    </div>
                  </div>
                  <div class="column">
                    <div class="cell">
                      <div class="date1">Note</div>
                    </div>
                  </div>
                  <div class="column4">
                    <div class="cell4">
                      <div class="date">Amount</div>
                    </div>
                  </div>
                  <div class="column4">
                    <div class="cell4">
                      <div class="date">Edit</div>
                    </div>
                  </div>
                </div>
                <c:forEach var="transaction" items="${allTransactions}" varStatus="loop">
                  <div class="table-cell1">
                    <div class="column">
                      <div class="cell">
                        <div class="date">${transaction.date}</div>
                      </div>
                    </div>
                    <div class="column">
                      <div class="cell">
                        <div class="date7">${transaction.account.name}</div>
                      </div>
                    </div>
                    <div class="column2">
                      <div class="cell2">
                        <b class="date">${transaction.transactionCategory.category}</b>
                      </div>
                    </div>
                    <div class="column">
                      <div class="cell">
                        <div class="date1">${transaction.note}</div>
                      </div>
                    </div>
                    <div class="column10">
                      <div class="cell4">
                        <div class="date">-₴${transaction.amount}</div>
                      </div>
                    </div>
                    <div class="column11">
                      <div class="cell4">
                        <button class="date11" id="date" onclick="openPopup(${loop.index})">Edit</button>
                      </div>
                    </div>
                  </div>

    <div id="popUpEdit${loop.index}" class="popup-overlay" style="display: none">
      <div class="pop-up-edit">
        <div class="hexit3">
          <div class="htxt3">
            <div class="h21">Edit transaction</div>
            <div class="change-transaction-data">Change transaction data</div>
          </div>
          <button class="buttons-exit" data-popup-index="1"><ion-icon name="close-outline"></ion-icon></button>
        </div>

        <form class="add-a-transaction1" method="post" id="edit" action="${pageContext.request.contextPath}/dashboard/edit/${transaction.id}">
          <div class="dropdowns2">
            <div class="labeldropdown6">
              <b class="label4">From account</b>
              <select class="dropdown6" name="account" size="{58}">
                <c:forEach items="${accounts}" var="account">
                 <option value="${account.id}">${account.name}</option>
                  </c:forEach>
              </select>
            </div>
            <div class="labeldropdown6">
              <b class="label4">Category</b>
              <select class="dropdown6" name="category">
              <c:forEach items="${allCategories}" var="category">
              <option value="${category.id}">${category.category}</option>
              </c:forEach>
              </select>
            </div>
          </div>
          <div class="amountnotedate1">
            <div class="amountcurrency1">
              <div class="input-field10">
                <b class="placeholder5">Amount*</b>
                <input
                  class="input-field11"
                  type="number"
                  name="amount"
                  placeholder="0.00"
                  maxlength
                  minlength

                />
              </div>
              <div class="labeldropdown8">
                <b class="placeholder5">Currency</b>
                <select class="dropdown8" name="currency">
                  <option value="UAH">UAH</option>
                  <option value="USD">USD</option>
                  <option value="EUR">EUR</option>
                </select>
              </div>
            </div>
            <div class="notedate1">
              <div class="input-field12">
                <b class="placeholder6">Note</b>
                <input
                  class="input-field13"
                  type="text"
                  name="note"
                  placeholder="Write your note"
                  maxlength
                  minlength
                />
              </div>
              <div class="input-field14">
                <b class="placeholder6">Date</b>
                <input
                  class="input-field13"
                  type="input"
                  id="date-input"
                  name="date"
                  maxlength
                  minlength
                  id="current-date"
                  current-date="date"
                />
              </div>
            </div>
            <button class="buttons-primary" type="submit">Save</button>
          </div>
         </form>


          <form method="post" action="${pageContext.request.contextPath}/dashboard/delete/${transaction.id}">
            <button class="buttons-delete" type="submit">Delete transaction</button>
          </form>
      </div>
    </div>
   </c:forEach>
      </div>
     </div>
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
              <button class="buttons-exit" data-popup-index="1"><ion-icon name="close-outline"></ion-icon></button>
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
              <button class="icon-exit8" id="popupiconExit">
                <div class="icon-exit9">
                 <ion-icon name="close-outline"></ion-icon>
                </div>
              </button>
            </div>
            <form method="post" id="add-dashboard-account" action="${pageContext.request.contextPath}/dashboard/add-account">
            <div class="create-new-account3">
              <div class="hinputs2">
                <div class="hinputs2">
                  <div class="inputs1">
                    <div class="input-field16">
                      <b class="placeholder8">Account name</b>
                      <input
                        class="input-field17"
                        type="text"
                        name="account_name"
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
                        type="text"
                        name="account_balance"
                        placeholder="Enter the amount"
                        maxlength
                        minlength
                        required
                      />
                    </div>
                  </div>
                </div>
              </div>
              <button class="buttons10" type="submit">
                <b class="button10">Create</b>
              </button>
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

      var sitebarItemContainer1 = document.getElementById("sitebarItemContainer1");
      if (sitebarItemContainer1) {
        sitebarItemContainer1.addEventListener("click", function (e) {
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

      var buttonIcon = document.getElementById("buttonIcon");
      if (buttonIcon) {
        buttonIcon.addEventListener("click", function () {
          var popup = document.getElementById("popUpAddAccount");
          if (!popup) return;
          var popupStyle = popup.style;
          if (popupStyle) {
            popupStyle.display = "flex";
            popupStyle.zIndex = 100;
            popupStyle.backgroundColor = "rgba(113, 113, 113, 0.3)";
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

      function openPopup(index) {
                var popup = document.getElementById("popUpEdit" + index);
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
          // Initialize the date picker
          flatpickr("#date-input", {
              dateFormat: "d-m-Y",
              defaultDate: new Date()
          });
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
