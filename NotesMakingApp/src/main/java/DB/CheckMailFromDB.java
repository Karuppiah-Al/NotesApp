package DB;

import java.sql.*;

public class CheckMailFromDB {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rst;
	public boolean checkMail(String mail) {
		boolean flag = false;
		try {
			con = DriverConnection.getCon();
			String query = "Select * from User_Notes where mail='"+mail+"'";
			pstmt=con.prepareStatement(query);
			rst = pstmt.executeQuery();
			while(rst.next()) {
				flag=false;
				return flag;
			}
			flag=true;
		}
		catch(Exception e) {
			System.out.println("in CheckMailFromDB------->"+e);
			flag=false;
		}
		return flag;
	}
}
