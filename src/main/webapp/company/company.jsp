
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Company</title>
    <%@ include file="../headers.jsp" %>
</head>
<body>
<%@ include file="../navigation.jsp" %>
<div class="container">
    <div class="row">
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group me-2" role="group" aria-label="Second group">
                <a href="/companies" type="button" class="btn btn-success">All companies</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="mb-3">
            <label for="id" class="form-label">ID</label>
            <input type="text" class="form-control"
                   value="${company.id}"
                   id="id" placeholder="id">
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">Company name</label>
            <input type="text" class="form-control"
                   value="${company.name}"
                   id="name" placeholder="company name">
        </div>
        <div class="mb-3">
            <label for="quantityStaff" class="form-label">Quantity staff</label>
            <input type="text" class="form-control"
                   value="${company.quantityStaff}"
                   id="Quantity staff" placeholder="quantity staff">
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
</body>
</html>
