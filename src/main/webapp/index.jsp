<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Note Taker : Home Page</title>
<%@include file="all_css_js.jsp"%>

</head>
<body>

	<!-- Navigation bar Include -->
	<div class="container ">
		<%@include file="navbar.jsp"%>
		
		<div class="card py-5">
		<img alt="NoteTaker" src="img/notes.png" style="max-width:400px;"
		class="img-fluid mx-auto">
		<h1 class="text-primary text-center mt-3 text-upercase">Start Taking your Notes..</h1>
		<div class="container text-center">
		<button class="btn btn-outline-primary text-center"><a href="add_notes.jsp"style="text-decoration: none; color:black">Start Here</a></button>
		</div>
		
		</div>
		
	</div>
      
	<!-- Navigation bar Include -->
   


	
</body>
</html>