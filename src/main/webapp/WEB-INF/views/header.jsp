<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    <%@include file='/WEB-INF/views/css/header.css' %>
</style>
<html>
  <head>
    <title>Title</title>
  </head>
  <header>

      <div class="header-left">
          <h1 class="site-name">Finterest</h1>
      </div>
      <nav class="header-menu">
          <ul>
              <li><a href="http://localhost:8080">Home</a></li>
          </ul>
      </nav>
      <div class="header-right">
          <p class="account-name"><c:out value="${pageContext.request.userPrincipal.name}" /></p>
          <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
      </div>
  </header>
  <body>
  </body>
</html>
