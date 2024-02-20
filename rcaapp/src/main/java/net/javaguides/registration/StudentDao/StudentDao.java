package main.java.net.javaguides.registration.StudentDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import main.java.net.javaguides.model.Student;

public class StudentDao {
	private static final String INSERT_SQL = "INSERT INTO student "
			+ "(code, name, age, school, email, mobilephone) VALUES " + "(nextval('stud'), ?, ?, ?, ?, ?)";

	public int registerStudent(Student student) throws ClassNotFoundException, SQLException {
		int result = 0;

		// Load PostgreSQL JDBC Driver
		Class.forName("org.postgresql.Driver");

		// Connection parameters
		String url = "jdbc:postgresql://localhost:5432/student";
		String username = "postgres";
		String password = "remy2020";

		try (Connection connection = DriverManager.getConnection(url, username, password);
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SQL)) {
			// Set parameters for the PreparedStatement
			preparedStatement.setString(1, student.getName());
			preparedStatement.setInt(2, student.getAge());
			preparedStatement.setString(3, student.getSchool());
			preparedStatement.setString(4, student.getEmail());
			preparedStatement.setString(5, student.getMobilephone());

			// Execute the query
			result = preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return result;
	}
}
