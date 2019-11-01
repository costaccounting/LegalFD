<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
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
<link rel="stylesheet" href="../../../css/fileupload.css">

<title>Upload Documents</title>
</head>
<body>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
		<div class="container" id="navContainer">
			<a href="#" class="navbar-brand"><i class="fas fa-balance-scale">
			</i> LegalFD</a>
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav">
					<c:url var="sh" value="/homePage" />
					<li class="nav-item px-2"><a href=${sh } class="nav-link ">Home</a></li>

					<li class="nav-item px-2"><a href="#" class="nav-link">Notification</a>
					</li>
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
	<section id="actions" class="py-4 ml-2 bg-light">

		<ul id="newUl">
			<li id="navbarbrand" class="bg-dark">
				<h4>Dashboard</h4>
			</li>
			<br>
			<c:url var="sh" value="/listUser" />
			<li id="newLi"><a class="active" href=${sh }>List of User</a></li>
			<c:url var="sh" value="/listUser" />
			<li id="newLi"><a href=${sh }>Edit Document/Form Price</a></li>
			<c:url var="sh" value="/listUser" />
			<li id="newLi"><a href=${sh }>Upload Documents</a></li>

		</ul>


	</section>
	<div class="container" id="newContainer">
		<div class="card-header" id="cardHeader">

			<h2>
				<i class="fas fa-users"></i> Upload Documents
			</h2>

		</div>
		<div id="accordion">

			<div class="card" id="cardForm">
				<div class="card-header">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search Users...">
						<div class="input-group-append">
							<button class="btn btn-warning">Search</button>
						</div>
					</div>
				</div>
			</div>
			<div class="card" id="cardForm">
				<div class="card-header">

					<div style="display: flex">
						<c:forEach var="Users" items="${allDataForLawyer}">
							<a><img src="folder.png" alt="Workplace" width="70"
								height="70" style="display: block">{Users.email}</a>

						</c:forEach>
					</div>
				</div>
			</div>


		</div>
		<div>
			<h2>Directory : ${presentDirectory}</h2>
			<table class="table table-dark">
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
			<span class="border-top my-3"></span>
			<h2>Add file</h2>
			<form method="POST"
				action="/upload/<c:out value= "${presentDirectory}" />"
				enctype="multipart/form-data">
				<input type="file" name="file" type="button" class="btn btn-primary btn-lg"/><br /> <br /> <input
					type="submit" value="Submit" />
			</form>
			<hr>
			<br /> message
			<div c:if="${message}">
				<h2 c:text="${message}" />
			</div>
		</div>
	</div>



	<script>
		function myFunction() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[0];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>
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


	<script>
		// Get the current year for the copyright
		$('#year').text(new Date().getFullYear());
	</script>
</body>
</html>