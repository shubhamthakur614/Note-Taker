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


public class UpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		
		
		try
		{
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			int id=Integer.parseInt(request.getParameter("id"));
			
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			NoteTaker note=(NoteTaker)s.get(NoteTaker.class, id);
			
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			response.sendRedirect("all_notes.jsp");
			
			tx.commit();
			s.close();
			
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
