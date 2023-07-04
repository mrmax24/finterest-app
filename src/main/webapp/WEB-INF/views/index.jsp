<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    <%@include file='/WEB-INF/views/css/style.css' %>
    h1 {
        display: flex;
        justify-content: center;
    }
    table {
        display: flex;
        justify-content: center;
    }
    th, td {
        display: flex;
        justify-content: center;
    }
</style>
<html>
<head>
    <title>Finterest</title>
    <jsp:include page="header.jsp"/>
</head>
<body>
<form method="post" id="redirect"></form>
<h1 class="table_dark">Main menu</h1>
<table class="table_dark">
    <br>
    <tr><td><a href="${pageContext.request.contextPath}/add-account">Add new account</a></td></tr>
    <tr><td> <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a></td></tr>
    <tr><td> <a href="${pageContext.request.contextPath}/accounts">Accounts</a></td></tr>
     <tr><td> <a href="${pageContext.request.contextPath}/report">Reports</a></td></tr>


</table>
</body>
</html>