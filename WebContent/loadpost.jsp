
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Post"%>



<style>
body{
background:url(img/img2.jpg);
background-size:cover;
background-attachment: fixed;

}


</style>

<div class="row">


<%

User uuu=(User)session.getAttribute("CurrentUser");
Thread.sleep(1000);
PostDao d=new PostDao(ConnectionProvider.getConnection());
int cid=Integer.parseInt(request.getParameter("cid"));
List<Post>posts=null;
if(cid==0){
posts=d.getAllPost();	
}
else{
	
posts=	d.getPostByCid(cid);
}
if(posts.size()==0){
	out.println("<h3 class='display-3 text-center'>No Post in this Category</h3>");
	return;
}

for(Post p:posts){
	%>
	
	
	
	
	<div class="col-md-6 mt-2">
	<div class="card ">
	<div class="card-body ">
	<b><%=p.getPtitle() %></b>
	<p> <b>Content:</b>
	<%= p.getPcontent() %>
	</p>
	
	
	</div>
	<div class="card-footer text-center bg-light">
	
	<%
LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
%>
	<a href="#"  onclick="Likedd(<%=p.getPid() %>,<%=uuu.getId() %>)" class="btn primary-background  text-white"><i class="fa fa-thumbs-o-up"></i><span class="like-c"><%=ld.countLike(p.getPid()) %></span></a>
	<a href="ShowBlog.jsp? postid=<%=p.getPid() %>" class="btn primary-background  text-white">Read More... </a>
	<a href="#" class="btn primary-background  text-white"><i class="fa fa-commenting-o"></i><span>10</span></a>
	</div>
	
	
	</div>
		
	
	</div>
	<%
	
}


%>
</div>

