<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sorry  Somthing Went Wrong..</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.banner-background{
clip-path: polygon(50% 0, 100% 0, 100% 35%, 100% 70%, 100% 100%, 48% 80%, 0 100%, 0% 70%, 0 1%, 20% 0);
}
</style>
</head>
<body>
<div class="container   text-center">
<img src="img/error.png" class="img-fluid"/>
<h3 class="display-3">Sorry! something went wrong..</h3>
<%=exception %>
<br>
<a class="btn primary-background btn-lg text-white mt-4" href="index.jsp">GO to Home Page</a>
</div>
</body>
</html>