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
<title>Fill General Info</title>
</head>
<body>
<div type="hidden" name ="Useremail" value="${Useremail}"></div>

	<h1>General Information Application Form</h1>
	
	
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
    
      <c:url var = "url" value = "/admin"></c:url>
            <h1><b>LegalFD</b></h1>
       
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
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
		 		<a href= "${logoutUrl}" class="nav-link ">Log Out</a>
          </li>
          
        </ul>
      	</div>
    	</div>
  	</nav>
  	<div class="container">
      <div class="row">
        <div class="col-md-3">
          <a href="<c:url value="/dashboard/${Useremail}"/>" class="btn btn-light btn-block">
            <i class="fas fa-arrow-left"></i> Back To Dashboard
          </a>
        </div>
      </div>
     </div>
  	
<br>
<br>
<br>
  														
       		<div class="card" id="cardForm">
				<div class="card-header">
					<table class="table table-striped" id="myTable">
						<thead class="thead-dark">
							<tr>
								<th>Document Type</th>
								<th>Form Name</th>
								<th>Price</th>
								<th>Sale</th>
								<th>Edit Price</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="list" items="${listOfAllForms}">
								<tr>
									<td>${list.docType}</td>
									<td>${list.formType}</td>
									<td>
									<form action="/editForm">
									<input class="form-control" type="hidden" name="id" value="${list.id}">
									<input class="form-control" type="text" name="price" value="${list.price}" style="width: 70px;">
									</td>
									<td>
										<select class="form-control" name="sale">
                                    		<option>No</option>
                                    		<option>Yes</option>
                                		</select>
									</td>
									<td>
									<input class="btn btn-outline-success" type="submit" value="<i class="fas fa-pencil-alt"></i> Edit " />
									</form>
									
								<!-- 	<a
										href="<c:url value="/editForm/${list.id}/${list.price}/${list.sale}"/>"
										class="btn btn-outline-success"> 
											<i class="fas fa-pencil-alt"></i> Edit
										</a>
										 -->
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
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