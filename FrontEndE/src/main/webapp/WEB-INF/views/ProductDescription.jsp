<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

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

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="<c:url value="/resources/images/${prod.productId}.jpg"/>"
						target="_self"> <img height="500px" width="500px"
						src="<c:url value="/resources/images/${prod.productId}.jpg"/>" />
					</a>
				</div>
			</div>
			<div class="col-md-8">
				<pre>
<h1>
<c:out value="${prod.productName}">${prod.productName}</c:out>
<small>Price- Rs.<c:out value="${prod.price}">${prod.price}</c:out></small>
</h1>
<h2>
<small>Supplier- <c:out value="${prod.suppName}">${prod.suppName}</small>
</c:out>
</h2>

<sec:authorize access="hasRole('ROLE_USER')">
<form action="${pageContext.request.contextPath}/cart/${prod.productId}" method='post'>
<h3>
<label for="usr">Quantity
</h3>
</label>${error}
<input type="text" class="form-control" id="usr" name="quantity" required>
<input class="btn btn-success" type="submit" value="ADD TO CART">
</form>
</sec:authorize>

 </pre>
			</div>

		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4">&nbsp;</div>
				<div class="col-md-8">
					<div class="panel panel-default">
						<div class="panel-body">
							<h4>PRODUCT DESCRIPTION</h4>
							<p>${prod.productDesc}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>