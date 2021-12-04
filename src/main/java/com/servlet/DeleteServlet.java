package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.NoteTaker;
import com.helper.FactoryProvider;

public class DeleteServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			int note_id = Integer.parseInt(request.getParameter("note_id").trim());
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();

			NoteTaker id=(NoteTaker)s.get(NoteTaker.class, note_id);
			s.delete(id);
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
