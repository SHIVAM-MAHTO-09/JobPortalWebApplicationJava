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

@WebServlet("/DeleteJobServlet")
public class DeleteJobServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			
			HttpSession session = req.getSession();
			jobDAO dao=new jobDAO(DBconnect.getconn());
			
			boolean f=dao.deleteJobs(id);
			if (f) {
				session.setAttribute("msg", "Job Deleted successfully");
				resp.sendRedirect("ViewJob.jsp");
			} else {
				session.setAttribute("msg", " something went wrong");
				resp.sendRedirect("ViewJob.jsp");
			}
 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
