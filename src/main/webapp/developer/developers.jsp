<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Developers</title>
    <%@ include file="../headers.jsp" %>
</head>
<body>
<%@ include file="../navigation.jsp" %>

<div class="container">
    <div class="row">
        <h2>Developers</h2>
    </div>

    <div class="row">

        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">id</th>
                <th scope="col">name</th>
                <th scope="col">age</th>
                <th scope="col">salary</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="developer" items="${developers}">
                <tr>
                    <td><c:out value = "${developer.id}"/></td>
                    <td><c:out value = "${developer.name}"/></td>
                    <td><c:out value = "${developer.age}"/></td>
                    <td><c:out value = "${developer.salary}"/></td>
                    <td>
                        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                            <div class="btn-group me-2" role="group" aria-label="Second group">
                                <a href="/developers/<c:out value = '${developer.id}'/>" type="button" class="btn btn-warning">📝</a>
                                <a href="/developers?deleteId=<c:out value = '${developer.id}'/>" type="button" class="btn btn-danger">🗑</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group me-2" role="group" aria-label="Second group">
                <a href="/developers/new" type="button" class="btn btn-primary">+</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
