package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.jobDAO;
import com.entity.Jobs;

@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String title = req.getParameter("title");
			String description = req.getParameter("description");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String location = req.getParameter("location");

			Jobs j = new Jobs(title, description, category, status, location);
			 
			

			HttpSession session = req.getSession();
			
			jobDAO dao = new jobDAO(DBconnect.getconn());
			boolean f = dao.addjobs(j);
			if (f) {
				session.setAttribute("msg", "Job added successfully");
				resp.sendRedirect("AddJob.jsp");
			}else {
				session.setAttribute("msg"," something went wrong");
				resp.sendRedirect("AddJob.jsp");
			}

		} 
		
		catch (Exception e) {
			e.printStackTrace();
		}

		 

	}

}
