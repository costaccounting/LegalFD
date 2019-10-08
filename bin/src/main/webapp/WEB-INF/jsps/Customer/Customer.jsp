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
  <!-- 
  <style>
  
	a:link, a:visited {
	  background-color: #f44336;
	  color: white;
	  padding: 14px 25px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	}
	
	a:hover, a:active {
	  background-color: red;
	}
  
  </style>
   -->
<title>Customer Page</title> 	

</head>
<body>

<div>
	<p type="hidden" name ="email" value="${Useremail}"/>
	<p type="hidden" name ="password" value="${UserPassword}"/>		
</div>


  <nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
    <div class="container">
    
      <c:url var = "url" value = "/admin"></c:url>
            <a href= "" class="navbar-brand">LegalFD</a>
       
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav">
          <li class="nav-item px-2">
          <!-- 
            <c:url var = "url" value = "/register"></c:url>
            <a href= "${url}" class="nav-link active">Dashboard</a>
           -->
          </li>

          <li class="nav-item px-2">
            <c:url var = "url" value = "/register"></c:url>
            <a href= "${url}" class="nav-link">Users</a>
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
          <li class="nav-item">
       		<c:url var="payment" value="/paymentPage/${Useremail}/${UserPassword}"/>
		 		<a href= "${payment}" class="nav-link active">View Cart</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- HEADER -->
  <header id="main-header" class="py-2 bg-warning text-white">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <h1>
            <i class="fas fa-users" style="align: center;"></i>List of Services</h1>
        </div>
      </div>
    </div>
  </header>

<br>
<br>
<br>
  		<div class="col">
       		
       		<div class="alert alert-success">
  				<p>${requestMessage}</p>
			</div>
       
            <div class="card text-center bg-success text-white mb-3">
                <div class="card-body">
                    <h3>Legal Documents</h3>
                    <h4 class="display-4">
                        <i class="fas fa-folder"></i> 
                    </h4>
                	    <c:url var="document" value="/document/${Useremail}/${UserPassword}"/>
		 				<a href= "${document}" class="nav-link active" style="background-color: red; color: white; padding: 14px 25px; text-align: center; text-decoration: none; display: inline-block;">Request Document</a>
          
                </div>
            </div>

            <div class="card text-center bg-warning text-white mb-3">
                <div class="card-body">
                    <h3>Legal Forms</h3>
                    <h4 class="display-4">
                        <i class="fas fa-file-alt"></i> 
                    </h4>
            	        <c:url var="form" value="/form/${Useremail}/${UserPassword}"/>
		 				<a href= "${form}" class="nav-link active" style="background-color: red; color: white; padding: 14px 25px; text-align: center; text-decoration: none; display: inline-block;">Request Form</a>
          
                </div>
            </div>
        
    	</div>

  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>


  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());
  </script>

</body>
</html>