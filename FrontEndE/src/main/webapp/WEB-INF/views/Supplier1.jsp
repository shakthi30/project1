<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form:form action="${pageContext.request.contextPath}/addSupplier" modelAttribute="supplier" method="post">
<table>
	<tr>
		<td colspan="2">Supplier Details</td>
	</tr>
<tr>
		<td>Supplier Id</td>
		
		<td><form:input path="suppId"/></td>
	</tr>

	<tr>
		<td>Supplier Name</td>
		
		<td><form:input path="suppName"/></td>
	</tr>
	<tr>
		<td>Supplier Address</td>
		
		<td><form:input path="suppAddress"/></td>
	</tr>
	<tr>
		<td>Supplier E-Mail</td>
		
		<td><form:input path="suppEmail"/></td>
	</tr>
	<tr>
		<td>Supplier Phone</td>
		
		<td><form:input path="suppPhone"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="addSupplier"/>
		</td>
	</tr>
</table>

</form:form>
</body>
</html>