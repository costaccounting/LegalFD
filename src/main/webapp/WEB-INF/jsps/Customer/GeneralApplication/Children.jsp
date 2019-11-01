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
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Children</title>
</head>
<body>
<div type="hidden" name ="email" value="${Useremail}"></div>

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
          <li class="nav-item">
       		<c:url var="payment" value="/paymentPage/${Useremail}"/>
		 		<a href= "${payment}" class="nav-link ">View Cart</a>
          </li>  
        </ul>
      	</div>
    	</div>
  	</nav>
  	<div class="container">
      <div class="row">
        <div class="col-md-3">
          <a href="<c:url value="/ClientSide/${Useremail}"/>" class="btn btn-light btn-block">
            <i class="fas fa-arrow-left"></i> Back To Dashboard
          </a>
        </div>
      </div>
     </div>
  	
<br>
<br>
<br>
  		<div class="col">
	       	<section id="actions" class="py-4 mb-4 bg-light">
			  	<div class="alert alert-success">
			  		<p>${confirmationMessage}</p>
				</div>
				<div class="progress">
				  <div class="progress-bar progress-bar-striped active" role="progressbar"
				  aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width:80%">
				    80%
				  </div>
				</div>
				</section>
		</div>
			
<!-- ***************** ___Children Information Form -- START___ ******************** -->       	
       	<fieldset>
       	<legend>	Children Information 		</legend>  
		<form:form action="/children/${Useremail}" method="get" modelAttribute="children">
			<table>
				<tr>
					<td>
						<form:hidden path="userEmail" value="${Useremail}"/>
					</td>
				</tr>
				<tr>
					<th>
						Name
					</th>
					<th>
						Date of Birth
					</th>
					<th>
						Living With
					</th>
					<th>
						Grade
					</th>
					<th>
					School
					</th>
				</tr>
				<tr>
					<td>
						<form:input path="childName1"/>
					</td>
					<td>
						<form:input path="dobChild1"/>
					</td>
					<td>
						<form:input path="livingChild1"/>
					</td>
					<td>
						<form:input path="gradeChild1"/>
					</td>
					<td>
						<form:input path="schoolChild1"/>
					</td>
				</tr>
				<tr>
					<td>
						<form:input path="childName2"/>
					</td>
					<td>
						<form:input path="dobChild2"/>
					</td>
					<td>
						<form:input path="livingChild2"/>
					</td>
					<td>
						<form:input path="gradeChild2"/>
					</td>
					<td>
						<form:input path="schoolChild2"/>
					</td>
				</tr>
				<tr>
					<td>
						<form:input path="childName3"/>
					</td>
					<td>
						<form:input path="dobChild3"/>
					</td>
					<td>
						<form:input path="livingChild3"/>
					</td>
					<td>
						<form:input path="gradeChild3"/>
					</td>
					<td>
						<form:input path="schoolChild3"/>
					</td>
				</tr>
				<tr>
					<td>
						<form:input path="childName4"/>
					</td>
					<td>
						<form:input path="dobChild4"/>
					</td>
					<td>
						<form:input path="livingChild4"/>
					</td>
					<td>
						<form:input path="gradeChild4"/>
					</td>
					<td>
						<form:input path="schoolChild4"/>
					</td>
				</tr>
				
			</table>
			<input type="submit" value="Add"/>
			</form:form>
			</fieldset>					
<!-- ***************** ___Children Information Form -- END___ ******************** -->										
<br>
<br>

<!-- ***************** ___Navigation to Other Forms -- START___ ******************** -->										


			<div aria-label="Page navigation example">
			  <ul class="pagination">
			   	   	<li ><a class="page-link" href="/navmatrimonialHome/${Useremail}"> &lt;&lt; Prev</a></li>
    			<li><a class="page-link" href="/navclientInfo/${Useremail}">Client Information</a></li>
    				<li><a class="page-link" href="/navspouseInfo/${Useremail}">Spouse Information</a></li>
    				<li><a class="page-link" href="/navmaritalInfo/${Useremail}">Marital Information</a></li>
    				<li><a class="page-link" href="/navmatrimonialHome/${Useremail}">Matrimonial Home</a></li>
    				<li><a class="page-link" href="/navchildren/${Useremail}">Children</a></li>
    				<li><a class="page-link" href="/navchildExpense/${Useremail}">Childrens Expenses</a></li>
    				<li ><a class="page-link" href="/navchildExpense/${Useremail}">Next &gt;&gt;</a></li>
			  </ul>
			</div>
			
<!-- ***************** ___Navigation to Other Forms -- END___ ******************** -->										


</body>
</html>