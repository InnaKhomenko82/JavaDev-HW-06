<%@ page import="ua.goit.models.Skill" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Skill</title>
    <%@ include file="../headers.jsp" %>
</head>
<body>
<%@ include file="../navigation.jsp" %>

<%ua.goit.models.Skill skill = (Skill) request.getAttribute("skill"); %>

<div class="container">
    <div class="row">
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group me-2" role="group" aria-label="Second group">
                <a href="/skills" type="button" class="btn btn-success">All skills</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="mb-3">
            <label for="id" class="form-label">id</label>
            <input type="text" disabled class="form-control"
                   value="${skill.id}"
                   id="id" placeholder="id">
        </div>
        <div class="mb-3">
            <label for="skillsField" class="form-label">field</label>
            <select class="form-select" aria-label="Default select example"
                   value="${skill.skillsField}" id="skillsField" placeholder="Select skills Field from menu">
                <option selected disabled>${skill.skillsField}</option>
                <option value="Java">Java</option>
                <option value="C++">C++</option>
                <option value="C#">C#</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="skillsLevel" class="form-label">level</label>
            <select class="form-select" aria-label="Default select example"
                   value="${skill.skillsLevel}" id="skillsLevel" placeholder="Select level Field from menu">
                <option selected disabled>${skill.skillsLevel}</option>
                <option value="junior">junior</option>
                <option value="middle">middle</option>
                <option value="senior">senior</option>
            </select>
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
    let skillsField = document.getElementById('skillsField');
    let skillsLevel = document.getElementById('skillsLevel');
    function save() {
        let body = {
            <% if(skill.getId() != null) {%>
            id: id.value, <% } %>
            skillsField: skillsField.value,
            skillsLevel: skillsLevel.value,
        }
        <% if(skill.getId() == null) {%>
        let url = '/skills';
        let method = 'POST';
        <% } else { %>
        let url = '/skills/<%= skill.getId() %>';
        let method = 'PUT';
        <% } %>
        fetch(url, {
            method: method,
            body: JSON.stringify(body)
        })
            .then( _ => {
                    window.location.href = '/skills';
                }
            );
    }
</script>
</body>
</html>
