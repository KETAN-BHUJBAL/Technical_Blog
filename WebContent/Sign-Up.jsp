<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign-Up</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
.banner-background{
clip-path: polygon(50% 0%, 100% 0, 100% 43%, 100% 100%, 68% 97%, 32% 94%, 0 100%, 0% 43%, 0 0);
}
</style>
</head>
<body>
<%@include file="normal.jsp"%>
<main class="primary-background p-5"style="padding-bottom:80px;">	
<div class="container">
<div class="row">
<div class="col-md-8 offset-md-2">

<div class="card">
<div class="card-header text-center">
<p> <span class="far fa-user-circle" style="font-size:36px"></span>Rajister-Here</p>
<br>
</div>
<div class="card-body">
<form id ="reg-form" action="sup" method="post">
<div class="form-group">
    <label for="Name">Name</label>
    <input name="Name" type="text" class="form-control" id="Name" placeholder="Enter Name">
  </div>
  <div class="form-group">
    <label for="Adress">Adress</label>
    <input name="Adress" type="text" class="form-control" id="Adress" placeholder="Enter Adress">
  </div>
 
  <div class="form-group">
    <label for="Email1">Email ID</label>
    <input name="Email" type="email" class="form-control" id="Email1" aria-describedby="emailHelp" placeholder="Enter Email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="Password">Password</label>
    <input name="Password" type="password" class="form-control" id="Password" placeholder="Enter Password">
  </div>
   <div class="form-group">
    <label for="Gendar">Select Gendar</label>
    <br>
    <input type="radio" id="Gendar" name="Gendar" value="Male">Male
    <input type="radio" id="Gendar"  name="Gendar" value="Female">female
    <input type="radio" id="Gendar"  name="Gendar" value="other">other
  </div>
   <div class="form-group">
   <textarea  class="form-control"name="About" id="about"rows="5"  placeholder="Somthing About Your Self"></textarea>
  </div>
  
  <div class="form-group form-check">
    <input name="TandC" type="checkbox" class="form-check-input" id="Tandc">
    <label class="form-check-label" for="TandC">Agree Terms And Conditions</label>
  </div>
  <div class="container   text-center" id="loader"style="display:none;">
  <span class="fa fa-refresh fa-spin fa-3x" ></span>
  <h4>Please Wait..</h4>
  </div>
  <br>
  <button id="submitbutton" type="submit" class="btn btn-primary">Submit</button>
</form>

</div>
</div>
</div>
</div>
</div>
</main>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="Js/myjs.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
$(document).ready(function(){

	console.log("loaded...")
	$('#reg-form').on('submit' , function(event){
		event.preventDefault();
		
		let form=new FormData(this);
		//send form to rajister servlet
		console.log(form)
		$("#submitbutton").hide();
		$("#loader").show();
		
		$.ajax({ 
			url:"sup",
			data:form,
			type:'post',
           success:function(data,textStatus,jqXHR){
        	console.log(data) 
        	
        	$("#submitbutton").show();
    		$("#loader").hide();
    		if(data.trim()==='done'){
    			
    		swal("Sucssesfully Rajistered..we Redirect To Login page")
    		.then((value) => {
    			window.location.href= "Login.jsp";
    			
    		});
    		}else{
    			 swal(data);
    		}
    		
    		  },
           error:function(jqXHR,textStatus,errorThrown){
        	   $("#submitbutton").show();
       		$("#loader").hide();
        	   swal("Somthing Went Wrong...")
       		
       		
           },
           processData: false,
           contentType:false
           
           
           
			
		});
		
	});
});


</script>


</body>
</html>