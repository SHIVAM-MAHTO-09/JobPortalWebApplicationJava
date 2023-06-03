<%@page import="com.DB.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/All_css.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/j1.jpg");
	width: 100%;
	height: 90vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	 
	<div class="container-fluid back-img"> 	</div>
<%@include file="component/footer.jsp"%>
</body>
</html>