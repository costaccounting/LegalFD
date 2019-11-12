<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">


<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>


<title>Settings</title>

</head>

<body>
	<div type="hidden" name="email" value="${Useremail}"></div>




	<nav class="navbar navbar-expand-xl navbar-dark sticky-top"
		style="background-color: black">
		<div class="container" id="navContainer">
			<a href="#" class="navbar-brand "><span class="mb-0 h1"><i
					class="fas fa-balance-scale"> </i> LegalFD</span></a>
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav">

					<li class="nav-item px-2"><a href="/dashboard/${Useremail}"
						class="nav-link ">Home</a></li>
					<li class="nav-item px-2 dropdown mr-3"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"> <span
							class="notification">Notification</span> <span
							class="badge text-dark bg-light">${count}</span>
					</a>
						<div class="dropdown-menu p-3">
							<c:set var="count_noti" value="${fn:length(notiList)}" />

							<c:forEach var="i" begin="1" end="${count_noti}" step="1">
								${notiList[count_noti-i]}
								<a href="/deleteNotification/${i}/${Useremail}"> <i
									class="fa fa-times-circle"></i>
								</a>
								<div class="dropdown-divider"></div>
							</c:forEach>
						</div></li>

				</ul>

				<ul class="navbar-nav ml-auto">
					
					<li class="nav-item dropdown mr-3"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"> <i
							class="fas fa-user"></i> Welcome ${firstName}
					</a>
						<div class="dropdown-menu">
							<a href="/generalApplication/${Useremail}" class="dropdown-item">
								<i class="fas fa-user-circle"></i> Profile
							</a> <a href="#" class="dropdown-item"> <i class="fas fa-cog"></i>
								Settings
							</a>
						</div></li>

					<li class="nav-item"><c:url var="logoutUrl" value="/logout" />
						<a href="${logoutUrl}" class="nav-link "><i
							class="fa fa-power-off"></i> Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<br>





	
           
	<br>

	<div class="card-header mx-5 p-3 text-light bg-primary">


		<h2 class=" fas fa-edit "> Edit Information</h2>
		<div class="float-right">

			<a href="<c:url value="/dashboard/${Useremail}"/>"
				class="btn btn-light  " id="submit"> <i
				class="fas fa-arrow-left"></i> Back
			</a>
		</div>


	</div>

	<br>


	<div class="container">


		<form action="/editPassword/${Useremail}">

			<div class="form-group">
				<label for="name">User Email:</label> <input class="form-control"
					type="text" name="userEmail" value="${Useremail}" disabled>
			</div>
			<div class="form-group">
				<label for="name">First Name:</label> <input class="form-control"
					type="text" name="userFirstName" value="${userInfo.firstName}">
			</div>
			<div class="form-group">
				<label for="name">Last Name:</label> <input class="form-control"
					type="text" name="userLastName" value="${userInfo.lastName}">
			</div>
			<div class="form-group">
				<label for="name">New Password:</label> <input class="form-control"
					type="password" name="userNewPassword" value="${userInfo.password}">
			</div>


			<input class="btn btn-primary float-right" type="submit" value="Save">
		</form>

	</div>

</body>
</html>