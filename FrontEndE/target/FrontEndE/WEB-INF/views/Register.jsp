<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
  body
      {        
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
<div class = "container">
<div class = "row">

<div class = "col-md-4 col-md-offset-4">
<img src="https://www.optimumnutrition.com/us/img/static/black-logo.svg"> <b>OPTIMUM NUTRITION</b>
	<form action="register">
		<div class="container" >
			<div class='panel panel-default'>
				<div class="panel-body">
					<div class="form-group">
					${error}
					
						<label for="name">Your Name:</label> <input type="text"
							class="form-control" id="name" name="name" required />
					</div>
					<div class="form-group">
						<label for="email">Email address:</label> <input type="text"
							name="email" class="form-control" id="email" required>
					</div>
					<div class="form-group">
						<label for="email">Delivery address(Home/Office):</label> <input
							type="text" name="address" class="form-control" id="address"
							required>
					</div>
					<div class="form-group">
						<label for="phone">Mobile Number:</label> <input type="text"
							class="form-control" id="phone" name="phone" required /><p id = "demo"></p>
					</div>
					<div class="form-group">
						<label for="password">Password:</label> <input
							type="password" class="form-control" id="password"
							name="password" required />
					</div>
					<div class="form-group">
						<label for="role">Role:</label> <input type="text" value = "ROLE_USER" readonly
							class="form-control" id="role" name="role" required />
					</div>
					<button type="submit" onclick = "myFunction()" class="btn btn-success">Submit</button>
				</div>
			</div>
		</div>
		
	</form>
	</div>
	</div>
	</div>
	<script>
	function myFunction()
	{
		var x, text;
		x = document.getElementById("phone").value;
		if(isNaN || x < 1 )
			{
			text = "input not valid"
			}
		document.getElementById("demo").innerHTML = text;
		
	}
	</script>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>