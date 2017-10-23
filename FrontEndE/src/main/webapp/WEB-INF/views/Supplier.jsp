<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="addSupplier" method = "post">
<table cellspacing="3">
<tr>
<td>Supplier ID</td>
<td><input type="text" name="suppid"/></td>
</tr>
<tr>
<td>Supplier Name</td>
<td><input type="text" name="suppname"/></td>
</tr>
<tr>
<td>
Supplier Address
</td>
<td><input type="text" name="suppadd"/></td>
</tr>
<tr>
<td>
<center><input type="submit" value="ADD"/></center>
</td>
</tr>
</table>
</form>

</body>
</html>