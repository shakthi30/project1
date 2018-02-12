<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/Header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-body">
					<table class="table table-striped">
						<tr>
							<td>Order Id:</td>
							<td>payment</td>
							<td>Total</td>
						</tr>
						<c:forEach items="${order}" var="order">
							<tr>
								<td>${order.orderId}</td>
								<td>${order.payment}</td>
								<td>${order.total}</td>
							</tr>

						</c:forEach>
					</table>

				</div>

			</div>
		</div>
	</div>

</body>
</html>