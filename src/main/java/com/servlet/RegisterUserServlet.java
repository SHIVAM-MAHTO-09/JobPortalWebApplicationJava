package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.Userdao;
import com.entity.User;

@WebServlet("/RegisterUserServlet")
public class RegisterUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("psw");
			String qualification = req.getParameter("qualification");
			User u = new User(name, email, password,qualification, "user");

			HttpSession session = req.getSession();

			Userdao dao = new Userdao(DBconnect.getconn());
			boolean f = dao.addUser(u);
			if (f) {
				session.setAttribute("msg", "Registration Successfull");
				resp.sendRedirect("login.jsp");
			} else {
				session.setAttribute("msg", "Try Again");
				resp.sendRedirect("SignUp.jsp");

			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
