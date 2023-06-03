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

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String em = req.getParameter("email");
			String ps = req.getParameter("psw");
			User u = new User();
			HttpSession session = req.getSession();
			
			if ("admin@gmail.com".equals(em) && "admin".equals(ps)) {
				session.setAttribute("userobj", u);
				u.setName("Admin");
				u.setRole("admin");
				resp.sendRedirect("admin.jsp");
			}
			else {
				Userdao dao=new Userdao(DBconnect.getconn());
				User user = dao.login(em, ps);
			
				if (user!=null) {
					session.setAttribute("userobj", user);
					resp.sendRedirect("home.jsp");
				}else {
					session.setAttribute("msg", "Invalid User Name And Password");
					resp.sendRedirect("login.jsp");
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
