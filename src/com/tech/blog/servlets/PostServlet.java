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

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
public class PostServlet extends HttpServlet {
	
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 
	ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		int cid=Integer.parseInt(request.getParameter("cid"));
		String ptitle=request.getParameter("title");
		String pcontent=request.getParameter("content");
		String pcode=request.getParameter("code");
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("CurrentUser");
		Post post=new Post(ptitle,pcode,null, cid, user.getId(), pcontent);
		PostDao dao=new PostDao(ConnectionProvider.getConnection());
		
		if(dao.Savepost(post)){
			pw.println("Done");
		}
		else{
			pw.println("Error");
		}
		
		
	}

}
