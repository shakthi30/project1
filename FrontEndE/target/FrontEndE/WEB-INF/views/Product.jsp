<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ include file="/WEB-INF/views/Header.jsp" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
  body{        
        padding-bottom: 100px;
      }
               .panel-body
      {
       background-color: #f2f2f2;
      }
      #panel1
      { 
        width: 30%;
   
      } 
</style>
</head>
<body>
<div class = "container">
<div class = "row">

<div class = "col-md-4">
<form:form action="${pageContext.request.contextPath}/admin/addProduct" modelAttribute="product" method="post" enctype="multipart/form-data">


<div class="container" >
			<div class='panel panel-default' id = "panel1">
				<div class="panel-body">

	<div class = "form-group">
	<label for = "CatName">Category Name</label>
		<form:select path="catName" id = "CatName" class = "form-control">
	
		<form:options items="${catlist}"></form:options>
		
		</form:select>
	</div>
		<div class = "form-group">
	<label for = "SuppName">Supplier Name</label>
		<form:select path="suppName"  id = "SuppName" class = "form-control">
			
		<form:options items="${supplist}"></form:options>
		</form:select>
	</div>
	<div class = "form-group">
	<label for = "ProductName">Product Name</label>
		<form:input path="productName" class = "form-control" id = "ProductName" required = "required"/>
	</div>
			<div class = "form-group">
	<label for = "ProductName">Product Description</label>
		<form:input path="productDesc" class = "form-control" id = "ProductDesc" required = "required" />
	</div>
		
	<form:input path="productId" type="hidden"/>

		<div class = "form-group">
	<label for = "Stock">Stock</label>
		<form:input path="stock" class = "form-control" id= "Stock" required = "required"/>
	</div>
			<div class = "form-group">
	<label for = "Price">Price</label>
		<form:input path="price" class = "form-control" id = "Price" required = "required"/>
	</div>
			<div class = "form-group">
	<label for = "Choose Image">Choose Image</label>
		<input type = "file" name="pimag"  id = "Choose Image" class = "form-control" required = "required"/>
	</div>
		<div class = "form-group">
		<button type="submit" name = "add" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> ADD</button>
					<button type="submit" name = "update" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> UPDATE</button>
	</div>
</div>
</div>
</div>  
</form:form>

<%-- <form action="${pageContext.request.contextPath}/admin/addProduct" method="post" enctype="multipart/form-data">
<div class="container" >
			<div class='panel panel-default' id = "panel1">
				<div class="panel-body">
								<div class="form-group">
									<label for="selec">Category Name:</label> <select id="selec" 
										name="catName">
									
										<c:forEach items="${categoryList}" var = "list" > 
										
											<option value="${list.catName}">${list.catName}</option>
										 </c:forEach> 
									</select>
								</div>
								<div class="form-group">
									<label for="selec">Supplier Name:</label> <select id = "selec"
										name="suppName">
										 <c:forEach items="${supplierList}" var = "list"> 
											<option value="${list.suppName}">${list.suppName}</option>
										 </c:forEach> 
									</select>
								</div>
                                          	<div class="form-group">
									<label for="productName">Product Name:</label> 
									<input type="text"
							class="form-control" id="productName" name="productName" value = "${product.productName}" required />
								</div>
                                                   	<div class="form-group">
									<label for="productDesc">Product Description:</label> 
									<input type="text"
							class="form-control" id="productDesc" name="productDesc" value = "${product.productDesc}" required />
								</div>
                                                              	<div class="form-group">
									<label for="stock">Stock:</label> 
									<input type="text"
							class="form-control" id="stock" name="stock" value = "${product.stock}" required />
								</div>
								                          	<div class="form-group">
									<label for="price">Price:</label> 
									<input type="text"
							class="form-control" id="price" name="price" value = "${product.price}" required />
								</div>
								                       	<div class="form-group">
									<label for="pimag">Choose Image:</label> 
									<input type="file"
							class="form-control" id="pimag" name="pimag" required />
								</div>
								
					<div>
					  <input type="text" hidden = "true" name = "productId"
							 value = "${prodId}" />
					</div>
					<button type="submit" name = "add" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> ADD</button>
					<button type="submit" name = "update" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> UPDATE</button>
				</div>
			</div>
		</div>
		
	</form> --%>
	</div>
	<div class = "col-md-8">
	<div class = "panel panel-default">
<div class = "panel-body">
<table cellspacing="2" align="center" class = "table table-striped text-center">
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
<td>
<img width = "100px" height = "100px" src="<c:url value="/resources/images/${list.productId}.jpg"/> "/>
</td>
<td><a href="<c:url value="/admin/deleteProduct/${list.productId}"/>"><span class="glyphicon glyphicon-trash"></span> DELETE /</a> <a href='<c:url value="/admin/updateProduct/${list.productId}"></c:url>'><span class="glyphicon glyphicon-pencil"></span> UPDATE</a></td>
</tr>

</c:forEach> 
</table>
</div>
</div>
</div>
	</div>

	

	</div>
	



</body>
</html>