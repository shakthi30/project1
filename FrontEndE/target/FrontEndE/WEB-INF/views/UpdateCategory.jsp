<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.model.Category"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html >
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
<form:form action="${pageContext.request.contextPath}/admin/updateResult" modelAttribute="category" method="post">

<table>
	<tr>
		<td colspan="2">Category Module</td>
	</tr>
	<tr>
		<td>Category ID</td>
		<!--<td><input type="text" name="catId"/></td>-->
		<td><form:input path="catId"/></td>
	</tr>
	<tr>
		<td>Category Name</td>
		<!-- <td><input type="text" name="catName"/></td> -->
		<td><form:input path="catName"/></td>
	</tr>
	<tr>
		<td>Category Desc</td>
		<!-- <td><input type="text" name="catDesc"/></td> -->
		<td><form:input path="catDesc"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="UpdateCategory"/>
		</td>
	</tr>
</table>

</form:form>
</body>
</html>