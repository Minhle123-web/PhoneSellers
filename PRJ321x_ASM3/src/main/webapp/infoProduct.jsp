<%-- 
    Document   : infoProduct
    Created on : Jul 18, 2021, 12:07:20 PM
    Author     : ad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
      
	<c:set var="p" value="${product}"></c:set>
	<c:set var="price" value="${p.price}"></c:set>
	<div class="container">
		<div class="row">
			<div class="col-md-12 border-bottom mt-3">
				<h5 class="text-danger">${p.name}</h5>
			</div>
			<div class="col-md-5">
				<img class="img-fluid mt-4 mb-4" src="${p.src}">
			</div>
			<div class="col-md-7 mt-4 mb-4">
			<h5 class="text-danger">
				<fmt:setLocale value = "en_US"/>
         		<p class="card-text text-danger">${p.price} <span> USD</span></p>
         		
			</h5>
			<p>
				${p.description}
			</p>
			<a href="http://localhost:8082/PRJ321x_ASM3/AddToCartController?action=add&id=${p.id}" type="button" class="btn btn-warning">Add to cart</a> 
			</div>
		</div>
	</div>	
  
    </body>
</html>
