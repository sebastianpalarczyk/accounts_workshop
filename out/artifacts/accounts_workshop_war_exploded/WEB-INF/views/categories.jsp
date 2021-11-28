<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sebastian
  Date: 07.06.2020
  Time: 15:53
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
<c:forEach items="${categories}" var="category">
    <tr>
        <td><c:out value = "${category.name}"/></td>
        <td><c:out value = "${category.value}"/></td>
        <td><a href="http://localhost:8080/category/updateForm/${category.id}">Edytuj</a></td>
        <td><a href="http://localhost:8080/category/delete/${category.id}">Usuń</a></td><br>
    </tr>
</c:forEach>

</body>
</html>
