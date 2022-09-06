<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Weather App</title>
<link rel="stylesheet" type="text/css" href="/CSS/style.css">
</head>
<body>
<div class="title-container">
	<h1 class="title">G.A Weather App</h1>
</div>
<div class="container">
		<form action="/search">
			<input class="city" placeholder="Search for any city . . ." type="text" name="query">
			<input class="btn" type="submit" value="Search" >
		</form>
</div>
</body>
</html>