package DB;

import java.io.StringReader;
import java.sql.*;
import JavaBean.TaskJavaBean;

public class UpdationToDB {
	Connection con;
	PreparedStatement pstmt;
	String query;
	public boolean processStatus(TaskJavaBean tjb) {
		boolean flag = false;
		String userid = tjb.getUserid();
		String notesid = tjb.getNotesid();
		String title = tjb.getTitle();
		String note = tjb.getNote();
		int statusid = tjb.getStatusid();
		Date edited_on = new java.sql.Date(tjb.getEdited_on().getTime());
		con = DriverConnection.getCon();
		try{
			if(statusid!=1) {
				if(statusid==5) {
					statusid=1;
				}
				query = "update Notes set statusid="+statusid+" where notesid='"+notesid+"' ";
				pstmt = con.prepareStatement(query);
			}
			else {
				query = "update Notes set edited_on=?,note=?,statusid=? where notesid=? ";
				pstmt = con.prepareStatement(query);
				pstmt.setDate(1,edited_on);
				pstmt.setCharacterStream(2,new StringReader(note),note.length());
				pstmt.setInt(3,statusid);
				pstmt.setString(4,notesid);
			}
			pstmt.execute();
			flag = true;
		}
		catch(Exception e) {
			System.out.println("<-----------In updationToDb---------------->"+e);
		}
		return flag;
	}
}
