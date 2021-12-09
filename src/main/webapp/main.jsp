<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Project Management System</title>
    <%@ include file="headers.jsp" %>
</head>
<body>
<%@ include file="navigation.jsp" %>

<div class="container">
    <div class="row">
        <h2>Queries</h2>
    </div>
    <div class="row">
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group me-2" role="group" aria-label="Second group">
                <a href="/query/listDevsInProject" type="button" class="btn btn-primary">List Developers in a Project</a>
            </div>
            <div class="btn-group me-2" role="group" aria-label="Second group">
                <a href="/query/ListDevsWithLevel" type="button" class="btn btn-primary">List Developers with Level</a>
            </div>
            <div class="btn-group me-2" role="group" aria-label="Second group">
                <a href="/query/ListDevsWithSkill" type="button" class="btn btn-primary">List Developers with Skill</a>
            </div>
            <div class="btn-group me-2" role="group" aria-label="Second group">
                <a href="/query/ListOfProjects" type="button" class="btn btn-primary">List of Projects</a>
            </div>
            <div class="btn-group me-2" role="group" aria-label="Second group">
                <a href="/query/SalaryByProjectName" type="button" class="btn btn-primary">Salary by Project</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
