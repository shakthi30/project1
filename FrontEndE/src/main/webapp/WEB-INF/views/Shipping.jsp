<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<style>
body {
	padding-bottom: 100px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"></jsp:include>
	<form action="invoiceProcess" method="post">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="panel panel-default">

						<div class="panel-heading">Customer Shipping Address</div>
						<c:set var="gtotal" value="0"></c:set>
						<c:forEach var="c" items="${Cart}">
							<c:set var="gtotal" value="${gtotal + c.cartPrice * c.cartQnty}"></c:set>
						</c:forEach>

						<div class="panel-body">
							<table>
								<tr>
									<td>${User.name}</td>
								</tr>
								<tr>
									<td>Email:</td>
									<td>${User.email}</td>
								</tr>
								<tr>
									<td>Phone:</td>
									<td>${User.phone }</td>
								</tr>
								<tr>
									<td>Address:</td>
									<td>${User.address}</td>
								</tr>
							</table>
						</div>
						<div class="panel-footer">
							<table class="table table-striped">
								<tr>
									<td>IMAGE</td>
									<td>PODUCT(S)</td>
									<td>QTY.</td>
									<td>PRICE</td>
								</tr>

								<c:forEach var="c" items="${Cart}">
									<tr>
										<td><img width="70px" height="70px"
											src="<c:url value = "/resources/images/${c.cartImg}.jpg"/>"></td>
										<td>${c.cartProdName}</td>
										<td>${c.cartQnty}</td>
										<td>${c.cartPrice}</td>
									</tr>
								</c:forEach>

								<tr>
									<td>TOTAL:</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>${gtotal}</td>
								</tr>
							</table>
						</div>

					</div>
				</div>
				<div class="col-sm-6">
					<div class="panel panel-default">
						<div class="panel-heading">Payment</div>
						<div class="panel-body">
							<h3>
								<strong>Enter Card Details</strong>
							</h3>
							<input type="hidden" name="total" value="${gtotal}"> <br>
							<select name="payment" id="payment" onChange="changed();">
								<option value="COD">Cash on delivery</option>
								<option value="NB">Net Banking</option>
								<option value="Debit/Credit">Debit or Credit</option>
							</select> <br> <br> <input id="cardNo" type="text"
								name="cardNumber" placeholder="Enter Card Number" /> <br> <br>
							<input id="cardNm" type="text" name="caedName"
								placeholder="Enter Card Holder Name" />
							<table>
								<tr>
									<th colspan="2">Expiry Date</th>
									<th>&nbsp;&nbsp;</th>
									<th>CVV</th>
								</tr>
								<tr>
									<td colspan="2"><input id="mon" type="number" min="1"
										max="12" name="month" placeholder="MM"> <input id="yr"
										type="number" min="00" max="99" name="year" placeholder="YY">
									</td>
									<td>&nbsp;&nbsp;</td>
									<td><input id="cvv" type="password" min="000" max="999"
										name="CVV" placeholder="CVV"></td>
									<br>
									<br>
								</tr>
							</table>
							<br> <input type="submit" value="Proceed">
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		function changed() {
			if (document.getElementById("payment").value === "COD") {
				document.getElementById("cardNo").disabled = 'true';
				document.getElementById("cardNm").disabled = 'true';
				document.getElementById("mon").disabled = 'true';
				document.getElementById("yr").disabled = 'true';
				document.getElementById("cvv").disabled = 'true';
			} else if (document.getElementById("payment").value === "NB") {
				document.getElementById("cardNo").disabled = '';
				document.getElementById("cardNm").disabled = '';
				document.getElementById("mon").disabled = '';
				document.getElementById("yr").disabled = '';
				document.getElementById("cvv").disabled = '';
			} else if (document.getElementById("payment").value === "Debit/Credit") {
				document.getElementById("cardNo").disabled = '';
				document.getElementById("cardNm").disabled = '';
				document.getElementById("mon").disabled = '';
				document.getElementById("yr").disabled = '';
				document.getElementById("cvv").disabled = '';
			}

		}
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>