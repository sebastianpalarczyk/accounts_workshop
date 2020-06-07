<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sebastian
  Date: 07.06.2020
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<tbody>
<c:forEach items="${bills}" var="bill">
<tr>
    <td><c:out value = "${bill.number}"/></td>
    <td><c:out value = "${bill.nameContractor}"/></td>
    <td><c:out value = "${bill.date}"/></td>
    <td><c:out value = "${bill.netAmount}"/></td>
    <td><c:out value = "${bill.grossAmount}"/></td>
    <td><c:out value = "${bill.updated}"/></td>
    <td><a href="http://localhost:8080/bill/updateForm/${bill.id}">Edytuj</a></td>
    <td><a href="http://localhost:8080/bill/delete/${bill.id}">Usuń</a></td><br>
</tr>
</c:forEach>

</body>
</html>
