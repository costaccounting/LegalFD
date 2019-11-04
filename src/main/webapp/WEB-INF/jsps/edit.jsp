<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
  
  <title>Edit Details for User</title>
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
#buttons{
    margin-left: 530px;
}
</style>
</head>

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
			
			<li id="newLi"><a class="active" href="/dashboard/${Useremail}">List of User</a></li>
			<li id="newLi"><a href="/editDocPrice/${Useremail}">Edit Document/Form Price</a></li>
			<!-- <li id="newLi"><a href="#">Upload Documents</a></li> -->

		</ul>
	</section>
	
	
<div  class="container" id="newContainer">
            <div class="card-header" id="cardHeader">
                    
                    <h2><i class="fas fa-pencil-alt"></i> Edit User</h2>
                    
                    
                </div>
                <div id="accordion">

                    <div class="card" id="cardForm">
                        <div class="card-header">
                        
                        <form action="/editUser/${Useremail}/${userInfo.email}">
                            <div class="form-group">
                                <label for="name">User Email:</label>
                                <input class="form-control" type="text" name="userEmail" value="${userInfo.email}" disabled>
                            </div>
                            <div class="form-group">
                                <label for="name">First Name:</label>
                                <input class="form-control" type="text" name="userFirstName" value="${userInfo.firstName}">
                            </div>
                            <div class="form-group">
                                <label for="name">Last Name:</label>
                                <input class="form-control" type="text" name="userLastName" value="${userInfo.lastName}">
                            </div>
                            <div class="form-group">
                                <label for="gender">Role:</label>
                                <select class="form-control" name="role">
                                    <option>Client</option>
                                    <option>Lawyer</option>
                                    <option>Admin</option>
                                </select><br>
                            </div>
<<<<<<< HEAD
                             <div id="buttons"
                        <a href="/dashboard/${Useremail}"/>" class="btn btn-secondary"> <i class="fas fa-arrow-left"></i> Back to Dashboard </a>
=======
                             <div id="buttons">
                        <a href="/dashboard/${Useremail}" class="btn btn-secondary"> <i class="fas fa-arrow-left"></i> Back to Dashboard </a>
>>>>>>> afea1bb1005bb87d4226bbdffc7a040cc01537a6
                    
                    <input class="btn btn-success" type="submit"value="Save Changes" id="submit1">
                </div>
                    </form>
                   
                  </div>
                
                </div>
                         
           </div>           
                
        </div>

  

  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
  <script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>

  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

    CKEDITOR.replace('editor1');
  </script>
</body>

</html>