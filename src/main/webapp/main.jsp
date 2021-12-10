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
        <h2>База данных содержит следующие таблицы:</h2>
    </div>
    <div class="row">
     <ul>
        <li> developers (хранит данные о разработчиках(имя, возраст, пол и прочее))</li>
        <li> skills (отрасль – Java, C++, C#, JS; уровень навыков - Junior, Middle, Senior)</li>
        <li> projects (проекты, на которых работают разработчики)</li>
        <li> companies (IT компании, в которых работают разработчики)</li>
        <li> customers (клиенты, которые являются заказчиками проектов в IT компаниях)</li>
    </ul>
        При помощи JSP и Servlets реализон клиент для работы с JDBC.<br>
        Обеспечена удобная работа с CRUD операциями.<br>
        Реализован паттерн MVC.
    </div>
</div>
</body>
</html>
