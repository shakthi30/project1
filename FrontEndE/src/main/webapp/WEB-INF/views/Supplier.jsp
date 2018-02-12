<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.model.Supplier"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<style>
body {
	padding-bottom: 100px;
}

.panel-body {
	background-color: #f2f2f2;
}

#panel1 {
	width: 30%;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"></jsp:include>
	<div class="container">
		<div class="row">

			<div class="col-md-4">
				<form:form
					action="${pageContext.request.contextPath}/admin/addSupplier"
					modelAttribute="supplier" method="post">
					<div class="container">
						<div class='panel panel-default' id="panel1">
							<div class="panel-body">
								<div class="form-group">
									<label for="SuppName">Supplier Name:</label>${invalidName}
									<form:input path="suppName" id="SuppName" class="form-control"
										placeholder="Enter First and Last name" />
								</div>
								<div class="form-group">
									<label for="SuppAddress">Supplier Address:</label>
									${invalidAddress}
									<form:input path="suppAddress" class="form-control"
										id="SuppAddress"
										placeholder="eg:54 , 4th cross, sea college road, Bangalore-560049" />
								</div>
								<div class="form-group">
									<label for="SuppEmail">Supplier Email:</label>${invalidEmail}
									<form:input class="form-control" path="suppEmail"
										id="SuppEmail" placeholder="Enter Email" />
								</div>
								<div class="form-group">
									<label for="SuppPhone">Supplier Phone:</label>${invalidPhone}
									<form:input class="form-control" path="suppPhone"
										id="SuppPhone" placeholder="Enter 10 digits" />
								</div>
								<form:input class="form-control" path="suppId" type="hidden" />
							</div>
							<button type="submit" name="add" class="btn btn-success">
								<span class="glyphicon glyphicon-plus-sign"></span> ADD
							</button>
							<button type="submit" name="update" class="btn btn-success">
								<span class="glyphicon glyphicon-plus-sign"></span> UPDATE
							</button>
						</div>
					</div>
				</form:form>
			</div>
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-body">
						<table class="table table-striped text-center">
							<tr>
								<th>Supplier ID</th>
								<th>Supplier Name</th>
								<th>Supplier Address</th>
								<th>Supplier E-Mail</th>
								<th>Supplier Phone</th>
								<th>Action</th>
							</tr>
							<c:forEach items="${suppList}" var="list">
								<tr>
									<td>${list.suppId}</td>
									<td>${list.suppName}</td>
									<td>${list.suppAddress}</td>
									<td>${list.suppEmail}</td>
									<td>${list.suppPhone}</td>
									<td><a
										href="<c:url value ="/admin/deleteSupplier/${list.suppId}"/>"><span
											class="glyphicon glyphicon-trash"></span> DELETE /</a><a
										href="<c:url value="/admin/updateSupplier/${list.suppId}"/>"><span
											class="glyphicon glyphicon-pencil"></span> UPDATE</a></td>
								</tr>
							</c:forEach>

						</table>
					</div>

				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>