<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    <%@include file='/WEB-INF/views/css/style.css' %>
    form {
        position: absolute;
        top: 30%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    input[type="submit"] {
        display: block;
        margin: 0 auto;
    }
</style>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <title>Create an Account</title>
    <h4 class="error-message">${errorMessage}</h4>
</head>
<body>
<h1>Create an Account</h1>
<form method="post" id="account" action="${pageContext.request.contextPath}/add-account">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name"><br><br>
    <label for="balance">Balance:</label>
    <input type="number" id="balance" name="balance"><br><br>
    <input type="submit" value="Create Account">
</form>
</body>
</html>
