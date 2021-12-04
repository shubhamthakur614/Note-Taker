<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.entity.NoteTaker"%>
<%@page import="java.util.List"%>


<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>
<%@include file="all_css_js.jsp"%>
</head>

<body>

	<!-- Navigation bar Include -->
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1 class="text-uppercase">All Notes</h1>

		<div class="row">
			<div class="col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from NoteTaker");
				List<NoteTaker> list = q.list();
				for (NoteTaker note : list) {
				%>

				<!-- Cards tag so that it will iterate based on data inside for loop -->
				<div class="card mt-3">
					<img src="img/notes.png" class="card-img-top p-4" style="max-width:100px;" alt="note.png">
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle() %></h5>
						<p class="card-text"><%=note.getContent() %></p>
						<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
						<a href="update.jsp?note_id=<%=note.getId() %>" class="btn btn-warning">Update</a>
					     <p style="margin-top:15px; float: right"><b class="text-primary "><%=note.getAddedDate() %></b></p>
					</div>
				</div>
				<%
				}
				s.close();
				%>

			</div>

		</div>



	</div>

	<!-- Navigation bar Include -->

</body>
</html>