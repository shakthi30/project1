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
<form action="AddCategory" method="get">
<table>
<tr>
<td>
Category ID
</td>
<td><input type = "text" name = "CatId"/>
</td>
</tr>
<tr>
<td>
Category Name
</td>
<td><input type = "text" name = "CatName"/>
</td>
</tr>
<tr>
<td>
Category Description
</td>
<td><input type = "text" name = "CatDesc"/>
</td>
</tr>
<tr>
<td>
<input type="submit" value="ADD"/>
</td>
</tr>
</table>
</form>

<table cellspacing = "2" align="center">
<tr style="background-color:#dddddd;">
<th>Category Id</th>
<th>Category Name</th>
<th>Category Description</th>
<th>Operation</th>
</tr>
<c:forEach items="${catlist}" var="list">
<tr>
<td>${list.catId}</td>
<td>${list.catName}</td>
<td>${list.catDesc}</td>
<td><a href = "<c:url value ="/deleteCategory/${list.catId}"/>">Delete/</a><a href="<c:url value="updateCategory/${list.catId}"/>">Update</a></td>
</tr>
</c:forEach>

</table>

</body>
</html>