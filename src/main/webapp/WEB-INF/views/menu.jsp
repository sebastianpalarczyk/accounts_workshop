<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplikacja księgowa</title>
    <base href="/">
    <link rel="icon" href="<c:url value="../images/icon.png"/>">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
    <link rel="stylesheet" href="<c:url value="../css/style.css"/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value="../css/body.css"/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value="../css/menu.css"/>" type="text/css"/>

</head>
<body class="body">
    <nav class="navigation">
        <ul class="navigation__list">
            <li class="navigation__listRow">
                <a href="https://app-palarczyk.herokuapp.com/accounts/menu" class="navigation__anchor">
                <label class="navigation__label">
                    Aplikacja księgowa
                </label>
                </a>
            </li>
            <a href="https://app-palarczyk.herokuapp.com/accounts/logout" class="navigation__anchor">
               <li class="navigation__listRow--last"></li>
            </a>

        </ul>

    </nav>
    <section class="section">
        <div class="section__div--navigation">
            <ul class="section__list">
                <a href="https://app-palarczyk.herokuapp.com/accounts/bill/add" class="section__anchor">
                    <li class="section__listRow">Dodaj nową fakturę</li>
                </a>
                <a href="https://app-palarczyk.herokuapp.com/accounts/consolidated/vatQuarters" class="section__anchor">
                    <li class="section__listRow">Pokaż VAT kwartalny</li>
                </a>
                <a href="https://app-palarczyk.herokuapp.com/accounts/consolidated/taxQuarters" class="section__anchor">
                    <li class="section__listRow">Pokaż PIT kwartalny</li>
                </a>
                <a href="https://app-palarczyk.herokuapp.com/accounts/consolidated/create" class="section__anchor">
                    <li class="section__listRow">Wygeneruj bilans</li>
                </a>
            </ul>
        </div>
        <div class="section__div">
            <table class="section__table">
               <h3 class="section__tableHeader">FAKTURY</h3>
               <tr>
                   <th class="section__tableHeader">
                       Numer faktury
                   </th>
                   <th class="section__tableHeader">
                       Nazwa firmy
                   </td>
                   <th class="section__tableHeader">
                       Data
                   </th>
                   <th class="section__tableHeader">
                       Kwota netto
                   </th>
                   <th class="section__tableHeader">
                       Kwota brutto
                   </th>
                   <th class="section__tableHeader"></th>
                   <th class="section__tableHeader"></th>
               </tr>
               <tr>
                <c:forEach items="${bills}" var="bill">
                <td class="section__tabelCell">
                    <c:out value = "${bill.number}"/>
                </td>
                <td class="section__tabelCell">
                    <c:out value = "${bill.nameContractor}"/>
                </td>
                <td class="section__tabelCell">
                    <c:out value = "${bill.date}"/>
                </td>
                <td class="section__tabelCell">
                    <c:out value = "${bill.netAmount}"/>
                </td>
                <td class="section__tabelCell">
                    <c:out value = "${bill.grossAmount}"/>
                </td>
                <td class="section__tabelCell">
                    <a href="https://app-palarczyk.herokuapp.com/accounts/bill/update/${bill.id}" class="section__anchor">
                        <label class="section__tabelLabel">Edycja</label>
                    </a>
                </td>
                <td class="section__tabelCell">
                    <a href="https://app-palarczyk.herokuapp.com/accounts/bill/delete/${bill.id}" class="section__anchor">
                        <label class="section__tabelLabel">Usuń</label>
                    </a>
                </td>
            </tr>
            </c:forEach>
            </table>

        </div>
    </section>
</body>
</html>
