package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.Massage;

public class LogOut extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws 
	ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		HttpSession session=request.getSession();
		session.removeAttribute("CurrentUser");
		Massage msg=new Massage("Log-Out Sucsessfully...."," success", "alert-success");
		session.setAttribute("msg", msg);
		
		response.sendRedirect("Login.jsp");
		
		
		
		
		
		
	}

}
