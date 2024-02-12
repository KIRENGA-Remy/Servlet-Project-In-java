package main.java.net.javaguides.registration.StudentDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import main.java.net.javaguides.model.Usertable;

public class UserDao {
	private String INSERT_SQL = " INSER INTO usertable(id, username, email, password VALUES (?, ?, ?, ?)";

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

			preparedStatement.setInt(1, usertable.getId());
			preparedStatement.setString(2, usertable.getUsername());
			preparedStatement.setString(3, usertable.getEmail());
			preparedStatement.setString(4, usertable.getPassword());

			result = preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
}
