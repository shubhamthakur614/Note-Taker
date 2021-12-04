<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_css_js.jsp"%>
</head>
<body>

	<!-- Navigation bar Include -->
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>Please fill your Note Details...</h1>
		<br>

		<!-- Form  -->
		<form action="SaveNoteServlet" method="post">
			<div class="mb-3">
				<label for="title" class="form-label">Note Title
				</label> 
					<input type="text" class="form-control" name="title"
					id="title" aria-describedby="emailHelp" placeholder="Enter here" required>
				
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea  id="content" name="content" placeholder="Enter your content here" 
				class="form-control" style="height: 300px" required></textarea>
			</div>
			
			<div class="contatiner text-center">
			<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
		<!-- Form  -->
	</div>


	<!-- Navigation bar Include -->

</body>
</html>