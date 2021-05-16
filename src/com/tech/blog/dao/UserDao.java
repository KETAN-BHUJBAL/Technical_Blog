package com.tech.blog.dao;
import java.sql.*;

import com.tech.blog.entities.User;

   public class UserDao {
	  private Connection con;
	   boolean f=false;
	
	  public UserDao(Connection con)
	  {
		   this.con=con;
		
	}
	    public boolean saveUser(User user)
	    {  
		try {
			String query="insert into user(Name,Email,Password,Gendar,About,Adress) values(?,?,?,?,?,?)";
			PreparedStatement pstm=con.prepareStatement(query);
			pstm.setString(1,user.getName());
			pstm.setString(2, user.getEmail());
			pstm.setString(3,user.getPassword());
			pstm.setString(4,user.getGendar());
			pstm.setString(5,user.getAbout());
			pstm.setString(6, user.getAdress());
			
			pstm.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			
		}
		return f;
		
		
	}
	public User getUserByEmailAndPassword(String Email,String Password){
		User user=null;
		try {
			
			String query="select * from user where Email =? and Password =?";
			PreparedStatement pstm=con.prepareStatement(query);
			pstm.setString(1, Email);
			pstm.setString(2, Password);
			
		ResultSet set=	pstm.executeQuery();
		if(set.next()){
			user=new User();
			user.setId(set.getInt("id"));
				user.setName(set.getString("Name"));
				user.setEmail(set.getString("Email"));
				user.setAdress(set.getString("Adress"));
				user.setAbout(set.getString("About"));
				user.setGendar(set.getString("Gendar"));
				user.setPassword(set.getString("Password"));
				
			}
				
			} catch (Exception e) {
				
			}
			return user;
			
		
		}
		
public boolean UpdateUser(User user){
	boolean f=false;
	try {
		String query="update user set Name=?,Email=?,Password=?,About=?,Adress=?,Gendar=? where id=?";
		
		PreparedStatement pstm=con.prepareStatement(query);
		pstm.setString(1,user.getName());
		pstm.setString(2, user.getEmail());
		pstm.setString(3, user.getPassword());
		pstm.setString(4, user.getAbout());
		pstm.setString(5, user.getAdress());
		pstm.setString(6,user.getGendar() );
		pstm.setInt(7, user.getId());
		
		pstm.executeUpdate();
		f=true;
	} catch (Exception e) {
		// TODO: handle exception
	}
	return f;
	
	
	
}
/*
public User getUserbyId( int userid) throws SQLException{
	User user=null;
	try {
		
		
		
		String q="select * from user where id=?";
		PreparedStatement pstm=con.prepareStatement(q);
		pstm.setInt(1, userid);
		ResultSet set=pstm.executeQuery();
		if(set.next())
		{
			user =new User();
			
			user.setId(set.getInt("id"));
			user.setName(set.getString("Name"));
			user.setEmail(set.getString("Email"));
			user.setAdress(set.getString("Adress"));
			user.setAbout(set.getString("About"));
			user.setGendar(set.getString("Gendar"));
			user.setPassword(set.getString("Password"));
			
	} }
	
	catch (Exception e) {
	
	
	}
	
		
	
	
	
	
	
	return user;
	
}*/

public User getnameByid(int id){

User user=null;
try {
	
	String q="select * from user where id=?";
	PreparedStatement pstm=con.prepareStatement(q);
	pstm.setInt(1, id);
	
	
ResultSet set=	pstm.executeQuery();

if(set.next())
     {
	user=new User();
	user.setId(set.getInt("id"));
	user.setName(set.getString("Name"));
	user.setEmail(set.getString("Email"));
	user.setAdress(set.getString("Adress"));
	user.setAbout(set.getString("About"));
	user.setGendar(set.getString("Gendar"));
	user.setPassword(set.getString("Password"));
	
  }
	
    } catch (Exception e) {
	
    }
return user;

       }
   }

