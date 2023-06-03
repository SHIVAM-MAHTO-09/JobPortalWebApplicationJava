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

				<div class="card">
					<div class="card-body">

						<form class="form-inline" action="more_view.jsp" method="get">

							<div class="form-group col-md-5 mt-1">
								<h5>Location</h5>
							</div>

							<div class="form-group col-md-4 mt-1">
								<h5>Category</h5>
							</div>

							<div class="form-group col-md-5">
								<select name="location" class="custom-select"
									id="inlineFormCustomSelectPref">
									<option selected value="lo">Choose...</option>
									<option value="Delhi">Delhi</option>
									<option value="Banglore">Banglore</option>
									<option value="Gurgaon">Gurgaon</option>
									<option value="Noida">Noida</option>
									<option value="Hyderabad">Hyderabad</option>
									<option value="Chennai">Chennai</option>
									<option value="Indore">Indore</option>
								</select>
							</div>


							<div class="form-group col-md-4">
								<select name="category" class="custom-select"
									id="inlineFormCustomSelectPref">
									<option value="ca" selected>Choose...</option>
									<option value="Software Developer">Software Developer</option>
									<option value="Data Engineer">Data Engineer</option>
									<option value="Front End Developer">Front End
										Developer</option>
									<option value="Full Stack Devloper">Full Stack
										Devloper</option>
									<option value="Data Scientist">Data Scientist</option>
								</select>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
				<%
				jobDAO dao = new jobDAO(DBconnect.getconn());
				List<Jobs> list = dao.getAllJobs();
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
						<button
							onclick="https://docs.google.com/forms/d/e/1FAIpQLScvaYvACLNzhtPm4rwcKmtjSbDMZKwSVKTaXTayoAmB3Sp6sQ/viewform?usp=pp_url"
							type="submit" class="btn btn-primary" type="button">
							Apply Now</button>

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