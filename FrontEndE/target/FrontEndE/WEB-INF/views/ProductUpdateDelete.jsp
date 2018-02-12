<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
  body{        
        padding-bottom: 100px;
      }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"></jsp:include>
<form action="" enctype="multipart/form-data"></form>
<div class = "container">
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
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>