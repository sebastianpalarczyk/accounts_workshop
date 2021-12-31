<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sebastian
  Date: 20.06.2020
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
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
                <link rel="stylesheet" href="<c:url value="../css/main.css"/>"/>
                <link rel="stylesheet" href="<c:url value="../css/section.css"/>"/>
                <link rel="stylesheet" href="<c:url value="../css/navigation.css"/>"/>
            </head>
<body>
                <nav class="navigation">
                    <div class="navigation__div">Aplikacja księgowa</div>
                   <a href="http://localhost:8080/login">
                    <div class="navigation__div navigation__div--login">Zaloguj</div>
                   </a>
                   <a href="http://localhost:8080/user/add">
                    <div class="navigation__div navigation__div--newAccount">Załóż nowe konto</div>
                   </a>
                </nav>
                <main class="main">
                    <section class="section--image">
                         <h1 class="section__header">Ułatwimy prowadzenie Twojej działalności!</h1>
                         <h3 class="section__header">Księgowość online idealna dla Ciebie!</h3>
                    </section>
                    <section class="section">
                        <fieldset class="section__fieldset">
                            <legend>
                                Formularz kontaktowy
                            </legend>
                            <div class="section__div">
                                <input class="section__input" type="text" placeholder="Temat"/>
                            </div>
                            <div class="section__div">
                               <textarea class="section__textarea" cols="46" rows="10">Treść wiadomości</textarea>
                            </div>
                            <div class="section__div">
                                <button class="section__button" type="submit">Wyślij wiadomość</button>
                            </div>
                           </fieldset>
                    </section>
                </main>
</body>
</html>
