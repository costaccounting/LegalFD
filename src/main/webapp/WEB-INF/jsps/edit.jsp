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
</head>

<body>

<div>
	<p type="hidden" name ="sessionEmail" value="${Useremail}"/>
	<p type="hidden" name ="sessionPassword" value="${UserPassword}"/>		
</div>

  <nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
    <div class="container">
      <a href="dashboard.html" class="navbar-brand">LegalFD</a>
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav">
          <li class="nav-item px-2">
            <a href="dashboard.html" class="nav-link active">Dashboard</a>
          </li>
          
          <li class="nav-item px-2">
            <a href="users.html" class="nav-link">Users</a>
          </li>
        </ul>

        <ul class="navbar-nav ml-auto">
          <li class="nav-item dropdown mr-3">
            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
              <i class="fas fa-user"></i> Welcome ${firstName}
            </a>
            <div class="dropdown-menu">
              <a href="profile.html" class="dropdown-item">
                <i class="fas fa-user-circle"></i> Profile
              </a>
              <a href="settings.html" class="dropdown-item">
                <i class="fas fa-cog"></i> Settings
              </a>
            </div>
          </li>
          <li class="nav-item">
       		<c:url var="logoutUrl" value="/logout"/>
		 		<a href= "${logoutUrl}" class="nav-link active">Log Out</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- HEADER -->
  <header id="main-header" class="py-2 bg-primary text-white">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <h1>Editing User Info</h1>
        </div>
      </div>
    </div>
  </header>

  <!-- ACTIONS -->
  <section id="actions" class="py-4 mb-4 bg-light">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <a href="<c:url value="/dashboard/${Useremail}/${UserPassword} "/>" class="btn btn-light btn-block">
            <i class="fas fa-arrow-left"></i> Back To Dashboard
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

  <!-- DETAILS -->
  <section id="details">
    <div class="container">
      <div class="row">
        <div class="col">
          <div class="card">
            <div class="card-header">
              <h4>Edit User</h4>
            </div>
            <div class="card-body">
              
             <!-- 
             <form >
                <div class="form-group">
                  <label for="title">Name</label>
                  <input type="text" class="form-control" >
                </div>
                <div class="form-group">
                  <label for="title">Email</label>
                  <input type="text" class="form-control">
                </div>
              </form>
                
             -->
             <!-- 
               	<form action="/editUser">
	
					User Email: <input type="text" name="userEmail" value="${email }" disabled><br>
					First Name: <input type="text" name="userFirstName" value="${ firstName}"> <br>
					Last Name: <input type="text" name="userLastName" value="${ lastName}"> <br>
					
					<label>Role</label>
					<select name="role">
					  <option value="Client" selected>Client</option>
					  <option value="Lawyer">Lawyer</option>
					  <option value="Admin">**Admin**</option>
					</select>
					<br>
				<input class="btn btn-success btn-block" type="submit" value="Save Changes" />
				</form>
				-->
				<form action="/editUser/${Useremail}/${UserPassword}/${userInfo.email}">
					<!-- 
					<p type="hidden" name ="sessionEmail" value="${Useremail}"/>
					<p type="hidden" name ="sessionPassword" value="${UserPassword}"/>	
					-->
					User Email: <input type="text" name="userEmail" value="${userInfo.email}" disabled><br>
					First Name: <input type="text" name="userFirstName" value="${ userInfo.firstName}"> <br>
					Last Name: <input type="text" name="userLastName" value="${ userInfo.lastName}"> <br>
					
					<label>Role</label>
					<select name="role">
					  <option value="Client" selected>Client</option>
					  <option value="Lawyer">Lawyer</option>
					  <option value="Admin">**Admin**</option>
					</select>
					<br>
				<input class="btn btn-success btn-block" type="submit" value="Save Changes" />
				</form>
                
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  


  

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