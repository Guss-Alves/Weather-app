<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Weather Info</title>
<link rel="stylesheet" type="text/css" href="/CSS/style.css">
</head>
<body class="body2">
    <div class="go-back">
        <div class="arrow-container">
            <a href="/back" ><img class="arrow-img" src="https://icons.veryicon.com/png/o/miscellaneous/mrcongicon/arrow-go-back-fill-2.png" alt="arrow"></a>
        </div>
    </div>
    <div class="container-results">
        <div class="head">
            <div class="left">
                <div class="img-main">
                    <c:forEach var="climate" items="${ results }">
                        <img class="weather-icon" src="http://openweathermap.org/img/wn/${climate.getString('icon')}@2x.png" alt="icon">
                    </c:forEach>
                    <c:forEach var="climate" items="${ results }">
                        <span class="main">${climate.getString("main")}</span>
                    </c:forEach>
                </div>
                <h2 class="city-name"> <c:out value="${resultsObj.getString('name')}" />, <c:out value="${sysObj.getString('country')}" /> </h2>
            </div>
            <div class="right">
                <span><c:out value="${mainObj.getString('temp')}" />°F</span><br>
                <span class="span-style">H: <c:out value="${mainObj.getString('temp_max')}" />°F</span>
                <span class="span-style">L: <c:out value="${mainObj.getString('temp_min')}" />°F</span>
            </div>
        </div>
        <hr>
        <div class="container-body">
            <h2>Feels like:</h2>
            <span class="span-style"><c:out value="${mainObj.getString('feels_like')}" />°F</span>

            <h2>Weather Description:</h2>
            <c:forEach var="climate" items="${ results }">
                <span class="span-style">${climate.getString("description")}	</span>
            </c:forEach>

            <h2>wind speed:</h2>
            <span class="span-style"><c:out value="${windObj.getString('speed')}"/> mph</span>
        </div>
        <div class="container-time">
            <div class="sunrise">
                <h3 >Sunrise</h3 >
                <img class="sunrise-icon" src="https://cdn-icons-png.flaticon.com/512/1146/1146885.png" alt="sunrise icon">

                <span class="span-style"><c:out value="${date}" /></span>
                
            </div>
            <div class="sunset">
                <h3 >Sunset</h3 >
                <img class="sunset-icon" src="https://cdn.dribbble.com/users/1966282/screenshots/6664560/sunset_icon.png?compress=1&resize=400x300&vertical=top" alt="sunset icon">

                <span class="span-style"><c:out value="${date2}" /></span>
            </div>
        </div>
    </div>
</body>
</html>