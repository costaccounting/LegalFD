<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
  
  
<title>Admin Page</title> 	

</head>
<style>
.navbar-brand {
	font-size: xx-large;
	margin-right: 30px;
}

#navContainer {
	width: 2200px;
}

#newLi a.active {
	background-color: #555;
	color: white;
}

#newLi a:hover {
	background-color: #555;
	color: white;
}

#newUl {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 20%;
	background-color: #f1f1f1;
	position: fixed;
	height: 100%;
	overflow: auto;
}

#newLi a {
	display: block;
	color: #000;
	padding: 8px 16px;
	text-decoration: none;
	text-align: center;
}

#navbarbrand {
	display: block;
	text-align: center;
	color: white;
	padding: 5px 16px;
	text-decoration: none;
	font-size: xx-large;
}

#cardBody {
	margin-bottom: 80px;
	margin-top: 120px;
	margin-left: 80px;
}

#newContainer {
	background-color: lightgray;
	padding: 1px;
	margin-left: 300px;
	width: 70%;
	height: 70%;
	opacity: 0.8;
	border-radius: 15px;
}

#cardHeader {
	background-color: #555;
	color: white;
	width: 100%;
}

#card2 {
	margin-left: 180px;
	margin-top: 120px;
}

/* Paras CSS code - For Delete button */
.close {
  position: absolute;
  right: 32px;
  top: 32px;
  width: 32px;
  height: 32px;
  opacity: 0.3;
}
.close:hover {
  opacity: 1;
}






.notification .badge {
  position: absolute;
  top: -10px;
  right: -10px;
  padding: 5px 10px;
  border-radius: 50%;
  background: red;
  color: white;
}


</style>
<body>

<body>

	<div type="hidden" name="email" value="${Useremail}"></div>

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
					
					<li class="nav-item px-2"><a href="/dashboard/${Useremail}" class="nav-link ">Home</a></li>

					<li class="nav-item px-2 dropdown mr-3">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
							<span class="notification">Notification</span>
								<span class="badge">${count} </span>
						</a>
					<div class="dropdown-menu">
					
						<c:forEach var="notification" items="${notiList}">
							<i> ${notification} </i><br>
						</c:forEach>
					
					</div>
					</li>
					
					<li class="nav-item px-2"><a href="/editDocPrice/${Useremail}" class="nav-link">Edit Form Price</a></li>
				</ul>

				<ul class="navbar-nav ml-auto">

					<li class="nav-item dropdown mr-3">
						<a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"> <i
								class="fas fa-user"></i> Welcome ${firstName}
						</a>
						<div class="dropdown-menu">
							
							<a href="/caseRequest/${Useremail}" class="dropdown-item"> <i
								class="fas fa-cog"></i>Case Request
							</a>
							
							<a href="/settings/${Useremail}" class="dropdown-item"> <i class="fas fa-cog"></i>
								Settings
							</a>
							
						</div>
					</li>

					<li class="nav-item"><c:url var="logoutUrl" value="/logout" />
						<a href="${logoutUrl}" class="nav-link "><i
							class="fa fa-power-off"></i> Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>

 
	<div class="container" id="newContainer">
		<div class="card-header" id="cardHeader">

			<h2>
				<i class="fas fa-users"></i> List of User
			</h2>

			<div class="alert alert-success" role="alert">
  				${message}
			</div>


		</div>
		<div id="accordion">

			<div class="card" id="cardForm">
				<div class="card-header">
					<div class="input-group">
						<input type="text" class="form-control" id="myInput"
							placeholder="Search Users..." onkeyup="myFunction()">
						

						<!-- <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name"> -->
					</div>
				</div>
			</div>

			<div class="card" id="cardForm">
				<div class="card-header">
					<table class="table table-striped" id="myTable">
						<thead class="thead-dark">
							<tr>
								<th>Email</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Role</th>
								<th>Edit User</th>
								<th>Upload Document</th>
								<th>Customer Details</th>
								<th>Case Request</th>
								<th>Delete User</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="Users" items="${allData}">
								<tr>
									<td>${Users.email}</td>
									<td>${Users.firstName}</td>
									<td>${Users.lastName}</td>
									<td>${Users.role}</td>
									<td><a
										href="/edit/${Users.email}/${Useremail}"
										class="btn btn-outline-success "> <i
											class="fas fa-pencil-alt"></i> 
									</a></td>
									<td>
										<a href="details/${Users.email}/${Useremail}"
											class="btn btn-outline-info"> <i class="fa fa-upload"></i>
												
										</a>
									</td>
									<td>
										<a href="/application/${Users.email}/${Useremail}"
											class="btn btn-outline-info"> <i class="fa fa-bars"></i>
												
										</a>
									</td>
									<td>
								            <a href="/customerRequest/${Users.email}/${Useremail}" class="btn btn-outline-dark">
                                               <i class="fas fa-bars"></i> 
                                            </a>
                                    </td>
                                    
									<td>
								            <a href="/deleteAdmin/${Users.email}/${Useremail}" class="btn btn-outline-dark">
                                               <i class="fas fa-trash"></i> 
                                            </a>
                                    </td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
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