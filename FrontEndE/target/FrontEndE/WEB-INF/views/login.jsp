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
        padding-bottom: 50px;
            overflow-x: hidden;
      }
        .panel-body
      {
       background-color: #f2f2f2;
      }
      .panel 
      { 
        width: 30%;
   
      } 
      button
      {
        width: 100%;
      }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"></jsp:include>
<div class = "container text-center">
<mark><c:out value="${Error}"></c:out></mark>
</div>


<div class = "container">
<div class = "row">

<div class = "col-md-4 col-md-offset-4">
<img src="https://www.optimumnutrition.com/us/img/static/black-logo.svg"> <b>OPTIMUM NUTRITION</b>
	<form action="<c:url value="/login"></c:url>" method='post'>
		<div class="container" >
			<div class='panel panel-default'>
				<div class="panel-body">
					<div class="form-group">
						<label for="username">Login ID:</label> <input type="text"
							class="form-control" id="username" name="username" required />
					</div>
					<div class="form-group">
						<label for="email">Password:</label> <input type="password"
							 class="form-control" id="password" name="password" required>
					</div>
					
					<button type="submit" class="btn btn-success">Submit</button>
				</div>
			</div>
		</div>
		 <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<%-- <form action="<c:url value="/login"></c:url>" method='post'>
<table align = "center">
<tr>
<td>
Login ID
</td>
</tr>
<tr>
<td>
<input type="text" name="username">
</td>
</tr>
<tr>
<td>
Password
</td>
</tr>
<tr>
<td>
<input type = "password" name="password">
</td>
</tr>
<tr>

<td><input type="submit" value="SUBMIT"></td>

</tr>
</table>
 <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
</form> --%>
</body>
</html>