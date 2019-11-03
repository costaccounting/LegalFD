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
<title>Edit Form/Document</title>
</head>
<style>
.navbar-brand {
	font-size: xx-large;
	margin-right: 30px;
}
#submit {
	/*    padding-bottom: 50px;  */
	position: absolute;
	margin-left: 950px;
	margin-top: 5px;
}
.card-header {
	background-color: #555;
	color: white;
	width: 1240px;
	margin-top: 30px;
	margin-left: 20px;
	display: flex;
}
#price{

background-color: white;
}

#myInput {
  
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 90%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 95%;
	margin-top: 20px;
	margin-left: 30px;
	border-collapse: collapse;
}

th {
	color: white;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}

tr:hover {
	background-color: #ddd;
}

th {
	background-color: dimgrey;
}

</style>
<body>
<div type="hidden" name ="Useremail" value="${Useremail}"></div>

		
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

					<li class="nav-item px-2"><a href="#" class="nav-link">Notification</a>
					</li>
				</ul>

				<ul class="navbar-nav ml-auto">

					<li class="nav-item dropdown mr-3"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"> <i
							class="fas fa-user"></i> Welcome ${firstName}
					</a>
						<div class="dropdown-menu">
							
							 <a href="#" class="dropdown-item"> <i class="fas fa-cog"></i>
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
	
	<div class="card-header" >

			<h2>
				 Document/Form Price
			</h2>
			<a href="<c:url value="/dashboard/${Useremail}"/>"
			class="btn btn-light " id="submit"> <i class="fas fa-arrow-left"></i>
			Back To Dashboard
		</a>
		

		</div>
		
		<div class="alert alert-success" role="alert" style="margin-left: 30px; width: 20%; ">
  			${message}
		</div>
		
		<div class="card" id="cardForm">
				<div class="card-header" id="price">
					<div class="input-group">
						<input type="text" class="form-control" id="myInput"
							placeholder="Search Users..." onkeyup="myFunction()">
						

						<!-- <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name"> -->
					</div>
				</div>
			</div>
		<br>
		
		<%-- <div class="container">
      <div class="row">
        <div class="col-md-3">
          <a href="<c:url value="/dashboard/${Useremail}"/>" class="btn btn-light btn-block">
            <i class="fas fa-arrow-left"></i> Back To Dashboard
          </a>
        </div>
      </div>
     </div> --%>
  	

  														
       		
					<table id="myTable">
						
							<tr>
								<th>Document Type</th>
								<th>Form Name</th>
								<th>Price</th>
								<th>Sale</th>
								<th>Edit Price</th>
							</tr>
						
						

							<c:forEach var="list" items="${listOfAllForms}">
								<tr>
									<td>${list.docType}</td>
									<td>${list.formType}</td>
									<td>
									<form action="/editForm">
									<input class="form-control" type="hidden" name="Useremail" value="${Useremail}">
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
									<input class="btn btn-outline-success" type="submit" value="Edit" />
									</form>
								
									</td>
								</tr>
							</c:forEach>

						
					</table>
				
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