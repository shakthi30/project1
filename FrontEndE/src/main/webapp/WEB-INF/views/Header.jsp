<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<html>
<head>
<meta charset="utf-8">
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

	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand"
				href="https://www.optimumnutrition.com/us/img/static/black-logo.svg"><img
				src="https://www.optimumnutrition.com/us/img/static/white-logo.svg">
			</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="${pageContext.request.contextPath}/home"><span
					class="glyphicon glyphicon-home"></span> Home</a></li>
					<%-- <sec:authorize access="hasRole('ROLE_USER')"> --%>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Shop By Category <span
					class="caret"></span></a>
				<ul class="dropdown-menu">

					<li><a
						href="${pageContext.request.contextPath}/productdetails">All</a></li>
					<c:forEach var="list" items="${addlist}">
						<li><a
							href="<c:url value="/sortCategory/${list.catName}"></c:url>">${list.catName}</a></li>
					</c:forEach>
				</ul></li>
			<%-- </sec:authorize> --%>
			<sec:authorize access="hasRole('ROLE_ADMIN')" >
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Add Information <span
						class="caret"></span></a>
					<ul class="dropdown-menu">

						<li><a href="<c:url value="/admin/save_update_delete-category"></c:url>">Category</a></li>
						<li><a href="<c:url value="/admin/save_update_delete-Products"></c:url>">Products</a></li>
						<li><a href="<c:url value="/admin/save_update_delete-supplier"></c:url>">Supplier</a></li>
					</ul></li>
			</sec:authorize>

			<c:if test="${pageContext.request.userPrincipal == null }">

				<li><a href="${pageContext.request.contextPath}/Reg"><span
						class="glyphicon glyphicon-pencil"></span> Sign Up</a></li>
				<li><a href="${pageContext.request.contextPath}/admin"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>

			</c:if>
			<c:if test="${pageContext.request.userPrincipal != null }">

				<li><a href="${pageContext.request.contextPath}/logout"><span
						class="glyphicon glyphicon-off"></span> Logout</a></li>

			</c:if>
		</ul>
		<ul class="nav navbar-nav navbar-right">
		<sec:authorize access="hasRole('ROLE_USER')">
			<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span>
					${pageContext.request.userPrincipal.name}<span
						class="caret"></span></a>
					<ul class="dropdown-menu">

						<li><a href="<c:url value="/orderHistory"></c:url>">Order History</a></li>
						
					</ul>
					</li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_USER')">
			<li><a href="${pageContext.request.contextPath}/cart"><span
					class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
					</sec:authorize>
		</ul>
	</div>
	</nav>
	<script>
		$(document).ready(function() {
			$('.dropdown-toggle').dropdown();
		});
	</script>


</body>

</html>