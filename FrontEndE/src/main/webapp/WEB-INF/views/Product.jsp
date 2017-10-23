<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="addProduct" method="post" enctype="multipart/form-data">
<table>
<!-- <tr>
<td>Product ID</td>
<td><input type = "text" name = "productId"/></td>
</tr> -->
<tr>
<td>Category Name</td>
<td>
<select id="selec" name="catName">
<c:forEach items = "${categoryList}" var="list">
<option value="${list.catName}">${list.catName}</option>
</c:forEach>
</select>

</td>
</tr>
<tr>
<td>Supplier Name</td>
<td>
<select name="suppName">
<c:forEach items = "${supplierList}" var="list">
<option value="${list.suppName}">${list.suppName}</option>
</c:forEach>
</select>
</td>
</tr>
<tr>
<td>Product Name</td>
<td><input type = "text" name = "productName"/></td>
</tr>
<tr>
<td>Product Description</td>
<td><input type = "text" name = "productDesc"/></td>
</tr>
<tr>
<td>Stock</td>
<td><input type = "text" name = "stock"/></td>
</tr>
<tr>
<td>Price</td>
<td><input type = "text" name = "price"/></td>
</tr>
<tr>
<td>
Choose Image
</td>
<td>
<input type = "file" name="pimag"/>
</td>
</tr>
<tr>
<td>
<input type = "submit" value = "Add"/>
</td>
</tr>

</table>
</form>
</body>
</html>