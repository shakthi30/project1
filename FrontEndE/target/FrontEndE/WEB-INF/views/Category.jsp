<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
  body{        
        padding-bottom: 100px;
      }
           .panel-body
      {
       background-color: #f2f2f2;
      }
      #panel1 
      { 
        width: 30%;
   
      } 
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"></jsp:include>

<div class = "container">
<div class = "row">

<div class = "col-md-4">
<form:form action="${pageContext.request.contextPath}/admin/AddCategory" modelAttribute = "category" method="post">
<div class="container" >
			<div class='panel panel-default' id = "panel1">
				<div class="panel-body">
				
                                <div class="form-group">
						<label for="CatName">Category Name:</label> 
						<form:input path="catName" class="form-control" id = "CatName"/>
						</div>
                        <div class="form-group">
						<label for="CatDesc">Category Desc.:</label>
						<form:input class="form-control" path="catDesc" id = "CatDesc"/>
						</div>
<button type="submit" name = "add" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> ADD</button>
<button type="submit" name = "update" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> UPDATE</button>
</div>
</div>
</div>
</form:form>
</div>
<div class = "col-md-8">
<div class = "panel panel-default">
<div class = "panel-body">
<table cellspacing = "2" align="center" class = "table table-striped text-center">
<tr>
<th>Category Id</th>
<th>Category Name</th>
<th>Category Description</th>
<th>Action</th>
</tr>
<c:forEach items="${catlist}" var="list">
<tr>
<td>${list.catId}</td>
<td>${list.catName}</td>
<td>${list.catDesc}</td>
<td><a href = "<c:url value ="/admin/deleteCategory/${list.catId}"/>"><span class="glyphicon glyphicon-trash"></span> DELETE /</a><a href="<c:url value="/admin/updateCategory/${list.catId}"/>"><span class="glyphicon glyphicon-pencil"></span> UPDATE</a></td>
</tr>
</c:forEach>

</table>
</div>
</div>
</div>
</div>
</div>

</body>
</html>