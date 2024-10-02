<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Employees</title>
</head>
<body>
<h2>Employee Form</h2>
<form action="http://localhost:2525/EmployManger/create" method="post">
    <input type="text" name="name" placeholder="Enter Name">
    <input type="email" name="email" placeholder="Enter Email">
    <input type="text" name="phone" placeholder="Enter Phone number">
    <input type="text" name="department" placeholder="Enter Department">
    <input type="text" name="position" placeholder="Enter Position">
    <button type="submit">Create employee</button>
</form>

</body>
</html>
