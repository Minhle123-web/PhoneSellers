<%-- 
    Document   : body
    Created on : Jul 20, 2021, 8:57:13 PM
    Author     : ad
--%>

<%@page import="dao.ListProductDAO"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fc"%>
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
<link href="css/bodycss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
        List<Product> products = new ListProductDAO().search("");
        request.setAttribute("products", products);
	RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
	rd.forward(request, response);
        %>
       
       <div class="container mt-2">
		<div class="row">
			<c:forEach var="p" items="${products}">
				<div class="card-deck col-md-4">
					<a
						href="http://localhost:8082/PRJ321x_ASM3/InformationController"
						class="card mt-2 nav-link"> <img src="${p.src}"
						class="card-img-top mt-2" alt="${p.description}">
						
						<div class="card-body">
							<c:set var="type" value="${p.type}"></c:set>
							<h4 class="card-title text-secondary">${fc:toUpperCase(type)}</h4>
							<p class="card-text text-success">${p.name}</p>
							<p class="card-text text-danger">$${p.price}</p>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
    
            
	
	<!--pagination-->
	<nav aria-label="..." class="d-flex justify-content-center mt-2">
		<ul class="pagination">
			<li class="page-item disabled"><a class="page-link" href="#"
				tabindex="-1" aria-disabled="true">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item active" aria-current="page"><a
				class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
			</li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>
	
    </body>
</html>
