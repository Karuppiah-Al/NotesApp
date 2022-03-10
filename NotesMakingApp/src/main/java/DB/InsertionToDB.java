package DB;

import java.io.StringReader;
import java.sql.*;

import JavaBean.TaskJavaBean;
public class InsertionToDB {
	Connection con = DriverConnection.getCon();
	PreparedStatement pstmt;
	String query;
	public boolean insertFunction(TaskJavaBean tjb) {
		boolean flag = false;
		try {
			query = "insert into Notes values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, tjb.getUserid());
			pstmt.setString(2, tjb.getNotesid());
			pstmt.setInt(3, tjb.getStatusid());
			pstmt.setDate(4, new java.sql.Date(tjb.getCreated_on().getTime()));
			pstmt.setDate(5, new java.sql.Date(tjb.getEdited_on().getTime()));
			pstmt.setClob(6,new StringReader(tjb.getNote()));
			pstmt.setString(7,tjb.getTitle());
			pstmt.execute();
			flag = true;
			System.out.println("success");
		}
		catch(Exception e) {
			System.out.println(e);
			flag = false;
		}
		return flag;
	}
}
