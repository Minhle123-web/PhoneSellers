<%-- 
    Document   : search
    Created on : Jul 18, 2021, 12:10:28 PM
    Author     : ad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fc"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
	<div class="container mt-2">
		<div class="row">
		<c:choose> 	
		    <c:when test="${result.size() == 0}">
		        No data available
		    </c:when>    
		    <c:otherwise>
		    <c:forEach var="r" items ="${result}">
				<div class="card-deck col-md-4">
				<p style="color: blue;">${p.id}.</p>
					<a
						href="http://localhost:8082/PRJ321x_ASM3/InformationProductController?id=${r.id}"
						class="card mt-2 nav-link"> <img src="${r.src}"
						class="card-img-top mt-2" alt="${r.description}">
						<div class="card-body">
							<c:set var="type" value="${r.type}"></c:set>
							<h4 class="card-title text-secondary">${fc:toUpperCase(type)}</h4>
							<p class="card-text text-success">${r.name}</p>
							<p class="card-text text-danger">$${r.price}</p>
						</div>
					</a>
				</div>
			</c:forEach>
		    </c:otherwise>
		</c:choose>
			
		</div>
	</div>
	<c:import url="footer.jsp"></c:import>
    </body>
</html>
