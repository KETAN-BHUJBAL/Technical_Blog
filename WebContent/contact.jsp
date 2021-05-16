
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%
User	 user=(User)session.getAttribute("CurrentUser");


%>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<title>TechBlog</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">

.banner-background{
clip-path: polygon(50% 0%, 100% 0, 100% 43%, 100% 100%, 68% 97%, 32% 94%, 0 100%, 0% 43%, 0 0);
}
.post-title{

font-weight:100;
font-size:35px

}
.post-contain{
font-weight:100;
font-size:25px
}
.post-date{
font-weight:bold;
font-style:italic;

}
.post-userimfo{
font-weight:100px;
font-size:20px;
}
.row-user{
border:1px solid #e2e2e2;
padding-top: 15px
}
.post-id{
font-weight:100;
font-size:20px
}
.post-code{
font-weight:100;
font-size:25px
}



body{
background:url(img/img2.jpg);
background-size:cover;
background-attachment: fixed;

}




</style>
</head>
<body>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<nav class="navbar navbar-expand-lg navbar-dark primary-background ">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-certificate"></span>TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><span class="fa fa-cc"></span>Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="fa fa-bars"></span>  Categaries
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programing lang</a>
          <a class="dropdown-item" href="#">Project Impementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
     <li class="nav-item">
        <a class="nav-link" href="contact.jsp"><span class="fa fa-address-card"></span>Contact </a>
      </li>
      
       <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal"  data-target="#postmodel"><span class="fa fa-address-card"></span>Post </a>	
      </li>
      
        </ul>
    
   <ul class="navbar-nav mr-right">
   <li class="nav-item">
        <a class="nav-link" href="#!"data-toggle="modal" data-target="#profilemodel"><span class="fa fa-user-circle"></span><%=user.getName() %></a>
   <li class="nav-item">
   
        <a class="nav-link" href="logout"><span class="fa fa-user-plus"></span>Log-Out </a>
       
      </li>
     </ul>		
  </div>
</nav>
<div class="modal fade" id="profilemodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-center">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
      <h5 class="modal-title" id="exampleModalLabel"><%=user.getName() %></h5>
      
       
        
        <!-- Details -->
        <div id="profile-detais">
        <table class="table">

  <tbody>
    <tr>
      <th scope="row">ID</th>
      <td><%=user.getId() %></td>
      
    </tr>
    <tr>
      <th scope="row">Adress</th>
      <td><%=user.getAdress() %></td>
   
    </tr>
    <tr>
      <th scope="row">Email</th>
      <td><%=user.getEmail() %></td>
      
    </tr>
    <tr>
    <th scope="row">Gendar</th>
      <td><%=user.getGendar() %></td>
    </tr>
    <tr>
    <th scope="row">About</th>
      <td><%=user.getAbout()%></td>
      </tr>
  </tbody>
</table>
</div>
 <div id="profile-edit" style="display:none;">
       <h3 class="mt-2">Please Edit Carefully..</h3>
      <form action="editservlet"method="post" enctype="application/x-www-form-urlencoded">
       <table class="table">
       <tr>
       <td>ID:</td>
       <td><%=user.getId() %></td>
        </tr>
       <tr>
       <td>Email:</td>
       <td><input type="email"class="form-control"   name="useremail" value="<%=user.getEmail() %>" ></td>
       </tr>
        <tr>
       <td>Name:</td>
       <td><input type="text"class="form-control"   name="username" value="<%=user.getName() %>" ></td>
       </tr>
        <tr>
       <td>Password:</td>
       <td><input type="password"class="form-control"   name="userpassword" value="<%=user.getPassword() %>" ></td>
       </tr>
        <tr>
       <td>Adress:</td>
       <td><input type="text"class="form-control"   name="adress" value="<%=user.getAdress()%>" ></td>
       </tr>
        <tr>
        <td>About</td>
        <td>
        <textarea rows="5" cols="" name="about"class="form-control">
        <%=user.getAbout() %>
        
        </textarea>
        
        </td>
        </tr>
      
       
       
       
       
       </table>
       <div class="container">
       <button type="submit" class="btn btn-outline-primary">Save</button>
       </div>
       
       </form>
       </div> 
        
       
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button  id="button"   type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="postmodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide A Post Details...</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form id="post-form" action="addpost"method="post">
    
    
     <div class="form-grpup">
      <select class="form-control" name="cid">
      <option selected disabled	>Select Categarie</option>
      <%PostDao p=new PostDao(ConnectionProvider.getConnection()) ;
         ArrayList<Category> list= p.getAllCategories(); 
         for(Category c:list){
         %>
        <option value="<%=c.getCid()%>"><%=c.getName() %></option>
        
            <%} %>
      </select>
      </div>
      <div class="form-group">
      
      <input name="title" type="text" placeholder="Enter Post Title"class="form-control"/>
      
      </div>
      <div class="form-group">
      <textarea name="content" rows="5" cols="" class="form-control" placeholder="Enter your Content"></textarea>
       </div>
      
       
      <div class="form-group">
      <textarea name="code" rows="" cols="" class="form-control" placeholder="Enter your code"style="height:200px;"></textarea>
       </div>
       
        
      </div>
     <div class="container text-center	">
     
     <button type="submit" class="btn btn-outline-primary">Post</button>
     
     </div>
     </form>
    </div>
  </div>
</div>












<!-- End Post Model -->




<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="Js/myjs.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
let editStatus=false;
	
$('#button').click(function(){
	//alert("button click")
	if(editStatus==false){
		$('#profile-detais').hide()
		$("#profile-edit").show();
		editStatus=true;
		$(this).text("Back")
		}else{
			$('#profile-detais').show()
			$("#profile-edit").hide();
			editStatus=false;
			$(this).text("Edit")
			
		}
	
})
	
	
});
$(document).ready(function(){

	console.log("loaded...")
	$('#post-form').on('submit' , function(event){
		event.preventDefault();
		console.log("you have Clicked  submit....")
		let form=new FormData(this);
	//this code gets called when form is submitted...
	

	//console.log("u have clicked on submit button...")


//now requesting to server
$.ajax({
	url:"addpost",
	data:form,
	type:'post',
	
	success:function(data,textStatus,jqXHR){
	   if(data.trim()==='done'){
		   swal("Error!!", "Somthing went wrong Try Again..!", "error");
	   }else{
		   
		   swal("Good job!", "You have Sucsessfully Submitted...!", "success");
	   }
	   
  },
  error:function(jqXHR,textStatus,errorThrown){
	  
	  swal("Error!!", "Somthing went wrong Try Again..!", "error");
		
  },
  processData: false,
  contentType:false
  
    

});
});
});




</script>
<

<div class="container  ">
<div class="row my-4">
<div class="col-md-8 offset-md-2">
<div class="card ">
<div class="card-header primary-background">
<h4 class="post-title"></h4>
</div>
<div class="card-body ">
<p class="user-name">Name:</p>
<p class="post-id">PostID:</p>
<p class="post-contain">contact</p>
<div class="row my-3 row-user">
<div class="col-md-8">
<%UserDao ud=new UserDao(ConnectionProvider.getConnection()); 
%>
<p class="post-userimfo">PostID:<a href="#!" ></a> has posted:</p>

</div>
<div class="col-md-4">
<p class="post-date"></p>

</div>
</div>

<br>
<br>
<div class="post-code">
<pre>Code:</pre>
</div>

</div>
<div class="card-footer primary-background text-center">

</div>



</div>


</div>



</div>
</div>





</body>
</html>