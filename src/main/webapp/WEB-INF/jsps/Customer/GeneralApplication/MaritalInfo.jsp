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
<title>Marital Info</title>
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

<!-- ***************** ___Marital Information Form -- START___ ******************** -->										

 	<fieldset>
       	<legend>	Marital Information 		</legend>  
		<form:form action="/MaritalInfo/${Useremail}" method="get" modelAttribute="MaritalInfo">
			<table>
				<tr>
					<td>
						<form:hidden path="userEmail" value="${Useremail}"/>
					</td>
				</tr>
				<tr>
					<td>
						Date of Marriage:
					</td>
					
					<td>
						<form:input path="marriageDate"/>
					</td>
				</tr>
				
				<tr>
					<td>
						Date of Cohabitation:
					</td>
					
					<td>
						<form:input path="cohabitationDate"/>
					</td>
				</tr>
				<tr>
					<td>
						Place of Marriage:
					</td>
					<td>
						<form:input path="postEducational"/>
					</td>
				</tr>
				<tr>
					<td>
						Date of Separation:
					</td>
					<td>
						<form:input path="marriagePlace"/>
					</td>
				</tr>
				<tr>
					<td>
						Have either you, your spouse,or children been in a court case before?(Yes/No):
					</td>
					<td>
						<form:input path="separationDate"/>
					</td>
				</tr>
				<tr>
					<td>
						Have you and your spouse made a written agreement dealing with any matter involved in this case?(Yes/No):
					</td>
					<td>
						<form:input path="courtCase"/>
					</td>
				</tr>
				
				<tr>
					<td>
						If client or spouse is stay-at-home parent,please give relevant dates:
					</td>
					<td>
						<form:input path="writtenAgreement"/>
					</td>
				</tr>
				
				<tr>
					<td>
						Do you have any safety concerns for yourself of your children?(Yes/No):
					</td>
					<td>
						<form:input path="safetyConcerns"/>
					</td>
				</tr>
				
				<tr>
					<td>
						Have the police been called to the matrimonial home and does either spouse have a criminal record?(Yes/No):
					</td>
					<td>
						<form:input path="spouseCriminalRecord"/>
					</td>
				</tr>
				
			</table>
			<input type="submit" value="Add"/>
			</form:form>
			</fieldset>
<!-- ***************** ___Marital Information Form -- END___ ******************** -->										

<br>
<br>

<!-- ***************** ___Navigation to Other Forms -- START___ ******************** -->										


			<div aria-label="Page navigation example">
			  <ul class="pagination">
			   	   	<li ><a class="page-link" href="/spouseInfo/${Useremail}">Prev</a></li>
    				<li><a class="page-link" href="/clientInfo/${Useremail}">Client Information</a></li>
    				<li><a class="page-link" href="/spouseInfo/${Useremail}">Spouse Information</a></li>
    				<li><a class="page-link" href="/martialInfo/${Useremail}">Marital Information</a></li>
    				<li><a class="page-link" href="/matrimonialHome/${Useremail}">Matrimonial Home</a></li>
    				<li><a class="page-link" href="/children/${Useremail}">Children</a></li>
    				<li><a class="page-link" href="/childExpense/${Useremail}">Children’s Expenses</a></li>
    				<li ><a class="page-link" href="/matrimonialHome/${Useremail}">Next</a></li>
			  </ul>
			</div>
			
<!-- ***************** ___Navigation to Other Forms -- END___ ******************** -->										


</body>
</html>