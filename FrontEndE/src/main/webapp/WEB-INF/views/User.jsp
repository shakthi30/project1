<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "com.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table cellspacing = "2" align="center">
<tr>
<td>ID</td>
<td>Name</td>

</tr>
<c:forEach items="${UserList}" var="list">
<tr>
<td>${list.id}</td>
<td>${list.name}
</tr>
</c:forEach>

</table>

</body>
</html>