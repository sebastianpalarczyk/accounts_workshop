<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sebastian
  Date: 21.06.2020
  Time: 10:16
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
Podatek Vat do zapłaty w bieżącym miesiącu: ${resultVat}<br>
Podatek Pit do zapłaty w bieżącym miesiącu: ${resultPit}<br>
Vat I kwartał: ${vatFirstQuarter}<br>
Vat II kwartał: ${vatSecondQuarter}<br>
Vat III kwartał: ${vatThirdQuarter}<br>
Vat IV kwartał: ${vatFourthQuarter}<br>
</body>
</html>
