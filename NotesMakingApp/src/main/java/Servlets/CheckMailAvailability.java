package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.CheckMailFromDB;

@WebServlet("/CheckMailAvailability")
public class CheckMailAvailability extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			String mail = request.getParameter("mail");
			CheckMailFromDB ob = new CheckMailFromDB();
			if(ob.checkMail(mail)) {
				out.print("available");
			}
			else {
				out.print("Mail is already in use.");
			}
		}
		catch(Exception e) {
			out.print("<----------In CheckMailAvailability ------>"+e);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
