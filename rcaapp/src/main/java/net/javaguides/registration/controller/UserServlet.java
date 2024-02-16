package main.java.net.javaguides.registration.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.java.net.javaguides.model.Usertable;
import main.java.net.javaguides.registration.StudentDao.UserDao;

@WebServlet("/userregister")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDao userDao = new UserDao();

	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/user/userregister.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Usertable usertable = new Usertable();
		usertable.setUsername(username);
		usertable.setEmail(email);
		usertable.setPassword(password);

		try {
			userDao.registerUser(usertable);
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/user/userlogin.jsp");
		dispatcher.forward(request, response);
	}
}
