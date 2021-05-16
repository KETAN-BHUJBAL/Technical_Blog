package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;


public class LikedServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String operation=request.getParameter("operation");
		int uid=Integer.parseInt(request.getParameter("uid"));
		int pid=Integer.parseInt(request.getParameter("pid"));
	//	pw.println("data from server");
	//	pw.println(operation);
	//	pw.println(uid);
	//	pw.println(pid);
		LikeDao ldao=new LikeDao( ConnectionProvider.getConnection());  
		
		if(operation.equals("like")){
			
       boolean f= 		ldao.insertlike(pid, uid);
       pw.println(f);
		}
		
		
		
		
		
	}

}
