<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="" enctype="multipart/form-data"></form>
<table cellspacing="2" align="center">
<tr style="background-color:#dddddd;">
<!-- <th>Product ID</th> -->
<th>Category Name</th>
<th>Supplier Name</th>
<th>Product Name</th>
<th>Product Description</th>
<th>Stock</th>
<th>Price</th>
<th>Image</th>
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
</tr>
</c:forEach> 
</table>

</body>
</html>