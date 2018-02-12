<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/Header.jsp"%>
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
	overflow-x : hidden;
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
	<div class="container">
		<div class="row">

			<div class="col-md-4">
				<form:form
					action="${pageContext.request.contextPath}/admin/addProduct"
					modelAttribute="product" method="post"
					enctype="multipart/form-data">


					<div class="container">
						<div class='panel panel-default' id="panel1">
							<div class="panel-body">

								<div class="form-group">
									<label for="CatName">Category Name</label>
									<form:select path="catName" id="CatName" class="form-control">

										<form:options items="${catlist}"></form:options>

									</form:select>
								</div>
								<div class="form-group">
									<label for="SuppName">Supplier Name</label>
									<form:select path="suppName" id="SuppName" class="form-control">

										<form:options items="${supplist}"></form:options>
									</form:select>
								</div>
								<div class="form-group">
									<label for="ProductName">Product Name</label>${invalidName}
									<form:input path="productName" class="form-control"
										id="ProductName" placeholder= "Enter valid name" required="required" />
								</div>
								<div class="form-group">
									<label for="ProductName">Product Description</label>${invalidDesc}
									<form:input path="productDesc" class="form-control"
										id="ProductDesc" placeholder= "Enter valid details" required="required" />
								</div>

								<form:input path="productId" type="hidden" />

								<div class="form-group">
									<label for="Stock">Stock</label>${invalidStock}
									<form:input path="stock" class="form-control" id="Stock" placeholder= "Enter digits only"
										required="required" />
								</div>
								<div class="form-group">
									<label for="Price">Price</label>${invalidPrice}
									<form:input path="price" class="form-control" id="Price" placeholder= "Enter digits only"
										required="required" />
								</div>
								<div class="form-group">
									<label for="Choose Image">Choose Image</label> <input
										type="file" name="pimag" id="Choose Image"
										class="form-control" />
								</div>
								<div class="form-group" >
									<button type="submit" name="add" id = "Add" class="btn btn-success">
										<span class="glyphicon glyphicon-plus-sign"></span> ADD
									</button>
									<button type="submit" name="update" id = "Update" class="btn btn-success" >
										<span class="glyphicon glyphicon-plus-sign"></span> UPDATE
									</button>
								</div>
							</div>
						</div>
					</div>
				</form:form>

			</div>
		<div class = "container">
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-body">
						<table cellspacing = "2" align="center" class="table table-striped text-center">
							<tr>
								<th>Category Name</th>
								<th>Supplier Name</th>
								<th>Product Name</th>
								<th>Product Description</th>
								<th>Stock</th>
								<th>Price</th>
								<th>Image</th>
								<th>Action</th>
							</tr>
							<c:forEach items="${productList}" var="list">
								<tr>
									<%--%><td>${list.productId}</td> --%>
									<td>${list.catName}</td>
									<td>${list.suppName}</td>
									<td>${list.productName}</td>
									<td>${list.productDesc}</td>
									<td>${list.stock}</td>
									<td>${list.price}</td>
									<td><img width="100px" height="100px"
										src="<c:url value="/resources/images/${list.productId}.jpg"/> " />
									</td>
									<td><a 
										href="<c:url value="/admin/deleteProduct/${list.productId}"/>" ><span
											class="glyphicon glyphicon-trash"></span> DELETE /</a> <a
										href='<c:url value="/admin/updateProduct/${list.productId}"></c:url>'><span
											class="glyphicon glyphicon-pencil"></span> UPDATE</a></td>
								</tr>

							</c:forEach>
						</table>
					</div>
				</div>
		
             </div>
             </div>
		</div>
	</div>




</body>
</html>