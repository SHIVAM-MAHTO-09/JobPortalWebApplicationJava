<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#">Job Portal</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>



			<c:if test="${userobj.role eq 'admin'}">
				<li class="nav-item"><a class="nav-link" href="AddJob.jsp">Post
						Jobs</a></li>

				<li class="nav-item"><a class="nav-link" href="ViewJob.jsp">View
						Jobs</a></li>


			</c:if>

		</ul>

		<form class="form-inline my-2 my-lg-0">


			<c:if test="${empty userobj}">
				<li class="nav-item"><a class="nav-link" href="login.jsp">LOGIN</a></li>

				<li class="nav-item"><a class="nav-link" href="SignUp.jsp">SIGNUP</a></li>


			</c:if>
			<c:if test="${not empty userobj}">
				<li class="nav-item"><a class="nav-link" href="#">${userobj.name}</a></li>

				<li class="nav-item"><a class="nav-link" href="LogoutServlet">LogOut</a></li>


			</c:if>

			 

		</form>
	</div>
</nav>
