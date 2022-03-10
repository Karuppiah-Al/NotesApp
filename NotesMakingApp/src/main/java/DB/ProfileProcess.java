package DB;

import java.sql.*;

public class ProfileProcess {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rst;
	String query;
	public String fetchingFunction(String userid) {
		String ans="";
		try {
			con = DriverConnection.getCon();
			query = "select fname,lname,mail,phno,password from user_notes where userid = '"+userid+"'";
			pstmt = con.prepareStatement(query);
			rst = pstmt.executeQuery();
			if(rst.next()) {
				ans =rst.getString("fname")+","+rst.getString("lname")+","+rst.getString("mail")+","+rst.getString("phno")+","+rst.getString("password"); 
			}
			else {
				ans ="Something error happened";
			}
			con.close();
		}
		catch(Exception e) {
			System.out.println("<-----in ProfileProcess in fetchingfunction-------->"+e);
		}
		return ans;
	}
	public boolean updatingFunction(String userid,String values[]) {
		boolean flag = false;
		try {
			con = DriverConnection.getCon();
			query = "update user_notes set fname=?,lname=?,phno=?,password=? where userid='"+userid+"'";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, values[0]);
			pstmt.setString(2, values[1]);
			pstmt.setString(3, values[2]);
			pstmt.setString(4, values[3]);
			pstmt.execute();
			flag=true;
		}
		catch(Exception e) {
			flag = false;
			System.out.println("<-----in ProfileProcess in updatingfunction-------->"+e);
		}
		return flag;
	}
}
