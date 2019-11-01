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
<title>Spouse Info</title>
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
				  aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width:20%">
				    20%
				  </div>
				</div>
				</section>
		</div>
			
			
<!-- ***************** ___Spouse Information -- START___ ******************** -->       	
       	<fieldset>
       	<legend>	Spouse Information 		</legend>  
		<form:form action="/spouseInfo/${Useremail}" method="get" modelAttribute="spouseInfo">
			<table>
				<tr>
					<td>
						<form:hidden path="userEmail" value="${Useremail}"/>
					</td>
				</tr>
				<tr>
					<td>
						Full Legal Name:
					</td>
					<td>
						<form:input path="spouseName"/>
					</td>
				</tr>
				<tr>
					<td>
						Date of Birth:
					</td>
					<td>
						<form:input path="spouseDateOfBirth"/>
					</td>
				</tr>
				<tr>
					<td>
						Citizenship:
					</td>
					<td>
						<form:input path="spouseCitizenship"/>
					</td>
				</tr>
				<tr>
					<td>
						Place of Birth:
					</td>
					<td>
						<form:input path="spousePlaceOfBirth"/>
					</td>
				</tr>
				<tr>
					<td>
						SIN: 
					</td>
					<td>
						<form:input path="spouseSIN"/>
					</td>
				</tr>
				<tr>
					<td>
						Surname at Birth:
					</td>
					<td>
						<form:input path="spouseSurnameBirth"/>
					</td>
				</tr>
				<tr>
					<td>
					`	Surname Before marriage:
					</td>
					<td>
						<form:input path="spouseSurnameMarriage"/>
					</td>
				</tr>
				<tr>
					<td>
						Current Home Address:
					</td>
					<td>
						<form:input path="spouseCurrentAddress"/>
					</td>
				</tr>
				<tr>
					<td>
						Since When?
					</td>
					<td>
						<form:input path="spouseSinceWhen"/>
					</td>
				</tr>
				<tr>
					<td>
						Current Mailing Address:
					</td>
					<td>
						<form:input path="spouseMailingAddress"/>
					</td>
				</tr>
				<tr>
					<td>
						Home Tel:
					</td>
					<td>
						<form:input path="spouseHomeTel"/>
					</td>
				</tr>
				<tr>
					<td>
						Work Tel:
					</td>
					<td>
						<form:input path="spouseWorkTel"/>
					</td>
				</tr>
				<tr>
					<td>
						Cell:
					</td>
					<td>
						<form:input path="spouseCell"/>
					</td>
				</tr>
				<tr>
					<td>
						Fax:
					</td>
					<td>
						<form:input path="spouseFax"/>
					</td>
				</tr>
				<tr>
					<td>
						Email:
					</td>
					<td>
						<form:input path="spouseEmail"/>
					</td>
				</tr>
				<tr>
					<td>
						Divorced Before?
					</td>
					<td>
						<form:input path="spouseDivorcedStatus"/>
					</td>
				</tr>
				<tr>
					<td>
						Place:
					</td>
					<td>
						<form:input path="spouseDivorcePlace"/>
					</td>
				</tr>
				<tr>
					<td>	
						Date:
					</td>
					<td>
						<form:input path="spouseDivorceDate"/>
					</td>
				</tr>
				<tr>
					<td>
						Job Title:
					</td>
					<td>
						<form:input path="spouseJobTitle"/>
					</td>
				</tr>
				<tr>
					<td>
						Current Employer:
					</td>
					<td>
						<form:input path="spouseCurrentEmployer"/>
					</td>
				</tr>
				<tr>
					<td>
						Current Employer Address:
					</td>
					<td>
						<form:input path="spouseEmployerAddress"/>
					</td>
				</tr>
				<tr>
					<td>
						Current Annual Income from Employment($):
					</td>
					<td>
						<form:input path="spouseAnnualIncome"/>
					</td>
				</tr>
				<tr>
					<td>
						Income from other sources:
					</td>
					<td>
						<form:input path="spouseIncomeOtherSource"/>
					</td>
				</tr>
			</table>
			<input type="submit" value="Add"/>
			</form:form>
			</fieldset>					
<!-- ***************** ___Spouse Information -- END___ ******************** -->										
<br>
<br>

<!-- ***************** ___Navigation to Other Forms -- START___ ******************** -->										


			<div aria-label="Page navigation example">
			  <ul class="pagination">
			   	   	<li ><a class="page-link" href="/navclientInfo/${Useremail}">&lt;&lt; Prev</a></li>
    				<li><a class="page-link" href="/navclientInfo/${Useremail}">Client Information</a></li>
    				<li><a class="page-link" href="/navspouseInfo/${Useremail}">Spouse Information</a></li>
    				<li><a class="page-link" href="/navmaritalInfo/${Useremail}">Marital Information</a></li>
    				<li><a class="page-link" href="/navmatrimonialHome/${Useremail}">Matrimonial Home</a></li>
    				<li><a class="page-link" href="/navchildren/${Useremail}">Children</a></li>
    				<li><a class="page-link" href="/navchildExpense/${Useremail}">Childrens Expenses</a></li>
    				<li ><a class="page-link" href="/navmaritalInfo/${Useremail}">Next &gt;&gt;</a></li>
			  </ul>
			</div>
			
<!-- ***************** ___Navigation to Other Forms -- END___ ******************** -->										


</body>
</html>