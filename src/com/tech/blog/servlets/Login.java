package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Massage;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
public class Login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 
	ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		
		
		
		
		  String UserMail=request.getParameter("mail");
		  String UserPassword=request.getParameter("pasword");
		  UserDao dao=new UserDao(ConnectionProvider.getConnection());
   User u= dao.getUserByEmailAndPassword(UserMail, UserPassword);
         
		
         
        if(u==null)	{
      //   pw.println("Invalid Data try agin..");
        	Massage msg=new Massage("Somthing Wrong Please Try Again..","error","alert-danger");
        	HttpSession session=request.getSession();
        	session.setAttribute("msg",msg);
        	
        	
        	
        	response.sendRedirect("Login.jsp");
        	session.removeAttribute("CurrentUser");
        	
        	 
        	  }else{
        	 
        	 HttpSession session=request.getSession();
        	 session.setAttribute("CurrentUser",u);
                 response.sendRedirect("Profile.jsp");
      
        	 
         }
	}
		
	}

