<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Skills</title>
    <%@ include file="../headers.jsp" %>
</head>
<body>
<%@ include file="../navigation.jsp" %>

<div class="container">
    <div class="row">
        <h2>Skills</h2>
    </div>

    <div class="row">

        <table class="table">
            <thead>
            <tr>
                <th scope="col">id</th>
                <th scope="col">field</th>
                <th scope="col">level</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="skill" items="${skills}">
                <tr>
                    <td><c:out value = "${skill.id}"/></td>
                    <td><c:out value = "${skill.skillsField}"/></td>
                    <td><c:out value = "${skill.skillsLevel}"/></td>
                    <td>
                        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                            <div class="btn-group me-2" role="group" aria-label="Second group">
                                <a href="/skills/<c:out value = '${skill.id}'/>" type="button" class="btn btn-warning">📝</a>
                                <a href="/skills?deleteId=<c:out value = '${skill.id}'/>" type="button" class="btn btn-danger">🗑</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group me-2" role="group" aria-label="Second group">
                <a href="/skills/new" type="button" class="btn btn-primary">+</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
