<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	padding-bottom: 100px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"></jsp:include>
	<div class="container">

		<div class="jumbotron">
			<h3>
				<center>INVOICE</center>
			</h3>
		</div>
	</div>
	<div class="container">
		<div class="row">

			<div class="panel panel-default">
				<div class="panel-heading text-center">Customer Details</div>

				<div class="panel-body">
					<table>
						<tr>
							<th>Customer Name:</th>
						</tr>
						<tr>
							<td>${userList.name}</td>
						</tr>

						<tr>
							<th>Customer Email:</th>
						</tr>
						<tr>
							<td>${userList.email}</td>
						</tr>
						<tr>
							<th>Customer Address:</th>
						</tr>
						<tr>
							<td>${userList.address}</td>
						</tr>
						<tr>
							<th>Delivery within 7 working days</th>

						</tr>
					</table>

				</div>
			</div>

		</div>
	</div>
	<div class="container">
		<div class="row">

			<div class="panel panel-default">
				<div class="panel-heading text-center">Payment Information</div>

				<div class="panel-body">
					<table>
						<tr>
							<th>Payment Method:</th>
						</tr>
						<tr>
							<td>${orderList.payment}</td>
						</tr>

						<tr>
							<th>Billing Address:</th>
						</tr>
						<tr>
							<td>${userList.address}</td>
						</tr>
					</table>

				</div>
			</div>

		</div>
	</div>
	<div class="container">
		<div class="row">

			<div class="panel panel-default">
				<div class="panel-heading text-center">ITEM(S)</div>

				<div class="panel-body">
					<table class="table table-striped">
						<tr>
							<th>Items Ordered</th>
							<th>QTY.</th>
							<th>PRICE</th>
						</tr>
						<c:set var="gtotal" value="0"></c:set>
						<c:forEach items="${ Cart}" var="c">
							<tr>
								<td>${c.cartProdName}</td>
								<td>${c.cartQnty}.PC(S)</td>
								<td>${c.cartPrice}</td>
								<c:set var="gtotal" value="${c.cartPrice * c.cartQnty}"></c:set>
							</tr>
						</c:forEach>
						<tr>
							<th>GRAND TOTAL</th>
							<td>&nbsp;</td>
							<th>${gtotal}</th>
						</tr>

					</table>

				</div>
			</div>
		</div>
	</div>
	<div class="container text-center">
		<a href="ack"><button class="btn-primary">CONFIRM ORDER</button></a>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>