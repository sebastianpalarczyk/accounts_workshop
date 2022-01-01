<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="pl">
<head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Aplikacja księgowa</title>
            <link rel="icon" href="<c:url value="../images/icon.png"/>">

            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
            <link rel="stylesheet" href="<c:url value="../css/style.css"/>"/>
            <link rel="stylesheet" href="<c:url value="../css/body.css"/>"/>
            <link rel="stylesheet" href="<c:url value="../css/form.css"/>"/>
</head>
<body class="body">

    <div class="form__div">
        <form:form class="form" method="POST" modelAttribute="user">
            <div class="form__div--label">
                <a href="https://app-palarczyk.herokuapp.com/" class="form__anchor">
                   <label class="form__label--app">Aplikacja księgowa</label>
                </a>
            </div>
            <div class="form__div--label">
                <label>
                    <strong>Zarejestruj</strong> się do aplikacji
                </label>
            </div>
            <div class="form__div--input">
                <label class="form__label">
                    <form:input path="username" class="form__input"  type="text" placeholder="Nazwa użytkownika"/>
                </label>
            </div>
            <div class="form__div--input">
                <label class="form__label">
                    <form:input path="password" type="password" class="form__input" placeholder="Podaj hasło"/>
                </label>
            </div>
            <div class="form__div--label">
                <button class="form__button" type="submit"> ZAŁÓŻ KONTO </button>
            </div>

            <div class="form__div--label">
                <label>
                    Kliknij jeśli <a class="form__anchor form__anchor--blue" href="https://app-palarczyk.herokuapp.com/login">masz już konto </a>
                </label>
            </div>
        </form:form>
    </div>
</body>
</html>
