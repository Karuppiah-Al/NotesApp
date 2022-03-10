package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.Registration;
import JavaBean.User;

@WebServlet("/RegistrationProcess")
public class RegistrationProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String userid = request.getParameter("userid");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String mail = request.getParameter("mail");
		String phno = request.getParameter("phno");
		String Password = request.getParameter("Password");		
		try {
			User ob_user = new User();
			ob_user.setUserid(userid);
			ob_user.setFname(fname);
			ob_user.setLname(lname);
			ob_user.setMail(mail);
			ob_user.setPhno(phno);
			ob_user.setPassword(Password);
			Registration ob_reg = new Registration();
			if(ob_reg.Insertionintodb(ob_user)) {
				out.print("Registration success");
			}
			else {
				out.print("Registration failed error in RegistrationProcess");
			}
		}
		catch(Exception e) {
			out.print("in RegistrationProcess-->"+e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
