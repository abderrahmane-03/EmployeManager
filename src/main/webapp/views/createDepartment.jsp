<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Employees</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
</head>
<body>
<div style="position: relative; width: 100%;">
    <img src="${pageContext.request.contextPath}/static/bgForm.png" style="position: fixed; z-index: -3; width: 100%" alt="Arstotzka Logo">
    <div style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.3); z-index: -3;"></div>
</div>

<div style="padding:50px ">
    <a href="http://localhost:2525/EmployManger/" class="button-50">Home</a>

    <form style="display: flex; justify-self: center; align-self: center" action="http://localhost:2525/EmployManger/addDepartement" method="post" enctype="multipart/form-data">
        <div class="card">


            <section class="photo-section">

                   <input name="name" type="text">


            </section>




            <sectionsty style="margin-left: 40px" class="update-delete">
                <button type="submit" class="update-button">Create employee</button>
            </sectionsty>
        </div>

    </form>
</div>
</body>
</html>
