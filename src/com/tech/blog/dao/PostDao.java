package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
public class PostDao {
	
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	public ArrayList<Category>getAllCategories(){
		ArrayList<Category> list=new ArrayList<>();
	try {
		String query="select * from categaries";	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(query);
		
		while (rs.next()){
		int cid=rs.getInt("cid");
		String name=rs.getString("cname");
		String dis=rs.getString("discription");
		Category c=new Category(cid,name,dis);
		list.add(c);
	}	
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}	
		
		
		
		
		
		
		
		
		return list;
		}
	public boolean Savepost(Post post){
		boolean f=false;
		try {
			String q="insert into post(ptitle,pcontent,pcode,cid,userid) values(?,?,?,?,?)";
			
			PreparedStatement pstm=con.prepareStatement(q);
			pstm.setString(1, post.getPtitle());
			pstm.setString(2, post.getPcontent());
			pstm.setString(3, post.getPcode());
			pstm.setInt(4, post.getCid());
			pstm.setInt(5, post.getUserid());
			
			pstm.executeUpdate();
			f=true;
		} catch (Exception e) {
			
		}
		
		
		return f;
				}
	
	
	public List<Post>getAllPost()
	{
		List<Post>list=new ArrayList<>();
		try {
			PreparedStatement pstm=con.prepareStatement("select * from post");
			ResultSet rs=pstm.executeQuery();
			while(rs.next()){
				int pid=rs.getInt("pid");
				String ptitle=rs.getString("ptitle");
				String pcontent=rs.getString("pcontent");
				String pcode=rs.getString("pcode");
				Timestamp pdate=rs.getTimestamp("pdate");
				int cid =rs.getInt("cid");
				int uid=rs.getInt("userid");
				Post post=new Post(pid,ptitle,pcode,pdate,cid,uid, pcontent);
				list.add(post);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
		
	}
	

	
	
	
	public List <Post> getPostByCid(int cid){
		
		List<Post>list=new ArrayList<>();
		try {
			PreparedStatement pstm=con.prepareStatement("select * from post where cid=?");
			pstm.setInt(1, cid);
			ResultSet rs=pstm.executeQuery();
			while(rs.next()){
				int pid=rs.getInt("pid");
				String ptitle=rs.getString("ptitle");
				String pcontent=rs.getString("pcontent");
				String pcode=rs.getString("pcode");
				Timestamp pdate=rs.getTimestamp("pdate");
				int cid1 =rs.getInt("cid");
				int uid=rs.getInt("userid");
				Post post=new Post(pid,ptitle,pcode,pdate,cid1,uid, pcontent);
				list.add(post);
				
			
			
			
		}
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	public Post getPostById(int PostID) throws SQLException{
		Post post=null;
		
		String Query="select * from post where pid=?";
		PreparedStatement pstm=con.prepareStatement(Query);
		pstm.setInt(1, PostID);
		
		ResultSet rs=pstm.executeQuery();
		if(rs.next() ){
			
			int pid=rs.getInt("pid");
			String ptitle=rs.getString("ptitle");
			String pcontent=rs.getString("pcontent");
			String pcode=rs.getString("pcode");
			Timestamp pdate=rs.getTimestamp("pdate");
			int cid1 =rs.getInt("cid");
			int uid=rs.getInt("userid");
		 post=new Post(pid,ptitle,pcode,pdate,cid1,uid, pcontent);
			
		
			
			
		}
		
		
		
		return post;
		}
	
	
}
