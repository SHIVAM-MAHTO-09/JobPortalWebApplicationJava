<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/All_css.jsp"%>
</head>
<body>
<c:if test="${userobj.role ne 'admin'}">
				 <c:redirect url="login.jsp"></c:redirect>
			</c:if>
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<div class="text-center">
			<h1>Welcome Admin</h1>
		</div>
	</div>

</body>
</html>