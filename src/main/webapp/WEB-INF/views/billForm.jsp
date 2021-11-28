<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>My accounts</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Charmonman:400,700|Open+Sans:400,600,700&amp;subset=latin-ext"
          rel="stylesheet">
    <link href='<c:url value="/WEB-INF/views/css/style.css"/>' rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
</head>
<body>
<%--    <form:errors path="date"/><br>--%>

<%--    <form:errors path="nameContractor"/><br>--%>
<%--    <form:errors path="number"/><br>--%>
<%--    <form:errors path="netAmount"/><br>--%>

<%--    <form:errors path="category"/><br>--%>


<jsp:include page="header.jsp"></jsp:include>

<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">
                <!-- fix action, method -->
                <!-- add name attribute for all inputs -->
                <form:form method="POST" modelAttribute="bill" class="padding-small text-center">
                    <h1 class="text-color-darker">Dodaj fakturę</h1>
                    <div class="form-group">
                        <form:input path="date" type="date" class="form-control" placeholder="Data"/>
                    </div>
                    <div class="form-group">
                        <form:input path="nameContractor" type="text" class="form-control" placeholder="Nazwa kontrahenta"/>
                    </div>
                    <div class="form-group">
                        <form:input path="number" type="text" class="form-control" placeholder="Numer faktury"/>
                    </div>
                    <div class="form-group">
                        <form:input path="netAmount" type="text" class="form-control" placeholder="Kwota netto"/>
                    </div>
                    <div class="form-group">
                        Faktura przychodowa <form:radiobutton path="type" value="P"/>
                    </div>
                    <div class="form-group">
                        Faktura kosztowa <form:radiobutton path="type" value="K"/>
                    </div>
                    <div class="form-group">
                        <label>Odliczenie podatku VAT <br> <form:checkboxes  path="category" itemLabel="name" itemValue="id" items="${categories}"/></label>
                    </div>

                    <button class="btn btn-color rounded-0" type="submit">Dodaj fakturę</button>
                </form:form>
            </div>
        </div>
    </div>
</section>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

</body>
</html>
