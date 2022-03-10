package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProfileProcess")
public class ProfileProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String operation = request.getParameter("operation");
		if(operation.equals("fetching")) {
			try {
				String userid = request.getParameter("userid");
				DB.ProfileProcess ob = new DB.ProfileProcess();
				String values = ob.fetchingFunction(userid);
				out.print(values);
			}
			catch(Exception e) {
				out.print("<-----in ProfileProcess---------->"+e);
			}
		}
		if(operation.equals("updating")) {
			try {
				String userid = request.getParameter("userid");
				String values = request.getParameter("values");				
				DB.ProfileProcess ob = new DB.ProfileProcess();
				if(ob.updatingFunction(userid,values.split(","))) {
					HttpSession session = request.getSession();
					session.setAttribute("fname",values.split(",")[0]);
					out.print("success");
				}
				else {
					out.print("failed");
				}
			}
			catch(Exception e) {
				out.print("<-----in ProfileProcess---------->"+e);
			}
		}			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
