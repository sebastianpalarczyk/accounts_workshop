<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: sebastian
  Date: 24.06.2020
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="http://localhost:8080/">Powrót do strony głównej</a><br>
<form:form method="POST" modelAttribute="user">
    Nazwa użytkownika: <br> <form:input path="username"/><br>
    <%--    <form:errors path="date"/><br>--%>
    Hasło: <br> <form:input path="password" type="password"/><br>
    <%--    <form:errors path="nameContractor"/><br>--%>
    <input type="submit">
</form:form>
</body>
</html>
