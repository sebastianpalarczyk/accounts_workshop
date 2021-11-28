<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sebastian
  Date: 07.06.2020
  Time: 16:02
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
<section class="dashboard-section">
    <jsp:include page="header.jsp"></jsp:include>
    <div class="m-4 p-4 width-medium">
            <div class="m-4 p-4 border-dashed">
                <h2 class="dashboard-content-title">
                    <span>Dodane faktury</span>
                </h2>
                <table class="table">
                    <tbody>
                        <tr class="d-flex">
                            <td class="col-2">
                                Numer faktury
                            </td>
                            <td class="col-2">
                                Nazwa kontrahenta
                            </td>
                            <td class="col-2">
                                Data
                            </td>
                            <td class="col-2">
                                Kwota netto
                            </td>
                            <td class="col-2">
                                Kwota brutto
                            </td>
                            <td class="col-2">

                            </td>
                            <td class="col-2">

                            </td>
                        </tr>
                    </tbody>
                </table>
                <table class="table">
                    <tbody>
                   <c:forEach items="${bills}" var="bill">
                    <tr class="d-flex">
                        <td class="col-2">
                            <c:out value = "${bill.number}"/>
                        </td>
                        <td class="col-2">
                            <c:out value = "${bill.nameContractor}"/>
                        </td>
                        <td class="col-2">
                            <c:out value = "${bill.date}"/>
                        </td>
                        <td class="col-2">
                            <c:out value = "${bill.netAmount}"/>
                        </td>
                        <td class="col-2">
                            <c:out value = "${bill.grossAmount}"/>
                        </td>
                        <td class="col-2">
                            <a href="https://app-palarczyk.herokuapp.com/accouts/bill/updateForm/${bill.id}">Edytuj</a>
                        </td>
                        <td class="col-2">
                            <a href="https://app-palarczyk.herokuapp.com/bill/delete/${bill.id}">Usuń</a>
                        </td>
                    </tr>
                   </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

</body>
</html>
