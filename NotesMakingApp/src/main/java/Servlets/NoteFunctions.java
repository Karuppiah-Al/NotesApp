package Servlets;



import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.UpdationToDB;
import JavaBean.TaskJavaBean;

@WebServlet("/NoteFunctions")
public class NoteFunctions extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result = "failed";
		TaskJavaBean tjb = new TaskJavaBean();
		try(PrintWriter out = response.getWriter()){
			String userid = request.getParameter("userid");
			String notes = request.getParameter("notes");
			String notesid = request.getParameter("notesid");
			String title = request.getParameter("title");
			String statusid = request.getParameter("statusid");
			String edited_on = request.getParameter("edited_on");
			tjb.setNotesid(notesid);
			tjb.setStatusid(Integer.parseInt(statusid));
			tjb.setUserid(userid);
			tjb.setNote(notes);
			tjb.setEdited_on(new SimpleDateFormat("yyyy-MM-dd").parse(edited_on));
			tjb.setTitle(title);
			UpdationToDB utd = new UpdationToDB();
			if(utd.processStatus(tjb)) {
				result = "Success";
			}
			out.println(result);
			System.out.println("In Notefunctions");
		}
		catch(Exception e) {
			System.out.println("<------------------------in NoteFunctions------------------->"+e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
