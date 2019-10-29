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
<title>Matrimonial Home</title>
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
			</section>
<!-- ***************** ___Marimonial Home Information Form -- START___ ******************** -->										

<fieldset>
       	<legend>	Matrimonial Information 		</legend>  
		<form:form action="/MatrimonialInfo/${Useremail}" method="get" modelAttribute="MatrimonialInfo">
			<table>
				<tr>
					<td>
						<form:hidden path="userEmail" value="${Useremail}"/>
					</td>
				</tr>
				<tr>
					<td>
						Address:
					</td>
					
					<td>
						<form:input path="firstAddress"/>
					</td>
				</tr>
				
				<tr>
					<td>
						Name(s) on Title:
					</td>
					
					<td>
						<form:input path="firstTitle"/>
					</td>
				</tr>
				<tr>
					<td>
						Value($):
					</td>
					<td>
						<form:input path="firstValue"/>
					</td>
				</tr>
				<tr>
					<td>
						Mortgage($):
					</td>
					<td>
						<form:input path="firstMortgage"/>
					</td>
				</tr>
							
			</table>
			<input type="submit" value="Add"/>
			</form:form>
			</fieldset>

<!-- ***************** ___Marimonial Home Information Form -- END___ ******************** -->										

<br>
<br>

<!-- ***************** ___Navigation to Other Forms -- START___ ******************** -->										


			<div aria-label="Page navigation example">
			  <ul class="pagination">
			   	   	<li ><a class="page-link" href="/martialInfo/${Useremail}">Prev</a></li>
    				<li><a class="page-link" href="/clientInfo/${Useremail}">Client Information</a></li>
    				<li><a class="page-link" href="/spouseInfo/${Useremail}">Spouse Information</a></li>
    				<li><a class="page-link" href="/martialInfo/${Useremail}">Marital Information</a></li>
    				<li><a class="page-link" href="/matrimonialHome/${Useremail}">Matrimonial Home</a></li>
    				<li><a class="page-link" href="/children/${Useremail}">Children</a></li>
    				<li><a class="page-link" href="/childExpense/${Useremail}">Childrens Expenses</a></li>
    				<li ><a class="page-link" href="/children/${Useremail}">Next</a></li>
			  </ul>
			</div>
			
<!-- ***************** ___Navigation to Other Forms -- END___ ******************** -->										

</body>
</html>