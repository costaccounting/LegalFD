<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
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

<title>Client Content Management</title>
</head>
<body>
	<div>
		<p type="hidden" name="sessionEmail" value="${Useremail}" />
		<p type="hidden" name="sessionPassword" value="${UserPassword}" />
	</div>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
		<div class="container">
			<a href="dashboard.html" class="navbar-brand">LegalFD</a>
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav">
					<li class="nav-item px-2"><a href="dashboard.html"
						class="nav-link active">Dashboard</a></li>

					<li class="nav-item px-2"><a href="users.html"
						class="nav-link">Users</a></li>
				</ul>

				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown mr-3"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"> <i
							class="fas fa-user"></i> Welcome ${firstName}
					</a>
						<div class="dropdown-menu">
							<a href="profile.html" class="dropdown-item"> <i
								class="fas fa-user-circle"></i> Profile
							</a> <a href="settings.html" class="dropdown-item"> <i
								class="fas fa-cog"></i> Settings
							</a>
						</div></li>
					<li class="nav-item"><c:url var="logoutUrl" value="/logout" />
						<a href="${logoutUrl}" class="nav-link active">Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header id="main-header" class="py-2 bg-primary text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>Client Files Centre</h1>
				</div>
			</div>
		</div>
	</header>
	<!-- ACTIONS -->
	<section id="actions" class="py-4 mb-4 bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<a href="<c:url value="/dashboard/${Useremail}/${UserPassword} "/>"
						class="btn btn-light btn-block"> <i class="fas fa-arrow-left"></i>
						Back To Dashboard
					</a>
				</div>
				<!-- 
        <div class="col-md-3">
          <a href="dashboard.html" class="btn btn-success btn-block">
            <i class="fas fa-check"></i> Save Changes
          </a>
        </div>
         -->

			</div>
		</div>
	</section>

	<h2>Directory : ${presentDirectory}</h2>
	<table>
		<tr>
			<th>Name</th>
			<th>Action</th>
			<th>Uploaded By</th>
			<th>Upload Date</th>
		</tr>
		<c:forEach items="${filelist}" var="file">
			<tr>
				<c:if test="${file.isDirectory()}">
					<c:url var="fileURL" value="files/${file.getName()}">
					</c:url>
					<td><c:out value="${file.getName()}" /></td>
					<td><a href="<c:out value="${fileURL}"/>">Next</a></td>

				</c:if>
				<c:if test="${file.isFile()}">
					<c:url var="fileURL"
						value="download/${presentDirectory}/${file.getName()}">
					</c:url>
					<td><c:out value="${file.getName()}" /></td>
					<td>
						<form method="POST" action="/download">
							<input type="hidden" name="filename" value="${file.getName()}" />
							<input type="hidden" name="foldername"
								value="${presentDirectory}" /> <input type="submit"
								value="Download file" class="btn btn-link" />
						</form>
				</c:if>
				</td>
				<td></td>
				<td></td>
			</tr>
		</c:forEach>
	</table>
	<h2>Add file</h2>
	<form method="POST"
		action="/upload/<c:out value="${presentDirectory}" />"
		enctype="multipart/form-data">
		<input type="file" name="file" /><br /> <br /> <input type="submit"
			value="Submit" />
	</form>
	<hr>
	<br /> message
	<div c:if="${message}">
		<h2 c:text="${message}" />
	</div>
</body>
</html>