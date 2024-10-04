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
<h2>Employee Form</h2>
<form action="http://localhost:2525/EmployManger/create" method="post" enctype="multipart/form-data">
    <div class="card">
        <header class="card-header">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/static/logo.png" alt="Arstotzka Logo">
            </div>
            <h1>A R S T O T Z K A</h1>
            <div class="visa-status"></div>
        </header>



        <section class="photo-section">
            <div class="photo">
                <input name="picture" type="file" style="height: 9.5rem; width:10rem;">
            </div>
            <div class="visa-status-container">
                <div class="visa-status">
                    <div class="granted">
                        <span>Granted</span>

                        <div class="boxes">
                            <div class="box"></div>
                            <div class="box"></div>
                            <div class="box yellow"></div>
                            <div class="box yellow"></div>
                        </div>

                    </div>
                    <hr width="100%;" color="#f5b5b5" size="3">
                    <div class="entry-visa-status">ENTRY EMPLOY STATUS</div>
                    <div class="dots-grid">

                        <div class="circle filled"></div>
                        <div class="circle filled"></div>
                        <div class="circle filled"></div>
                        <div class="circle filled"></div>
                        <div class="circle"></div>
                        <div class="circle filled"></div>
                        <div class="circle filled"></div>

                        <!-- Row 2 -->
                        <div class="circle"></div>
                        <div class="circle filled"></div>
                        <div class="circle filled"></div>
                        <div class="circle"></div>
                        <div class="circle"></div>
                        <div class="circle filled"></div>
                        <div class="circle filled"></div>

                        <!-- Row 3 -->
                        <div class="circle filled"></div>
                        <div class="circle filled"></div>
                        <div class="circle filled"></div>
                        <div class="circle"></div>
                        <div class="circle filled"></div>
                        <div class="circle filled"></div>
                        <div class="circle filled"></div>

                        <div class="circle"></div>
                        <div class="circle filled"></div>
                        <div class="circle filled"></div>
                        <div class="circle"></div>
                        <div class="circle"></div>
                        <div class="circle filled"></div>
                        <div class="circle filled"></div>
                    </div>
                </div>
            </div>
        </section>



        <section class="personal-info">
            <div class="info-row">
                <p class="info left">IDENTITY I.D</p>
                <p class="info right"><input type="text" class="inputs" name="name" placeholder="Enter Name"></p>
            </div>
            <div class="label-row">
                <span class="label left">ID</span>
                <span class="label right">FIRST NAME</span>
            </div>

            <div class="info-row">
                <p class="info left">
                    <input class="inputs" type="text" name="phone" placeholder="Enter Phone number"></p>
                <p class="info right"><input class="inputs" type="email" name="email" placeholder="Enter Email"></p>
            </div>
            <div class="label-row">
                <span class="label left">PHONE NUMBER</span>
                <span class="label right">EMAIL</span>
            </div>

            <div class="info-row">
                <p class="info left"><input class="inputs" type="text" name="department" placeholder="Enter Department"></p>
                <p class="info right"><input class="inputs" type="text" name="position" placeholder="Enter Position"></p>
            </div>
            <div class="label-row">
                <span class="label left">DEPARTMENT</span>
                <span class="label right">POSITION</span>
            </div>

            <div class="info-row">
                <p class="info left">ARSTOTZKA</p>
                <p class="info right">NO ALIAS</p>
            </div>
            <div class="label-row">
                <span class="label left">DISTRICT</span>
                <span class="label right">ALIAS</span>
            </div>
        </section>




        <sectionsty style="margin-left: 40px" class="update-delete">
            <button type="submit" class="update-button">Create employee</button>
        </sectionsty>
    </div>

</form>

</body>
</html>
