package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.NoteTaker;
import com.helper.FactoryProvider;

public class SaveNoteServlet extends HttpServlet 
{
	
	public SaveNoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			NoteTaker note=new NoteTaker(title, content, new Date());
			
//			System.out.println(note.getId()+" "+note.getTitle());
			
//			now to save our data we use hibernate don't need to create dao classes
//			use factory provider to get the object
			Session s=FactoryProvider.getFactory().openSession();
			
			Transaction tx=s.beginTransaction();
			s.save(note);
			tx.commit();
			
			out.println("<h1 style='text-align:center'>Your Note is save successfully in DB...</h1>");
			out.println("<h1 style='text-align:center'><a href='all_notes.jsp'>View All notes</a></h1>");
			//because session object are not thread save
			s.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
