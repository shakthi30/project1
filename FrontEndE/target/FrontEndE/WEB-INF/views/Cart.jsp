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
        padding-bottom: 50px;
      }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"></jsp:include>
<div class = "container">
<div class = "row">
<div class = "panel panel-default">
<div class = "panel-body">
<table class = "table table-striped">
<thead>
<tr>
<th>Product Name</th>
<th>Quantity</th>
<th>Price</th>
<th>Image</th>
<th>Total</th>
<th>Action</th>
</tr>
</thead>
<tbody>
<c:if test="${empty cartInfo}">
<tr><td colspan = "7" align = "center">No Record Exists</td></tr>
</c:if>
<c:forEach var = "c" items="${cartInfo }">
<tr><td>
${c.cartProdName}
</td>
<td>
${c.cartQnty}
</td>
<td>${c.cartPrice}</td>
<td><img width = "100px" height = "100px" src="<c:url value="/resources/images/${c.cartImg}.jpg"/>"/></td>
<td>${c.cartQnty * c.cartPrice}</td>
<td><a href="<c:url value ="/deletePCart/${c.cartId}"/>">DELETE</a></td>
<td><c:set var="gtotal" value = "${gtotal + c.cartPrice * c.cartQnty}"></c:set></td>
</tr>
</c:forEach>
<td><label>Grand Total:</label></td>
<td></td>
<td></td>
<td></td>
<td><c:out value="${gtotal}"></c:out></td>
<td><a href="<c:url value="/shipping"/>"><button>Check out</button></a></td>
</tbody>

</table>
</div>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>