package DB;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import JavaBean.TaskFetchJavaBean;
public class FetchingFromDB {
	Connection con = DriverConnection.getCon();
	PreparedStatement pstmt;
	String query;
	ResultSet rs;
	public FetchingFromDB(Connection con) {
		this.con=con;
	}
	public List<TaskFetchJavaBean> fetchingFunction(String userid,int statusid) {
		List<TaskFetchJavaBean> tasks = new ArrayList<>();
		try {
			query = "Select note,title,notesid from Notes where userid='"+userid+"' and statusid="+statusid+" ";
			pstmt = this.con.prepareStatement(query);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				TaskFetchJavaBean tjb = new TaskFetchJavaBean();
				tjb.setTitle(rs.getString("title"));
				tjb.setNotesid(rs.getString("notesid"));
				Reader clob = rs.getClob("note").getCharacterStream();
				String note = this.getString(clob);
				tjb.setNotes(note);
				tasks.add(tjb);
			}
		}
		catch(Exception e) {
			System.out.println(e+"---------------->in FetchingFromDB");
		}
		return tasks;
	}
	public String getString(Reader clob) throws IOException {
		StringBuffer buffer = new StringBuffer();
		int ch;
		int j=0;
		while((ch=clob.read())!=-1) {
			buffer.append(""+(char)ch);
		}
		return buffer.toString();
	}
}
