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
	<div class="container p-2">
		<div class="col-md-12 offset-md-1">
			<div class="card">

				<div class="card-body">
					<div class="text-center ">

						<c:if test="${not empty msg}">
							<div class="alert alert-success" role="alert">${msg}</div>
							<c:remove var="msg" />
						</c:if>


						<h1>ADD JOBS</h1>
					</div>
					<br> <br>

					<form action="AddPostServlet" method="post">
						<div class="form-group ">
							<label>Enter Job Title</label> <input type="text" required
								class="form-control" name="title">
						</div>


						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option selected>Choose...</option>
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
								<label>Category</label> <select name="category"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option selected>Choose...</option>
									<option value="Software Developer">Software Developer</option>
									<option value="Data Engineer">Data Engineer</option>
									<option value="Front End Developer">Front End
										Developer</option>
									<option value="Full Stack Devloper">Full Stack
										Devloper</option>
									<option value="Data Scientist">Data Scientist</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Status</label> <select name="status"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option selected>Choose...</option>
									<option value="Active">Active</option>
									<option value="InActive">InActive</option>
								</select>
							</div>
						</div>

						<div class="form-group">

							<label> Description </label>
							<textarea rows="6" cols="" name="description"
								class="form-control"></textarea>

						</div>
						<button type="submit" class="btn btn-primary">Publish Job
						</button>
					</form>
				</div>
			</div>
		</div>
</body>
</html>