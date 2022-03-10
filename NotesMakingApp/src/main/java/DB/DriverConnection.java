package DB;


import java.sql.Connection;
import java.sql.DriverManager;

public class DriverConnection {
	private static Connection con;
	public static Connection getCon() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","test","5112001");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
