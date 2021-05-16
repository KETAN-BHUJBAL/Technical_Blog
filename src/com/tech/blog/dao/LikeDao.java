package com.tech.blog.dao;
import java.sql.*;

import com.sun.org.apache.bcel.internal.generic.RETURN;

public class LikeDao {
	
	Connection con;
	
	public LikeDao(Connection con) {
		super();
		this.con = con;
	}
	public boolean insertlike(int pid, int uid){
		boolean f=false;
		try {
			String q="insert into liked (pid,uid)values(?,?)";
			
			PreparedStatement pstm=con.prepareStatement(q);
			pstm.setInt(1, pid);
			pstm.setInt(2, uid);
			pstm.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
			
			
		}
		
		return f;
		
		
	}
	
	
	public int countLike(int pid){
		
		int count=0;
		try {
		String q="select count(*) from liked where pid=?";
		PreparedStatement pstm=con.prepareStatement(q);
		pstm.setInt(1,pid);
	ResultSet rs=	pstm.executeQuery();
	if(rs.next()){
		count=rs.getInt("count(*)");
	}
		
		
		
		
		
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
		return count;
		
		
		
	}


	public boolean isLikeByUser(int pid, int uid){

	boolean f=false;
	
	try {
		String q="select * from liked where pid=?,uid=?";
		PreparedStatement pstm=con.prepareStatement(q);
		pstm.setInt(1, pid);
		pstm.setInt(2, uid);
		 ResultSet rs=pstm.executeQuery();
		 if(rs.next())
		 {
			 
			f=true; 
			 
			 
		 }
		
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	
	return f;
	
}

	
	public boolean DeleteLike(int pid,int uid){
		boolean f=false;
	
		try {
			
			String q="delete * from liked where pid=?,uid=?";
			
			PreparedStatement pstm=con.prepareStatement(q);
			pstm.setInt(1, pid);
			pstm.setInt(2, uid);
			pstm.executeUpdate();
			f=true;
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return f;
		
		
	}
}
