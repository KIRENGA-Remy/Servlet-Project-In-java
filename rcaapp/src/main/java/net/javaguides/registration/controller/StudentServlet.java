package main.java.net.javaguides.registration.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.java.net.javaguides.model.Student;
import main.java.net.javaguides.registration.StudentDao.StudentDao;

@WebServlet("/register")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StudentDao studentDao = new StudentDao();

	public StudentServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/studentregister.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String ageStr = request.getParameter("age");
		String school = request.getParameter("school");
		String email = request.getParameter("email");
		String mobilephone = request.getParameter("mobilephone");

		Integer age = null;
		try {
			age = Integer.parseInt(ageStr);
		} catch (NumberFormatException e) {
			// Handle parsing exception
			e.printStackTrace();
		}

		Student student = new Student();
		student.setName(name);
		student.setAge(age); // Set the parsed age
		student.setSchool(school);
		student.setEmail(email);
		student.setMobilephone(mobilephone);

		try {
			studentDao.registerStudent(student);
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/studentdetails.jsp");
		dispatcher.forward(request, response);
	}

}
