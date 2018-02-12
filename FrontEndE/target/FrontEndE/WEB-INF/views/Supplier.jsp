<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.model.Supplier"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
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
<form:form action="${pageContext.request.contextPath}/admin/addSupplier" modelAttribute = "supplier" method="post">
<div class="container" >
			<div class='panel panel-default' id = "panel1">
				<div class="panel-body">
				<div class="form-group">
						<label for="SuppName">Supplier Name:</label> 
                                 <form:input path="suppName" id = "SuppName" class="form-control"/>
                                 </div>
                                <div class="form-group">
						<label for="SuppAddress">Supplier Address:</label> 
						<form:input path="suppAddress" class="form-control" id = "SuppAddress"/>
						</div>
                        <div class="form-group">
						<label for="SuppEmail">Supplier Email:</label>
						<form:input class="form-control" path="suppEmail" id = "SuppEmail"/>
						</div>
						  <div class="form-group">
						<label for="SuppPhone">Supplier Phone:</label>
						<form:input class="form-control" path="suppPhone" id = "SuppPhone"/>
						</div>					
						<form:input class="form-control" path="suppId" type = "hidden"/>
						</div>
<button type="submit" name = "add" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> ADD</button>
<button type="submit" name = "update" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> UPDATE</button>
</div>
</div>
</form:form>
</div>

<%-- <form action="${pageContext.request.contextPath}/admin/addSupplier" method="post">
<div class="container" >
			<div class='panel panel-default' id = "panel1">
				<div class="panel-body">
								<div class="form-group">
									<label for="suppName">Supplier Name:</label>
									<input type="text"
							class="form-control" id="suppName" name="suppName" required />
								</div>
								<div class="form-group">
									<label for="suppAddress">Supplier Address:</label>
									<input type="text"
							class="form-control" id="suppAddress" name="suppAddress" required />
								</div>
								<div class="form-group">
									<label for="suppEmail">Supplier Email:</label>
									<input type="text"
							class="form-control" id="suppEmail" name="suppEmail" required />
								</div>
								<div class="form-group">
									<label for="suppPhone">Supplier Phone:</label>
									<input type="text"
							class="form-control" id="suppPhone" name="suppPhone" required />
								</div>
								<button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> ADD</button>
				</div>
			</div>
		</div>
		
	</form>
	</div>
	 --%>
	
	<div class = "col-md-8">
	<div class = "panel panel-default">
<div class = "panel-body">
<table cellspacing = "2" align="center" class = "table table-striped text-center">
<tr>
<th>Supplier ID</th>
<th>Supplier Name</th>
<th>Supplier Address</th>
<th>Supplier E-Mail</th>
<th>Supplier Phone</th>
<th>Action</th>
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
</div>
	</div>
<%-- <table>
<table>
	<tr>
		<td colspan="2">Supplier Details</td>
	</tr>

	<tr>
		<td>Supplier Name</td>
	<td><input type="text" name="suppName" required/></td>
		
	</tr>
	<tr>
		<td>Supplier Address</td>
		<td><input type="text" name="suppAddress" required/></td> 	
		
	</tr>
	<tr>
		<td>Supplier Email</td>
	 <td><input type="text" name="suppEmail" required/></td>
		
	</tr>
	<tr>
		<td>Supplier Phone</td>
		<td><input type="text" name="suppPhone" required/></td> 
		
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="UpdateSupplier"/>
		</td>
	</tr>
</table>
</form> --%>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>