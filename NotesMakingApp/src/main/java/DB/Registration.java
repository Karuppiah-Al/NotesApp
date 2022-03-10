package DB;

import java.sql.*;

import JavaBean.User;

public class Registration {
	Connection con;
	PreparedStatement pstmt;
	String query;
	public boolean Insertionintodb(User user) {
		boolean flag = false;
		String userid = user.getUserid();
		String fname = user.getFname();
		String lname = user.getLname();
		String mail = user.getMail();
		String phno = user.getPhno();
		String Password = user.getPassword();
		try {
			con = DriverConnection.getCon();
			query = "insert into USER_NOTES values('"+userid+"','"+mail+"','"+Password+"','"+fname+"','"+lname+"','"+phno+"')";
			pstmt = con.prepareStatement(query);			
			pstmt.execute(query);
			flag = true;
		}
		catch(Exception e) {
			System.out.println("<--in Registration-->"+e);
			flag = false;
		}
		return flag;
	}
}
