<%@page import="com.tech.blog.entities.Massage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.banner-background {
	clip-path: polygon(20% 0%, 80% 0%, 100% 0, 100% 100%, 80% 99%, 19% 95%, 0 100%, 0 0
		);
}
</style>
<title>Login Page</title>
</head>
<body>
	<%@include file="normal.jsp"%>
	<main
		class="d-flex align-items-center primary-background  banner-background"
		style="height:70vh">
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="card">
					<div class="card-header text-center">
						<p>
							<span class="fa fa-user-plus fa-1.5x "></span>Login-Here
						</p>
						<br>
					</div>



					<div class="card-body">
						<form action="login" method="post" id="log-form">
							<div class="form-group">

								<%
									Massage m = (Massage) session.getAttribute("msg");
									if (m != null) {
								%>
								<div class="alert <%=m.getCssClass()%>" role="alert">
									<%=m.getContent()%>
								</div>
								<%
									session.removeAttribute("msg");
									}
								%>

								<label for="exampleInputEmail1">Email address</label> <input
									name="mail" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"> <small
									id="emailHelp" class="form-text text-muted">We'll never
									share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="pasword" type="password" class="form-control"
									id="exampleInputPassword1">
							</div>

							<!--Check box issue  -->

							<%
								/**
								
								<div class="form-group form-check">
								  <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
								  <label class="form-check-label" for="check">Check me out</label>
								   </div>
								 <div class="container text-center" id="loader"style="display:none;">
								<span class="fa fa-refresh fa-spin fa-3x" ></span>
								<h4>Please Wait..</h4>
								</div>
								
								<!-- Check Box issue -->    */
							%>

							<dir class="container text=center">
								<button type="submit" class="btn btn-primary" id="submitbutton">Submit</button>

							</dir>

						</form>

					</div>


				</div>

			</div>
		</div>
	</div>
	</main>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
	<script src="Js/myjs.js" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


	</script>
</body>
</html>