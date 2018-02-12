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
        padding-bottom: 100px;
      }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"></jsp:include>
<div class = "container">
<div class = "panel panel-default">
<div class = "panel-body">
<table cellspacing = "2" align="center" class = "table table-striped text-center">
<tr>
<th>Supplier ID</th>
<th>Supplier Name</th>
<th>Supplier Address</th>
<th>Supplier E-Mail</th>
<th>Supplier Phone</th>
<th>Operation</th>
</tr>
<c:forEach items="${suppList}" var="list">
<tr>
<td>${list.suppId}</td>
<td>${list.suppName}</td>
<td>${list.suppAddress}</td>
<td>${list.suppEmail}</td>
<td>${list.suppPhone}</td>
<td><a href = "<c:url value ="/admin/deleteSupplier/${list.suppId}"/>"><span class="glyphicon glyphicon-trash"></span> DELETE /</a><a href="<c:url value="/admin/updateSupplier/${list.suppId}"/>"><span class="glyphicon glyphicon-pencil"></span> UPDATE</a></td>
</tr>
</c:forEach>

</table>
</div>
</div>
</div>
</body>
</html>