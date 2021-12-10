<%@ page import="ua.goit.models.Project" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Project</title>
    <%@ include file="../headers.jsp" %>
</head>
<body>
<%@ include file="../navigation.jsp" %>

<%ua.goit.models.Project project = (Project) request.getAttribute("project"); %>

<div class="container">
    <div class="row">
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group me-2" role="group" aria-label="Second group">
                <a href="/projects" type="button" class="btn btn-success">All projects</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="mb-3">
            <label for="id" class="form-label">id</label>
            <input type="text" disabled class="form-control"
                   value="${project.id}"
                   id="id" placeholder="id">
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">name</label>
            <input type="text" class="form-control"
                   value="${project.name}"
                   id="name" placeholder="name">
        </div>
        <div class="mb-3">
            <label for="projectStart" class="form-label">projectStart</label>
            <input type="date" class="form-control"
                   value="${project.projectStart}"
                   id="projectStart" placeholder="projectStart">
        </div>
        <div class="mb-3">
            <label for="cost" class="form-label">cost</label>
            <input type="text" class="form-control"
                   value="${project.cost}"
                   id="cost" placeholder="cost">
        </div>

        <div class="row">
            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                <div class="btn-group me-2" role="group" aria-label="Second group">
                    <button onclick="save()" type="button" class="btn btn-primary">Save</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    let id = document.getElementById('id');
    let name = document.getElementById('name');
    let projectStart = document.getElementById('projectStart');
    let cost = document.getElementById('cost');
    function save() {
        let body = {
            <% if(project.getId() != null) {%>
            id: id.value, <% } %>
            name: name.value,
            projectStart: projectStart.value,
            cost: cost.value,
        }
        <% if(project.getId() == null) {%>
        let url = '/projects';
        let method = 'POST';
        <% } else { %>
        let url = '/projects/<%= project.getId() %>';
        let method = 'PUT';
        <% } %>
        fetch(url, {
            method: method,
            body: JSON.stringify(body)
        })
            .then( _ => {
                    window.location.href = '/projects';
                }
            );
    }
</script>
</body>
</html>
