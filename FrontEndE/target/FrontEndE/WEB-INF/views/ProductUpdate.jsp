<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
<form:form action="${pageContext.request.contextPath}/admin/addProduct1" modelAttribute="product" method="post" enctype="multipart/form-data">

<table>
	<tr>
		<td colspan="2">Category Module</td>
	</tr>
	<tr>
		<td>Category Name</td>
		<!--<td><input type="text" name="catId"/></td>-->
		<td><form:select path="catName">
	
		<form:options items="${catlist}"></form:options>
		
		</form:select></td>
	</tr>
	<tr>
		<td>Supplier Name</td>
		<!-- <td><input type="text" name="catName"/></td> -->
			<td><form:select path="suppName">
			
		<form:options items="${supplist}"></form:options>
		</form:select></td>
	</tr>
	<tr>
		<td>Product Id</td>
		<!-- <td><input type="text" name="catDesc"/></td> -->
		<td><form:input path="productId"/></td>
	</tr>
	<tr>
		<td>Product Name</td>
		<!-- <td><input type="text" name="catDesc"/></td> -->
		<td><form:input path="productName"/></td>
	</tr>
	<tr>
		<td>Product Description</td>
		<!-- <td><input type="text" name="catDesc"/></td> -->
		<td><form:input path="productDesc"/></td>
	</tr>
	<tr>
		<td>Stock</td>
		<!-- <td><input type="text" name="catDesc"/></td> -->
		<td><form:input path="stock"/></td>
	</tr>
	<tr>
		<td>Price</td>
		<!-- <td><input type="text" name="catDesc"/></td> -->
		<td><form:input path="price"/></td>
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
		<td colspan="2">
			<input type="submit" value="UpdateProduct"/>
		</td>
	</tr>
</table>

</form:form>

</body>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>