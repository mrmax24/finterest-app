<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<style>
    <%@include file='/WEB-INF/views/css/global.css' %>
    <%@include file='/WEB-INF/views/css/report.css' %>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr@4.6.6/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr@4.6.6/dist/flatpickr.min.js"></script>

  </head>
  <body>
    <div class="reports-1440">
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
            <ion-icon name="card-outline" role="img" class="md hydrated"></ion-icon>
            <a href="accounts">Accounts</a>
          </li>

          <li class="sitebar-item">
            <ion-icon name="stats-chart" role="img" class="md hydrated"></ion-icon>
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

      <div class="main-part1">
              <div class="hnotification-profile1">
                <div class="h10">Reports</div>
                <div class="avanotification1">
                  <div class="category">
                    <i class="fas fa-circle-user fa-lg" style="color: #b9b9b9; font-size: 32px;"></i>
                    <button class="namearrow1" id="namearrow">
                      <div class="exampleemailcom"><c:out value="${pageContext.request.userPrincipal.name}"/></div>
                    </button>
                    <form id="expense-form" action="${pageContext.request.contextPath}/report" method="GET">
                  </div>
                </div>
              </div>

              <div class="all-content">
                <div class="dropdowns1">
                      <div class="labeldropdown3">
                        <div class="calendar-icon">
                          <i class="fa-regular fa-calendar fa-lg" style="color: #6f7a85;" id="calendarButton"></i>
                        </div>
                        <b class="label1">Select month</b>
                        <input type="text" id="dateInput" name="month" class="custom-input" placeholder="All time" readonly>
                      </div>
                      <div class="labeldropdown3">
                        <b class="label1">Accounts</b>
                        <select name="accountId" class="dropdown3">
                          <option value="-1" ${selectedAccountId == "" ? 'selected' : ''}>All accounts</option>
                           <c:forEach items="${accounts}" var="account">
                           <option value="${account.id}" ${account.id == selectedAccountId ? 'selected' : ''}>${account.name}</option>
                           </c:forEach>
                        </select>
                      </div>
                      <div class="labeldropdown3">
                        <b class="label1">Expense categories</b>
                        <select name="categoryId" class="dropdown3">
                        <option value="" ${selectedCategoryId == null ? 'selected' : ''}>All categories</option>
                        <c:forEach items="${categories}" var="category">
                        <option value="${category.id}" ${category.id == selectedCategoryId ? 'selected' : ''}>${category.category}</option>
                        </c:forEach>
                        </select>
                      </div>
                      <button class="buttons1" type="submit">
                        <b class="alice-johnson1">Apply</b>
                      </button>
              </div>
              </form>
          <div class="list-category">
                      <div class="cell12">
                        <div class="category">
                          <div class="category1">
                            <div class="category-child"></div>
                            <div class="h11">Expense category</div>
                          </div>
                          <div class="h11"></div>
                        </div>
                        <div class="h11">Amount</div>
                      </div>
                      <c:forEach items="${expenses}" var="expense">
                      <div class="list4">
                        <div class="cell13">
                          <div class="category">
                            <div class="category1">
                              <div class="category-item"></div>
                              <div class="h11">${expense[0]}</div>
                            </div>
                            <div class="div7">${expense[2]}%</div>
                          </div>
                          <div class="div8">${expense[1]}</div>
                        </div>
                        </c:forEach>
                        <div class="cell14">
                          <div class="category">
                            <div class="category1">
                              <div class="category-inner"></div>
                              <b class="h11">Total expenses</b>
                            </div>
                            <div class="div9">4%</div>
                          </div>
                          <b class="h11">-₴${totalExpense}</b>
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

      var sitebarItem = document.getElementById("sitebarItem");
      if (sitebarItem) {
        sitebarItem.addEventListener("click", function (e) {
          window.location.href = "/";
        });
      }

      var sitebarItem1 = document.getElementById("sitebarItem1");
      if (sitebarItem1) {
        sitebarItem1.addEventListener("click", function (e) {
          window.location.href = "./accounts-1440.html";
        });
      }

      var sitebarItemContainer = document.getElementById("sitebarItemContainer");
      if (sitebarItemContainer) {
        sitebarItemContainer.addEventListener("click", function (e) {
          window.location.href = "reports-1440.html";
        });
      }
      document.addEventListener("DOMContentLoaded", function () {
      const calendarButton = document.getElementById("calendarButton");
      const dateInput = document.getElementById("dateInput");

      // Initialize Flatpickr on the calendarButton
      flatpickr(calendarButton, {
      dateFormat: "m-Y",
      defaultDate: "today",
      onChange: function (selectedDates) {
      const selectedDate = selectedDates[0];

      // Update the input field with the selected date or "All time"
      const formattedDate = selectedDate ? formatDate(selectedDate) : "All time";
      dateInput.value = formattedDate;
      },
      });

      // Function to format the date as "mm-yyyy"
      function formatDate(date) {
      const month = date.getMonth() + 1;
      const year = date.getFullYear();
      const formattedMonth = month.toString().padStart(2, "0"); // Ensure double digits for the month

      return formattedMonth + "-" + year;
      }
      });

      // Function to handle the selected date option in the input field
      function handleDateOption(selectedValue) {
      // Perform any additional logic if needed
      console.log("Selected Date: ", selectedValue);
      }
      </script>
  </body>
</html>


