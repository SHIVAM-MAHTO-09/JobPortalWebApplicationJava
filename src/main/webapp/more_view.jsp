<%@page import="java.util.ArrayList"%>
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
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<h5 class="text-center text-primary">All Jobs</h5>

				<%
				String loc = request.getParameter("location");
				String cat = request.getParameter("category");
				String msg = "";

				jobDAO dao = new jobDAO(DBconnect.getconn());
				List<Jobs> list = null;
				if ("lo".equals(loc) && "ca".equals(cat)) {
					list = new ArrayList<Jobs>();
					msg = "kindly choose the prefered location and category";
				} else if ("lo".equals(loc) || "ca".equals(cat)) {
					list = dao.getJobByLocOrCat(cat, loc);
				} else {
					list = dao.getJobByLocAndCat(cat, loc);
				}
				if (list.isEmpty()) {
				%>
				<h4 class="text-center text-danger">Jobs Not Available</h4>

				<%
				}
				if (list != null) {
				for (Jobs j : list) {
				%>

				<div class="card mt-2">
					<div class="card-body">
 
						<h6><%=j.getTitle()%></h6>

						<%
						if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
						%>
						<p><%=j.getDescription()%></p>

						<%
						} else {
						%>
						<p><%=j.getDescription().substring(0, 120)%></p>
						<%
						}
						%>

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


					</div>
				</div>
				<%
				}
				} else {
				%>
				<h4 class="text-center text-danger"><%=msg%></h4>
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>