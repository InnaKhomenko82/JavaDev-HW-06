<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customers</title>
    <%@ include file="../headers.jsp" %>
</head>
<body>
<%@ include file="../navigation.jsp" %>

<div class="container">
    <div class="row">
        <h2>Customers</h2>
    </div>

    <div class="row">

        <table class="table">
            <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Category</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${customers}">
                <tr>
                    <td><c:out value = "${customer.id}"/></td>
                    <td><c:out value = "${customer.name}"/></td>
                    <td><c:out value = "${customer.category}"/></td>
                    <td>
                        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                            <div class="btn-group me-2" role="group" aria-label="Second group">
                                <a href="/customers/<c:out value = '${customer.id}'/>" type="button" class="btn btn-warning">📝</a>
                                <a href="/customers?deleteId=<c:out value = '${customer.id}'/>" type="button" class="btn btn-danger">🗑</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group me-2" role="group" aria-label="Second group">
                <a href="/customers/new" type="button" class="btn btn-primary">+</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
