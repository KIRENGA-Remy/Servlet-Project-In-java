package main.java.net.javaguides.registration.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
		String roles = request.getParameter("roles");

		boolean isEmailAvailable = false;
		try {
			isEmailAvailable = userDao.isEmailAvailable(email);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (!isEmailAvailable) {
			// Email already exists in the database
			request.setAttribute("status", "emailExists");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/user/userregister.jsp");
			dispatcher.forward(request, response);
			return;
		}

		// Validate the password using a regular expression
		String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
		Pattern pattern = Pattern.compile(passwordRegex);
		Matcher passwordMatcher = pattern.matcher(password);

		if (!passwordMatcher.matches()) {
			// Password does not meet the requirements
			request.setAttribute("status", "invalidPassword");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/user/userregister.jsp");
			dispatcher.forward(request, response);
			return;
		}

		Usertable usertable = new Usertable();
		usertable.setUsername(username);
		usertable.setEmail(email);
		usertable.setPassword(password); // Store the hashed password
		usertable.setRole(roles);

		try {
			userDao.registerUser(usertable);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// Set an attribute to indicate that the user is coming from the registration
		// page
		request.setAttribute("registrationCompleted", true);

		// Forward the request to the userlogin.jsp page
		RequestDispatcher dispatcherReq = request.getRequestDispatcher("/WEB-INF/user/userlogin.jsp");
		dispatcherReq.forward(request, response);
	}

}
