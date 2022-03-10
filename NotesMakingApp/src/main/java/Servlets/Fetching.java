package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DB.DriverConnection;
import DB.FetchingFromDB;
import JavaBean.TaskFetchJavaBean;


@WebServlet("/Fetching")
public class Fetching extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try(PrintWriter out = response.getWriter()) {
			FetchingFromDB f = new FetchingFromDB(DriverConnection.getCon());
			String username = request.getParameter("username");
			int statusid = Integer.parseInt(request.getParameter("statusid"));
			List<TaskFetchJavaBean> task = f.fetchingFunction(username,statusid);
			Gson json = new Gson();
			String tasklist = json.toJson(task);
			response.setContentType("text/html");
			out.print(tasklist);
		}
		catch(Exception e) {
			System.out.println(e+"-------------------->in Fetching");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
