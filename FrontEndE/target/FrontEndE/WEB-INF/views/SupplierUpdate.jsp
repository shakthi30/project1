<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
<form:form action="${pageContext.request.contextPath}/admin/getResult" modelAttribute="supplier" method="post">

<table>
	<tr>
		<td colspan="2">Category Module</td>
	</tr>
	<tr>
		<td>Supplier ID</td>
		<!--<td><input type="text" name="catId"/></td>-->
		<td><form:input path="suppId" readonly="true"/></td>
	</tr>
	<tr>
		<td>Supplier Name</td>
		<!--<td><input type="text" name="catId"/></td>-->
		<td><form:input path="suppName"/></td>
	</tr>
	<tr>
		<td>Supplier Address</td>
		<!-- <td><input type="text" name="catName"/></td> -->
		<td><form:input path="suppAddress"/></td>
	</tr>
	<tr>
		<td>Supplier Email</td>
		<!-- <td><input type="text" name="suppEmail"/></td> -->
		<td><form:input path="suppEmail"/></td>
	</tr>
		<tr>
		<td>Supplier Phone</td>
		<!-- <td><input type="text" name="suppEmail"/></td> -->
		<td><form:input path="suppPhone"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="UpdateSupplier"/>
		</td>
	</tr>
</table>

</form:form>
</body>
</html>