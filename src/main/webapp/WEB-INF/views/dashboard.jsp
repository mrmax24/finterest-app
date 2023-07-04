<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
    <%@include file='/WEB-INF/views/css/style.css' %>
    <%@include file='/WEB-INF/views/css/header.css' %>
</style>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <title>Title</title>
</head>
<body>
<div style="border: 2px solid #c5c7c9; border-radius: 5px; padding: 2px; margin: 20px; width: 250px; font-size: 14px;">
    <div>
        <h2 style="display: inline-block; margin-left: 2px">Balance:${currentBalance}</h2>
        <ul class="no-bullet">
            <c:forEach var="account" items="${accounts}">
                <li>${account.name}: ${account.balance}</li>
            </c:forEach>
        </ul>
        <hr style="border: 0px solid black; display: inline-block; margin-left: 10px;">
    </div>
</div>
        <h4 class="error-message">${accountIsNegativeError}</h4>

<h2>Add transaction</h2>
<form method="post" id="transaction" action="${pageContext.request.contextPath}/dashboard">
    <div id="table-container">
        <table class="form-table">
            <tr>
                <th>From account</th>
                <th>Category</th>
                <th>Date</th>
                <th>Note</th>
                <th>Amount</th>
                <th>Currency</th>
                <th>Add</th>
            </tr>
            <tr>
                <td>
                    <select name="account" id="account"required>
                            <c:forEach items="${accounts}" var="account">
                                <option value="${account.id}">${account.name}</option>
                            </c:forEach>
                        </select>
                </td>
                <td>
                <select name="category" id="category">
                <c:forEach items="${allCategories}" var="category">
                <option value="${category.id}">${category.category}</option>
                </c:forEach>
                </select>
                </td>
                <td>
                    <input type="text" id="date-input" name="date" required>
                </td>
                <td>
                    <input type="text" name="note" form="transaction">
                </td>
                <td><input type="text" name="amount" form="transaction" pattern="[0-9]+(\.[0-9]+)?" required></td>
                <td><select name="currency" id="currency">
                    <option value="UAH">UAH</option>
                    <option value="USD">USD</option>
                    <option value="EUR">EUR</option>
                </select>
                </td>
                <td><button type="submit" name="add" form="transaction">Send</button></td>
            </tr>
        </table>
    </div>
</form>
<br>
<div id="history-container">
    <div id="total-container">
        <table class="total">
        </table>
        <br>
    </div>
<table class="history"id="transaction-table">
    <tr>
        <th>Category</th>
        <th>Note</th>
        <th>Amount</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="transaction" items="${allTransactions}">
        <tr>
            <td>${transaction.transactionCategory.category}</td>
            <td>${transaction.note}</td>
            <td>${transaction.amount}</td>
            <td>
                <form method="POST" action="${pageContext.request.contextPath}/dashboard/edit/${transaction.id}">
                    <input type="hidden" name="_method" value="PUT" />
                    <input type="button" value="Edit" class="edit-button" data-transaction-id="${transaction.id}" />
                </form>
            </td>
            <td>
                <form method="POST" action="${pageContext.request.contextPath}/dashboard/delete/${transaction.id}">
                    <input type="hidden" name="_method" value="DELETE" />
                    <input type="submit" value="Delete" />
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</div>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<script>
    // Initialize the date picker
    flatpickr("#date-input", {
        dateFormat: "d-m-Y", // Set the desired date format
        defaultDate: new Date() // Set the default date to today's date
    });
</script>


<script>
    $(document).ready(function() {
        $('.edit-button').click(function() {
            var transactionId = $(this).data('transaction-id');
            var accountId = $(this).closest('tr').find('td:eq(3)').text();
            var categoryId = $(this).closest('tr').find('td:first').text();
            var date = $(this).data('date');
            var note = $(this).closest('tr').find('td:eq(1)').text();
            var amount = $(this).closest('tr').find('td:eq(2)').text();
            var currency = $(this).data('currency');

            var popupHtml = '<div class="popup">';
            popupHtml += '<h3>Edit Transaction</h3>';
            popupHtml += '<form method="POST" action="' + '${pageContext.request.contextPath}/dashboard/edit/' + transactionId + '">';
            popupHtml += '<input type="hidden" name="_method" value="PUT" />';
            popupHtml += '<label for="account">From account:</label>';
            popupHtml += '<select name="account" id="account">';
            popupHtml += '<c:forEach items="${accounts}" var="account">';
            popupHtml += '<option value="${account.id}" ' + (accountId === account.id ? 'selected' : '') + '>${account.name}</option>';
            popupHtml += '</c:forEach>';
            popupHtml += '</select>';
            popupHtml += '<br>';
            popupHtml += '<label for="category">Category:</label>';
            popupHtml += '<select name="category" id="category">';
            popupHtml += '<c:forEach items="${allCategories}" var="category">';
            popupHtml += '<option value="${category.id}" ' + (categoryId === category.id ? 'selected' : '') + '>${category.category}</option>';
            popupHtml += '</c:forEach>';
            popupHtml += '</select>';
            popupHtml += '<br>';
            popupHtml += '<label for="date">Date:</label>';
            popupHtml += '<input type="text" name="date" id="date-input" value="' + getCurrentDate() + '">';
            popupHtml += '<br>';
            popupHtml += '<label for="note">Note:</label>';
            popupHtml += '<input type="text" name="note" value="' + note + '">';
            popupHtml += '<br>';
            popupHtml += '<label for="amount">Amount:</label>';
            popupHtml += '<input type="text" name="amount" value="' + amount + '">';
            popupHtml += '<br>';
            popupHtml += '<label for="currency">Currency:</label>';
            popupHtml += '<select name="currency" id="currency">';
            popupHtml += '<option value="UAH" ' + (currency === 'UAH' ? 'selected' : '') + '>UAH</option>';
            popupHtml += '<option value="USD" ' + (currency === 'USD' ? 'selected' : '') + '>USD</option>';
            popupHtml += '<option value="EUR" ' + (currency === 'EUR' ? 'selected' : '') + '>EUR</option>';
            popupHtml += '</select>';
            popupHtml += '<br>';
            popupHtml += '<input type="submit" value="Save">';
            popupHtml += '<button type="button" class="close-button">Close</button>';
            popupHtml += '</form>';
            popupHtml += '</div>';

            $('body').append(popupHtml);

            $('.close-button').click(function() {
                $('.popup').remove();
            });
        });

        function getCurrentDate() {
            var currentDate = new Date();
            var day = String(currentDate.getDate()).padStart(2, '0');
            var month = String(currentDate.getMonth() + 1).padStart(2, '0');
            var year = currentDate.getFullYear();
            return day + '-' + month + '-' + year;
        }
    });
</script>
</form>
</body>
</html>
