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
        <link rel="stylesheet" href="<c:url value="../css/tax.css"/>" type="text/css"/>

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
                <a href="https://app-palarczyk.herokuapp.com/accounts/consolidated/taxQuarters" class="section__anchor">
                    <li class="section__listRow">Pokaż PIT kwartalny</li>
                </a>
                <a href="https://app-palarczyk.herokuapp.com/accounts/consolidated/create" class="section__anchor">
                    <li class="section__listRow">Wygeneruj bilans</li>
                </a>
            </ul>
        </div>
        <div class="section__div">
            <div class="section__div--screen">
                 <label class="section__label">Pierwszy kwartał</label>
                 <label class="section__label--white">${vatFirstQuarter} zł</label>
            </div>
            <div class="section__div--screen">
                <label class="section__label">Drugi kwartał</label>
                <label class="section__label--white">${vatSecondQuarter} zł</label>
            </div>
            <div class="section__div--screen">
                <label class="section__label">Trzeci kwartał</label>
                <label class="section__label--white">${vatThirdQuarter} zł</label>
            </div>
            <div class="section__div--screen">
                <label class="section__label">Czwarty kwartał</label>
                <label class="section__label--white">${vatFourthQuarter} zł</label>
            </div>
        </div>
    </section>
</body>
</html>