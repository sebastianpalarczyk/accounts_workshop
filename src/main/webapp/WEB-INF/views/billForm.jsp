<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: sebastian
  Date: 07.06.2020
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form method="POST" modelAttribute="bill">
    <br> <form:hidden path="user" value = /><br>
    Data: <br> <form:input path="date"/><br>
<%--    <form:errors path="date"/><br>--%>
    Nazwa kontrahenta: <br> <form:input path="nameContractor"/><br>
<%--    <form:errors path="nameContractor"/><br>--%>
    Numer faktury:<br> <form:input path="number" /><br>
<%--    <form:errors path="number"/><br>--%>
    Kwota netto: <br><form:input path="netAmount"/><br>
<%--    <form:errors path="netAmount"/><br>--%>
    Wartość VAT do odliczenia: <br><form:checkboxes path="category" itemLabel="name" itemValue="id" items="${categories}"/><br>
<%--    <form:errors path="category"/><br>--%>
    <input type="submit">
</form:form>

</body>
</html>
