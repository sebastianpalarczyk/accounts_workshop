<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="<c:url value="../css/form.css"/>" type="text/css"/>

</head>
<body class="body">

    <div class="form__div">
        <form class="form" action="<c:url value="/logout"/>" method="POST">
            <div class="form__div--label">
                <a href="https://app-palarczyk.herokuapp.com/accounts/menu" class="form__anchor">
                   <label class="form__label--app">Aplikacja księgowa</label>
                </a>
            </div>
            <div class="form__div--label">
                <label>
                   Na pewno chcesz się <br> <strong>wylogować?</strong>
                </label>
            </div>
            <div class="form__div--label">
                <button class="form__button form__button--logout" type="submit"> TAK </button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </div>
            <div class="form__div--label">
                <a href="https://app-palarczyk.herokuapp.com/accounts/menu" type="submit" class="form__anchor">
                   <label class="form__label--logout">NIE</label>
                </a>
            </div>

        </form>
    </div>
</body>
</html>
