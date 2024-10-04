<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>


<html>
<head>
    <title>Employee List</title>
    <link rel="stylesheet" type="text/css" href="static/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">

</head>

<body>
<h2>Employee List</h2>

<a href="views/createForm.jsp" class="button-50">Create new employee</a>
<c:choose>
    <c:when test="${empty employeeList}">
        <p>No employees found.</p>

    </c:when>
    <c:otherwise>
        <form action="http://localhost:2525/EmployManger/search" method="GET">
            <input type="search" name="search">
            <button type="submit">search</button>
        </form>
        <form action="http://localhost:2525/EmployManger/filter" method="GET">

            <select name="filter">
                <option value="RIPD">
                    RIPD
                </option>
                <option value="Racoon City">
                    Racoon City
                </option>
                <option value="Village">
                    Village
                </option>
            </select>
            <button type="submit">filter</button>
        </form>
        <div style="display: flex; flex-wrap: wrap;  gap:50px 20px;">
        <c:forEach var="employee" items="${employeeList}">
            <div class="card">
            <header class="card-header">
                <div class="logo">
                    <img src="static/logo.png" alt="Arstotzka Logo">
                </div>
                <h1>A R S T O T Z K A</h1>
                <div class="visa-status"></div>
            </header>



            <section class="photo-section">
                <div class="photo">
                    <img src="static/${employee.picture}.png" alt="Face Photo" style="height: 9.5rem; width:10rem;">
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
                    <p class="info left">${employee.id}</p>
                    <p class="info right">${employee.name}</p>
                </div>
                <div class="label-row">
                    <span class="label left">I.D</span>
                    <span class="label right">FIRST NAME</span>
                </div>

                <div class="info-row">
                    <p class="info left">${employee.phone}</p>
                    <p class="info right">${employee.email}</p>
                </div>
                <div class="label-row">
                    <span class="label left">PHONE NUMBER</span>
                    <span class="label right">EMAIL</span>
                </div>

                <div class="info-row">
                    <p class="info left">${employee.department}</p>
                    <p class="info right">${employee.position}</p>
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




            <section class="update-delete">
                <a href="/EmployManger/update?id=${employee.id}" class="update-button">update</a>
                <a href="/EmployManger/delete?id=${employee.id}" class="delete-button">delete</a>
            </section>
        </div>
        </c:forEach>
        </div>

    </c:otherwise>
</c:choose>

</body>
</html>
