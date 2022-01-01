<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <form class="form" method="POST">
            <div class="form__div--label">
                <a href="http://localhost:8080/" class="form__anchor">
                   <label class="form__label--app">Aplikacja księgowa</label>
                </a>
            </div>
            <div class="form__div--label">
                <label>
                    <strong>Zaloguj</strong> się do aplikacji
                </label>
            </div>
            <div class="form__div--input">
                <label class="form__label">
                    <input class="form__input" type="text" name="username" placeholder="Nazwa użytkownika"/>
                </label>
            </div>
            <div class="form__div--input">
                <label class="form__label">
                    <input class="form__input" type="password" name="password" placeholder="Hasło"/>
                </label>
            </div>
            <div class="form__div--label">
                <button class="form__button" type="submit"> ZALOGUJ SIĘ </button>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="form__div--label">
                <label>
                    Kliknij jeśli <a class="form__anchor form__anchor--blue" href="http://localhost:8080/user/add"> nie masz konta </a>
                </label>
            </div>
        </form>
    </div>
</body>
</html>