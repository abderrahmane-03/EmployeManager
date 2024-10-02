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
<form action="http://localhost:2525/EmployManger/edit" method="post">
  <input type="hidden" name="id" value="${employee.id}">
  <input type="text" name="name" value="${employee.name}" placeholder="Enter Name">
  <input type="email" name="email" value="${employee.email}" placeholder="Enter Email">
  <input type="text" name="phone" value="${employee.phone}" placeholder="Enter Phone number">
  <input type="text" name="department" value="${employee.department}" placeholder="Enter Department">
  <input type="text" name="position" value="${employee.position}" placeholder="Enter Position">
  <button type="submit">Update employee</button>
</form>

</body>
</html>
