package main.java.net.javaguides.registration.StudentDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import main.java.net.javaguides.model.Usertable;

public class UserDao {

	public boolean isEmailAvailable(String email) throws ClassNotFoundException, SQLException {
		boolean isAvailable = true;
		// Load PostgreSQL JDBC Driver
		Class.forName("org.postgresql.Driver");
		// Connection parameters
		String url = "jdbc:postgresql://localhost:5432/student";
		String username = "postgres";
		String password = "remy2020";
		try (Connection connection = DriverManager.getConnection(url, username, password);
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM usertable WHERE email = ?")) {
			preparedStatement.setString(1, email);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				if (resultSet.next()) {
					// Email already exists
					isAvailable = false;
				}
			}
		} catch (SQLException e) {
			// Handle database-related errors
			e.printStackTrace();
		} catch (Exception e) {
			// Handle other exceptions
			e.printStackTrace();
		}
		return isAvailable;
	}

	String INSERT_SQL = "INSERT INTO usertable (username, email, password, role) VALUES (?, ?, ?, ?)";

	public int registerUser(Usertable usertable) throws ClassNotFoundException, SQLException {
		int result = 0;

		// Load PostgreSQL JDBC Driver
		Class.forName("org.postgresql.Driver");
		// Connection parameters
		String url = "jdbc:postgresql://localhost:5432/student";
		String username = "postgres";
		String password = "remy2020";
		try (Connection connection = DriverManager.getConnection(url, username, password);
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SQL)) {
			preparedStatement.setString(1, usertable.getUsername());
			preparedStatement.setString(2, usertable.getEmail());
			preparedStatement.setString(3, usertable.getPassword());
			preparedStatement.setString(4, usertable.getRole());
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// Handle database-related errors
			e.printStackTrace();
		} catch (Exception e) {
			// Handle other exceptions
			e.printStackTrace();
		}
		return result;
	}
}