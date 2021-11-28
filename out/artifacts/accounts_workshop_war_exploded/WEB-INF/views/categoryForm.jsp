<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: sebastian
  Date: 07.06.2020
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="http://localhost:8080/accounts/menu">Powrót do menu</a><br>
<a href="http://localhost:8080/accounts/logout">Wyloguj</a><br>
<form:form method="POST" modelAttribute="category">
    Nazwa: <br> <form:input path="name"/><br>
    <%--    <form:errors path="name"/><br>--%>
    Wartosc: <br> <form:input path="value"/><br>
    <%--    <form:errors path="value"/><br>--%>
    <input type="submit">
</form:form>


</body>
</html>
