<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Companies</title>
    <%@ include file="../headers.jsp" %>
</head>
<body>
<%@ include file="../navigation.jsp" %>

<div class="container">
    <div class="row">
        <h2>Companies</h2>
    </div>

    <div class="row">

        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">id</th>
                <th scope="col">name</th>
                <th scope="col">quantity staff</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="company" items="${companies}">
                <tr>
                    <td><c:out value = "${company.id}"/></td>
                    <td><c:out value = "${company.name}"/></td>
                    <td><c:out value = "${company.quantityStaff}"/></td>
                    <td>
                        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                            <div class="btn-group me-2" role="group" aria-label="Second group">
                                <a href="/companies/<c:out value = '${company.id}'/>" type="button" class="btn btn-warning">📝</a>
                                <a href="/companies?deleteId=<c:out value = '${company.id}'/>" type="button" class="btn btn-danger">🗑</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group me-2" role="group" aria-label="Second group">
                <a href="/companies/new" type="button" class="btn btn-primary">+</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
