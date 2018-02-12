<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
  body{        
        padding-bottom: 100px;
    }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"></jsp:include>

<div class = "container">
<div class = "panel panel-default">
<div class = "panel-body">
<table align="center" class = "table table-striped text-center" cellspacing = "50">
<tr>
<th>Image</th>
<th>Product Name</th>
<th>Category Name</th>
<th>Supplier Name</th>
<!-- <th>Product Description</th> -->
<th>Stock</th>
<th>Price</th>
<th>Details</th>

</tr>
 <c:forEach items="${productList}" var="list">
<tr>
<td><img width = "100px" height = "100px" src="<c:url value="/resources/images/${list.productId}.jpg"/> "/></td>
<td>${list.productName}</td>
<td>${list.catName}</td>
<td>${list.suppName}</td>
<td>${list.stock}</td>
<td>${list.price}</td>
<td><a href="<c:url value ="/productDetails/${list.productId}"/>"><span class="glyphicon glyphicon-th-list"></span> VIEW PRODUCT</a></td>
</tr>
</c:forEach> 
</table>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>