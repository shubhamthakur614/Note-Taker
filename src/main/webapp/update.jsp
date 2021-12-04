<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update you Note</title>
<%@page import="org.hibernate.*,com.entity.*,com.helper.*" %>

<%@include file="all_css_js.jsp"%>
</head>
<body>
	<div class="container">
	<%@include file="navbar.jsp" %>
	
	<h1 class="text-uppercase">Update Your Note....</h1>
	
	<% 
	int note_id = Integer.parseInt(request.getParameter("note_id").trim());
	Session s = FactoryProvider.getFactory().openSession();	
	NoteTaker id=(NoteTaker)s.get(NoteTaker.class, note_id);
	%>
	

	<form action="UpdateServlet" method="post">
	
	<!--  Hidden form field-->
	
	<input type="hidden" name="id" value="<%=id.getId()%>">
	
			<div class="mb-3">
				<label for="title" class="form-label">Update Note Title
				</label> 
					<input type="text" class="form-control" name="title"
					id="title" aria-describedby="emailHelp" placeholder="Enter here"
					 required  value="<%=id.getTitle()%>">
				
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Update Note Content</label>
				<textarea  id="content" name="content" placeholder="Enter your content here" 
				class="form-control" style="height: 300px" required ><%=id.getContent() %>
				
				</textarea>
			</div>
			
			<div class="contatiner text-center">
			<button type="submit" class="btn btn-success">Update your Note</button>
			</div>
		</form>
	
	
	</div>

</body>
</html>