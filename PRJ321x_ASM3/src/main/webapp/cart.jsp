<%-- 
    Document   : cart
    Created on : Jul 18, 2021, 12:02:11 PM
    Author     : ad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<c:set var="c" value="${cart}"></c:set>

	<div class="container-fluid mt-3">
		<table class="table table-bordered">
			<thead class="thead-inverse">
				<tr>
					<th>Product in cart: ${c.getItems().size()}</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Amount</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${c.getItems()}">
					<tr>
						<td scope="row">${p.name}</td>
						<td><fmt:formatNumber type="currency" maxFractionDigits="2"
								value="${p.price}" currencySymbol="($) " /></td>
						<td>${p.number}</td>
						<td><fmt:formatNumber type="currency" maxFractionDigits="2"
								value="${p.price * p.number}" currencySymbol="($) " /></td>
					</tr>
				</c:forEach>
				<tr>
					<td scope="row" colspan="4"><p class="text-right">Total:
							$${c.getAmount()}</p></td>
				</tr>
			</tbody>
		</table>
                                     
		<form class="row" action="http://localhost:8082/PRJ321x_ASM3/PayController" method="get">
			<div class="col-md-4 col-sm-4 mt-2">
				<p>Customer name:</p>
				<p>Customer address:</p>
				<p>Discount code (if any)</p>
			</div>
			<div class="col-md-8 col-sm-8">
				<div class="form-group col-md-6 col-sm-6">
					<input type="text" class="form-control mb-2" name="name" id=""
						aria-describedby="helpId" placeholder="type your name" required>
					<input type="text" class="form-control mb-2" name="address" id=""
						aria-describedby="helpId" placeholder="type your address" required>
					<input type="text" class="form-control" name="discount" id=""
						aria-describedby="helpId" placeholder="Discount code" required>
					<input type="submit" class="button btn-warning mt-2" value="Submit"></input>
				</div>
			</div>
		</form>
                      

		<c:import url="footer.jsp"></c:import>
	</div>
    </body>
</html>
