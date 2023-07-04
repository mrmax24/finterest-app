<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    <%@include file='/WEB-INF/views/css/style.css' %>
    <%@include file='/WEB-INF/views/css/header.css' %>
    table {
    margin-top: 20px;
    margin-bottom: 20px;
    margin-left: auto;
    margin-right: auto;
    border-collapse: collapse;
    width: 30%;
    }

    th, td {
    border-bottom: 1px solid #ccc;
    padding: 8px;
    text-align: left;
    }

    tr:last-child {
    border-bottom: none;
    }

    th:first-child, td:first-child {
    padding-left: 20px;
    }
    th:last-child, td:last-child {
    padding-right: 0;
    }

</style>

<html>
<head>
<jsp:include page="header.jsp"/>
    <title>Title</title>
    <title>Expense Table</title>
</head>
<body>
    <table class="report"id="report-table">
        <tr>
            <th>Expense Category</th>
            <th>Amount</th>
        </tr>

        <c:forEach items="${categoryExpenses}" var="categoryExpense">
            <tr>
                <td>${categoryExpense[0]}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${categoryExpense[2]}% </td>
                <td>${categoryExpense[1]}</td>
            </tr>
        </c:forEach>

        <tr>
            <td><strong>Total expenses</strong></td>
            <td>-$${userExpenses}</td>
        </tr>
    </table>
</body>
</html>

