<%@ page import="ua.goit.models.Developer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Developer</title>
    <%@ include file="../headers.jsp" %>
</head>
<body>
<%@ include file="../navigation.jsp" %>

<%ua.goit.models.Developer developer = (Developer) request.getAttribute("developer"); %>

<div class="container">
    <div class="row">
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group me-2" role="group" aria-label="Second group">
                <a href="/developers" type="button" class="btn btn-success">All developers</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="mb-3">
            <label for="id" class="form-label">id</label>
            <input type="text" disabled class="form-control"
                   value="${developer.id}"
                   id="id" placeholder="id">
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">name</label>
            <input type="text" class="form-control"
                   value="${developer.name}"
                   id="name" placeholder="name">
        </div>
        <div class="mb-3">
            <label for="age" class="form-label">age</label>
            <input type="text" class="form-control"
                   value="${developer.age}"
                   id="age" placeholder="age">
        </div>
        <div class="mb-3">
            <label for="salary" class="form-label">salary</label>
            <input type="text" class="form-control"
                   value="${developer.salary}"
                   id="salary" placeholder="salary">
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
    let age = document.getElementById('age');
    let salary = document.getElementById('salary');
    function save() {
        let body = {
            <% if(developer.getId() != null) {%>
            id: id.value, <% } %>
            name: name.value,
            age: age.value,
            salary: salary.value,
        }
        <% if(developer.getId() == null) {%>
        let url = '/developers';
        let method = 'POST';
        <% } else { %>
        let url = '/developers/<%= developer.getId() %>';
        let method = 'PUT';
        <% } %>
        fetch(url, {
            method: method,
            body: JSON.stringify(body)
        })
            .then( _ => {
                    window.location.href = '/developers';
                }
            );
    }
</script>
</body>
</html>
