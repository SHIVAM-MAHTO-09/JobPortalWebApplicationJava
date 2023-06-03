<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.dao.jobDAO"%>
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

	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<h5 class="text-center text-primary">All Jobs</h5>
				<%
				jobDAO dao = new jobDAO(DBconnect.getconn());
				List<Jobs> list = dao.getAllJobs();
				for (Jobs j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<c:if test="${not empty msg}">
							<div class="alert alert-success" role="alert">${msg}</div>
							<c:remove var="msg" />
						</c:if>


						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%></p>
						<br>

						<div class="form-row">
							<div class="form-group col-md-3">

								<input type="text" class="form-control form-control-sm"
									value="Location:<%=j.getLocation()%>" readonly>
							</div>



							<div class="form-group col-md-3">

								<input type="text" class="form-control form-control-sm"
									value="category:<%=j.getCategory()%>" readonly>
							</div>



							<div class="form-group col-md-3">

								<input type="text" class="form-control form-control-sm"
									value="status:<%=j.getStatus()%>" readonly>
							</div>


						</div>
						 
						<div class="text-center">
							<a href="editjobs.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white ">Edit</a> <a
								href="DeleteJobServlet?id=<%=j.getId()%>"
								class="btn btn-sm bg-danger text-white ">Delete</a>
						</div>

					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>