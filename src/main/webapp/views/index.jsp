<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Employee List</title>
</head>
<body>
<h2>Employee List</h2>
<a href="views/createForm.jsp">Create new employee TEST</a>
<c:choose>
    <c:when test="${empty employeeList}">
        <p>No employees found.</p>
    </c:when>
    <c:otherwise>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>phone number</th>
                <th>Post</th>
                <th>Department</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="employee" items="${employeeList}">
                <tr>
                    <td>${employee.id}</td>
                    <td>${employee.name}</td>
                    <td>${employee.email}</td>
                    <td>${employee.phone}</td>
                    <td>${employee.position}</td>
                    <td>${employee.department}</td>
                    <td>
                        <a href="/EmployManger/update?id=${employee.id}">Update</a>
                        <a href="/EmployManger/delete?id=${employee.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>

</body>
</html>
