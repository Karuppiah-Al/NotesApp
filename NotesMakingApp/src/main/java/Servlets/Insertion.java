package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.InsertionToDB;
import JavaBean.TaskJavaBean;

@WebServlet("/Insertion")
public class Insertion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		TaskJavaBean tjb = new TaskJavaBean();
		try {
			String notesid = request.getParameter("notesid");
			String statusid = request.getParameter("statusid");
			String userid = request.getParameter("userid");
			String note = request.getParameter("note");
			String created_on = request.getParameter("created_on");
			String edited_on = request.getParameter("edited_on");
			String title = request.getParameter("title");
			tjb.setNotesid(notesid);
			tjb.setStatusid(Integer.parseInt(statusid));
			tjb.setUserid(userid);
			tjb.setNote(note);
			tjb.setCreated_on(new SimpleDateFormat("yyyy-MM-dd").parse(created_on));
			tjb.setEdited_on(new SimpleDateFormat("yyyy-MM-dd").parse(edited_on));
			tjb.setTitle(title);
			String result = "error in InsertionToDOB/insertFunction(tjb)";
			InsertionToDB itdob = new InsertionToDB();
			if(itdob.insertFunction(tjb)) {
				result="success";
			}
			out.println(result);
		}
		catch(Exception e) {
			out.println(e+"-----------------> in Servlets.Insertion.java");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
