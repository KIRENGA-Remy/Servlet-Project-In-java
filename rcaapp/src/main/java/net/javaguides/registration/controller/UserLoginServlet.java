package main.java.net.javaguides.registration.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userlogin")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserLoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/user/userlogin.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uemail = request.getParameter("email");
		String upassword = request.getParameter("password");

		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;

		if (uemail == null || uemail.isEmpty()) {
			session.setAttribute("status", "invalidEmail");
			dispatcher = request.getRequestDispatcher("/WEB-INF/user/userlogin.jsp");
			dispatcher.forward(request, response);
			return;
		}

		if (upassword == null || upassword.isEmpty()) {
			session.setAttribute("status", "invalidPassword");
			dispatcher = request.getRequestDispatcher("/WEB-INF/user/userlogin.jsp");
			dispatcher.forward(request, response);
			return;
		}

		String url = "jdbc:postgresql://localhost:5432/student";
		String username = "postgres";
		String password = "remy2020";

		try (Connection connection = DriverManager.getConnection(url, username, password)) {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from usertable where email = ? and password = ? ");
			preparedStatement.setString(1, uemail);
			preparedStatement.setString(2, upassword);

			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				if (resultSet.next()) {
					session.setAttribute("name", resultSet.getString("email"));
					String role = resultSet.getString("roles");
					if ("Admin".equals(role)) {
						dispatcher = request.getRequestDispatcher("/WEB-INF/views/studentregister.jsp");
					} else {
						dispatcher = request.getRequestDispatcher("/WEB-INF/user/userwelcome.jsp");
					}
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return;
		}

		dispatcher.forward(request, response);
	}
}
