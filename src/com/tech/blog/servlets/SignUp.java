 package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
public class SignUp extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter pw=
		response.getWriter();
		
		String check=request.getParameter("TandC");
		
		if (check==null) {
			pw.println("box is not checked");
			
		} else {
			String name=request.getParameter("Name");
			String email=request.getParameter("Email");
			String password=request.getParameter("Password");
			String gendar=request.getParameter("Gendar");
			String about=request.getParameter("About");
			String adress=request.getParameter("Adress");
			User user=new User(name,email,password,gendar,about,adress);
			
			UserDao dao=new UserDao(ConnectionProvider.getConnection());
       if( dao.saveUser(user)){
    	   pw.println("Done...");
    	   
       }
       else{
    	   pw.println("Error");
       }
		}
		
	}

}
