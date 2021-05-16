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
public class EditServlet extends HttpServlet {
	
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String email=request.getParameter("useremail");
		String name=request.getParameter("username");
		String password=request.getParameter("userpassword");
		String adress=request.getParameter("adress");
		String about=request.getParameter("about");
		
		HttpSession session=request.getSession();
		 User user= (User) session.getAttribute("CurrentUser");
		 user.setEmail(email);
		 user.setName(name);
		 user.setAdress(adress);
		 user.setPassword(password);
		 user.setAbout(about);
		UserDao userDao=new UserDao(ConnectionProvider.getConnection());
		
	boolean ans=	userDao.UpdateUser(user);
	if(ans==true){
		
		pw.println("Updated in Db");
		Massage msg=new Massage("Profile Details Updated","success","alert-success");
    //	HttpSession session=request.getSession();
    	session.setAttribute("msg",msg);
    	
    	
		
		
	}else{
		pw.println("not update....");
		Massage msg=new Massage("Somthing Wrong Please Try Again..","error","alert-danger");
    //	HttpSession session=request.getSession();
    	session.setAttribute("msg",msg);
    	
    	
		
		
	}
	response.sendRedirect("Profile.jsp");
	}

}
