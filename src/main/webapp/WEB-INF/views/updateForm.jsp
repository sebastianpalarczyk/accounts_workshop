<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

             <script defer src="<c:url value="../js/script.js"/>"></script>
</head>
<body class="body">

    <div class="form__div">
        <form:form class="form form--bill" method="POST" modelAttribute="billUpdate" action="/accounts/bill/update/${billUpdate.id}">
           <div class="form__div--label">
                           <a href="https://app-palarczyk.herokuapp.com/accounts/menu" class="form__anchor">
                              <label class="form__label--app">Menu</label>
                           </a>
                       </div>
                       <div class="form__div--label">
                           <label class="form__label">
                               <strong>Aktualizacja</strong> faktury
                           </label>
                       </div>
                       <div class="form__div--input">
                           <label class="form__label">
                               <form:input path="number" class="form__input" type="text" value="${billUpdate.number}" placeholder="Numer faktury"/>
                           </label>
                       </div>
                       <div class="form__div--input">
                           <label class="form__label">
                               <form:input path="nameContractor" class="form__input" value="${billUpdate.nameContractor}" type="text" placeholder="Nazwa firmy"/>
                           </label>
                       </div>
                       <div class="form__div--input">
                           <label class="form__label">
                               <form:input path="netAmount" class="form__input" value="${billUpdate.netAmount}" type="number" placeholder="Kwota netto"/>
                           </label>
                       </div>
                       <div class="form__div--input">
                           <label class="form__label">
                               <form:input path="date" class="form__input form__input--date" value="${billUpdate.date}" type="date" placeholder="Data"/>
                           </label>
                       </div>
                       <div class="form__div--input">
                           <label class="form__label form__label--center">
                               Faktura przychodowa <form:radiobutton path="type" value="P" class="form__input--radio"/>
                           </label>
                       </div>
                       <div class="form__div--input">
                           <label class="form__label form__label--center">
                               Faktura kosztowa <form:radiobutton path="type" value="K" class="form__input--radioCost"/>
                           </label>
                       </div>
                       <div class="form__div--input">
                           <label class="form__label form__label--center">
                               Odliczenie podatku vat
                           </label>
                       </div>
                       <div class="form__div--input">
                         <label class="form__label form__label--center">
                              <form:checkboxes  path="category" itemLabel="name" itemValue="id" items="${categories}"/>
                         </label>
                       </div>
                       <div class="form__div--label">
                           <button class="form__button" type="submit"> ZAPISZ ZMIANY </button>
                       </div>
        </form:form>
    </div>
</body>
</html>
