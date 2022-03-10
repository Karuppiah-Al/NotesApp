package DB;

import java.sql.*;

public class Login {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rst;
	public String CheckAuthorization(String mail,String password) {
		String flag = "no,no";
		try {
			con = DriverConnection.getCon();
			String query = "select userid,fname from user_notes where mail='"+mail+"' and password = '"+password+"'";
			pstmt = con.prepareStatement(query);
			rst = pstmt.executeQuery();
			if(rst.next()) {
				flag=rst.getString("userid")+","+rst.getString("fname");
			}
		}
		catch(Exception e) {
			System.out.println("<---in Login--->"+e);
		}
		return flag;
	}
}
