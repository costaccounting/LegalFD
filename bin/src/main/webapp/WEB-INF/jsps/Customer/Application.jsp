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
       	
<!-- ***************** ___Child Expenses Inforamtion Form -- START___ ******************** -->       	
       	<fieldset>
       	<legend>	Child Expenses Information 		</legend>  
		<form:form action="/childExpense/${Useremail}" method="get" modelAttribute="childExpenses">
			<table>
				<tr>
					<td>
						<form:hidden path="userEmail" value="${Useremail}"/>
					</td>
				</tr>
				<tr>
					<td>
						Medical/Dental/Orthodontic:
					</td>
					<td>
						<form:input path="medical"/>
					</td>
				</tr>
				<tr>
					<td>
						Private School/Tutoring/Educational Expenses:
					</td>
					<td>
						<form:input path="educational"/>
					</td>
				</tr>
				<tr>
					<td>
						Post-secondary Educational Expenses:
					</td>
					<td>
						<form:input path="postEducational"/>
					</td>
				</tr>
				<tr>
					<td>
						Daycare/Child Care:
					</td>
					<td>
						<form:input path="daycare"/>
					</td>
				</tr>
				<tr>
					<td>
						Extracurricular Activities:
					</td>
					<td>
						<form:input path="extraCurricular"/>
					</td>
				</tr>
				<tr>
					<td>
						Other Expenses:
					</td>
					<td>
						<form:input path="others"/>
					</td>
				</tr>
				
			</table>
			<input type="submit" value="Add"/>
			</form:form>
			</fieldset>					
<!-- ***************** ___Child Expenses Inforamtion Form -- END___ ******************** -->										
	<br>											
	<br>
<!-- ***************** ___Children Inforamtion Form -- START___ ******************** -->       	
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
						Grade/School
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
<!-- ***************** ___Children Inforamtion Form -- END___ ******************** -->										
	<br>											
	<br>
<!-- ***************** ___Client Inforamtion Form -- START___ ******************** -->       	
       	<fieldset>
       	<legend>	Client Information 		</legend>  
		<form:form action="/clientInfo/${Useremail}" method="get" modelAttribute="clientInfo">
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
						<form:input path="fullLegalName"/>
					</td>
				</tr>
				<tr>
					<td>
						
					</td>
					<td>
						<form:input path="dateOfBirth"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="citizenship"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="placeOfBirth"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="SIN"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="surnameBirth"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="surnameBeforeMarriage"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="currentHomeAddress"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="sinceWhen"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="currentMailingAddress"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="homeTel"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="workTel"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="cell"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="fax"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="email"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="divorcedBefore"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="place"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="date"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="jobTitle"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="currentEmployer"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="employerAddress"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="annualIncome"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
					<td>
						<form:input path="incomeOtherSource"/>
					</td>
				</tr>
			</table>
			<input type="submit" value="Add"/>
			</form:form>
			</fieldset>					
<!-- ***************** ___Client Inforamtion Form -- END___ ******************** -->										
														
																
																		
       		
        	
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