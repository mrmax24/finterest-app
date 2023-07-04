<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
    <%@include file='/WEB-INF/views/css/style.css' %>
    h1 {
        text-align: center;
    }
    table {
        margin: 0 auto;
        text-align: center;
    }
    .popup {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #fff;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        z-index: 9999;
    }
</style>
<html>
<head>
    <title>CashFlow</title>
    <%-- Include the necessary CSS or JavaScript files here --%>
    <%@ include file="header.jsp" %>
</head>
<body>
    <h1 class="table_dark">Accounts</h1>
    <table class="table_dark">
        <tbody>
            <c:forEach var="account" items="${accounts}">
                <tr onclick="openPopup('${account.id}', '${account.name}', '${account.balance}')">
                    <td>${account.name}</td>
                    <td>${account.balance}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div id="popupContainer" class="popup">
        <h2>Account Actions</h2>
        <p>Account Name: <span id="accountName"></span></p>
        <p>Account Balance: <span id="accountBalance"></span></p>
        <button onclick="showAddAmountField()">Change balance</button>
        <div id="addAmountField" style="display: none;">
            <input type="text" id="addAmountInput" placeholder="Enter amount" />
            <button onclick="editBudget()">Send</button>
        </div>
        <button onclick="deleteAccount()" id="deleteButton">Delete</button>
        <button onclick="closePopup()">Close</button>
    </div>

    <script>
        function showAddAmountField() {
            document.getElementById("addAmountField").style.display = "block";
        }

        var accountId; // Глобальна змінна для збереження accountId

        function openPopup(accountId, accountName, accountBalance) {
            this.accountId = accountId; // Зберегти accountId в глобальну змінну
            document.getElementById("accountName").textContent = accountName;
            document.getElementById("accountBalance").textContent = accountBalance;
            document.getElementById("popupContainer").style.display = "block";
            document.getElementById("deleteButton").onclick = function() {
                deleteAccount(accountId);
            };
            document.getElementById("editBudgetButton").onclick = function() {
                editBudget();
            };
        }

        function deleteAccount(accountId) {
            $.ajax({
                url: "/accounts/delete/" + accountId,
                type: "POST",
                success: function(response) {
                    console.log("Account deleted successfully");
                    // Виконати необхідні оновлення інтерфейсу або перенаправлення
                },
                error: function(xhr, status, error) {
                    console.log("Error deleting account:", error);
                }
            });
        }


        function editBudget() {
            var addAmountInput = document.getElementById("addAmountInput");
            var amountToChange = addAmountInput.value;
            $.ajax({
                url: "/accounts/edit/" + accountId,
                type: "POST",
                data: { amountToChange: amountToChange },
                success: function(response) {
                    console.log("Account amount edited successfully");
                    // Виконати необхідні оновлення інтерфейсу або перенаправлення
                },
                error: function(xhr, status, error) {
                    console.log("Error updating account amount:", error);
                }
            });
        }

        function closePopup() {
            document.getElementById("popupContainer").style.display = "none";
        }
    </script>
</body>
</html>
