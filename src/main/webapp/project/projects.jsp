<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Projects</title>
    <%@ include file="../headers.jsp" %>
</head>
<body>
<%@ include file="../navigation.jsp" %>

<div class="container">
    <div class="row">
        <h2>Projects</h2>
    </div>

    <div class="row">

        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">id</th>
                <th scope="col">name</th>
                <th scope="col">start</th>
                <th scope="col">cost</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="project" items="${projects}">
                <tr>
                    <td><c:out value = "${project.id}"/></td>
                    <td><c:out value = "${project.name}"/></td>
                    <td><c:out value = "${project.projectStart}"/></td>
                    <td><c:out value = "${project.cost}"/></td>
                    <td>
                        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                            <div class="btn-group me-2" role="group" aria-label="Second group">
                                <a href="/projects/<c:out value = '${project.id}'/>" type="button" class="btn btn-warning">📝</a>
                                <a href="/projects?deleteId=<c:out value = '${project.id}'/>" type="button" class="btn btn-danger">🗑</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group me-2" role="group" aria-label="Second group">
                <a href="/projects/new" type="button" class="btn btn-primary">+</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
