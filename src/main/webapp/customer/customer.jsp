<%@ page import="ua.goit.models.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
    <%@ include file="../headers.jsp" %>
</head>
<body>
<%@ include file="../navigation.jsp" %>

<%ua.goit.models.Customer customer = (Customer) request.getAttribute("customer"); %>

<div class="container">
    <div class="row">
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group me-2" role="group" aria-label="Second group">
                <a href="/customers" type="button" class="btn btn-success">All customers</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="mb-3">
            <label for="id" class="form-label">id</label>
            <input type="text" disabled class="form-control"
                   value="${customer.id}"
                   id="id" placeholder="id">
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">name</label>
            <input type="text" class="form-control"
                   value="${customer.name}"
                   id="name" placeholder="name">
        </div>
        <div class="mb-3">
            <label for="category" class="form-label">category</label>
            <select class="form-select" aria-label="Default select example"
                   value="${customer.category}" id="category" placeholder="category">
                <option selected disabled>${customer.category}</option>
                <option value="regular">regular</option>
                <option value="one-time">one-time</option>
                <option value="lost">lost</option>
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
    let name = document.getElementById('name');
    let category = document.getElementById('category');
    function save() {
        let body = {
            <% if(customer.getId() != null) {%>
            id: id.value, <% } %>
            name: name.value,
            category: category.value,
        }
        <% if(customer.getId() == null) {%>
        let url = '/customers';
        let method = 'POST';
        <% } else { %>
        let url = '/customers/<%= customer.getId() %>';
        let method = 'PUT';
        <% } %>
        fetch(url, {
            method: method,
            body: JSON.stringify(body)
        })
            .then( _ => {
                    window.location.href = '/customers';
                }
            );
    }
</script>
</body>
</html>
