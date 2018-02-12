
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
 body{        
        padding-bottom: 100px;
    }
     .panel-body
      {
       background-color: #f2f2f2;
      }
   
    ul.a
    {
       list-style-position: outside;
    }
    p {
    text-align: justify;
    text-justify: inter-word;
}
   
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

<%@ include file="/WEB-INF/views/Header.jsp" %>

<div class="container">
 
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="https://i.ytimg.com/vi/haGuMkHaJhY/maxresdefault.jpg" alt="Los Angeles" style="width:100%;">
      </div>

      <div class="item">
        <img src="https://s3.amazonaws.com/strengthblog/wp-content/uploads/2016/03/22151628/Strength_Catalyst_Blog_Ad_1200x768-2.png" alt="Chicago" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="https://www.iafstore.com/public/UserFiles/Image/muscletech.jpg" alt="New york" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<br>
<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-default">
       
        <div class="panel-body"><a href = "C:\\Users\\user\\Desktop\\gold-standard-whey-2500.png"><img src="https://www.optimumnutrition.com/us/img/media/products/gold-standard-whey-601.jpg" class="img-responsive" style="width:100%" alt="Image"></a></div>
        <div class="panel-footer">Nutition Information</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-default">
        <div class="panel-heading">BLACK FRIDAY DEAL</div>
        <div class="panel-body"><img src="https://i.pinimg.com/736x/bf/13/11/bf1311aea17c97f000925263b479e52f--protein-for-the.jpg" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">Flat 20% off Get a gift card</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-default">
        <div class="panel-heading">BLACK FRIDAY DEAL</div>
        <div class="panel-body"><a></a><img src="https://img3.hkrtcdn.com/1528/prd_152792_c_l.jpg" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">Six Pack nutrition 100% whey 15% off</div>
      </div>
    </div>
  </div>
</div><br>
<div class = "container">
<div class = "row">
<div class = "panel panel-default">
<div class = "panel-body">
<h3>THE TRUE STRENGTH OF WHEY</h3>
<p>
Whey Protein Isolates (WPI) are the purest form of whey protein that currently exists. 
WPIs are costly to use, but rate among the best proteins that money can buy. 
That's why they're the first ingredient you read on the Gold Standard 100% Whey™ label. 
By using WPI as the primary ingredient along with premium ultra-filtered whey protein concentrate (WPC),
we're able to pack 24 grams of protein into every serving to support your muscle building needs after training. 
ON's attention to detail also extends to mixability. This superior quality powder has been instantized to mix easily using a shaker 
cup or just a glass and spoon. There's no doubt that this is the standard by which all other whey proteins are measured.
</p>
<ul class = "a">
<li>Whey Protein Isolate (WPI) Main Ingredient</li>
<li>Whey Protein Microfractions from Whey Protein Isolates & Ultra-Filtered Whey Protein Concentrate</li>
<li>Over 4 Grams of Glutamine & Glutamic Acid in Each Serving</li>
<li>More Than 5 Grams of the Naturally Occurring Branched Chain Amino Acids (BCAAs) Leucine, Isoleucine, and Valine in Each Serving</li>
<li>The "Gold Standard" for Protein Quality</li>

</ul>


</div>
</div>
</div>
</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
</body>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>
