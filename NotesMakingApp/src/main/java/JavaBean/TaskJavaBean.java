package JavaBean;

import java.util.Date;

public class TaskJavaBean {
	private String notesid;
	private String userid;
	private int statusid;
	private Date created_on;
	private Date edited_on;
	private String Note;
	private String title;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNotesid() {
		return notesid;
	}
	public void setNotesid(String notesid) {
		this.notesid = notesid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getStatusid() {
		return statusid;
	}
	public void setStatusid(int statusid) {
		this.statusid = statusid;
	}
	public Date getCreated_on() {
		return created_on;
	}
	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}
	public Date getEdited_on() {
		return edited_on;
	}
	public void setEdited_on(Date edited_on) {
		this.edited_on = edited_on;
	}
	public String getNote() {
		return Note;
	}
	public void setNote(String note) {
		this.Note = note;
	}
}
