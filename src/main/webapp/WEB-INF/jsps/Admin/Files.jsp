<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ page import="java.util.List"%>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<title>Upload Documents</title>
</head>
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
</style>
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
					
					<li class="nav-item px-2"><a href="/dashboard/${Useremail}" class="nav-link ">Home</a></li>

					<li class="nav-item px-2 dropdown mr-3">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"> 
							<span class="notification">Notification</span> 
							<span class="badge text-dark bg-light">${count}</span>
						</a>
						<div class="dropdown-menu">
							<c:set var="count_noti" value="${fn:length(notiList)}" />
							
							<c:forEach var="i" begin="1" end="${count_noti}" step="1">
								${notiList[count_noti-i]}
								<br>
							</c:forEach>
						</div>
					</li>											
					
				</ul>

				<ul class="navbar-nav ml-auto">
					
					<li class="nav-item dropdown mr-3"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"> <i
							class="fas fa-user"></i> Welcome ${firstName}
					</a>
						<div class="dropdown-menu">
							 <a href="/Lawsettings/${Useremail}" class="dropdown-item"> <i class="fas fa-cog"></i>
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




	<div  class="container" id="newContainer">
           
          <div class="card-header" id="cardHeader">

			<h2>
				<i class="fa fa-upload"></i> Upload Documents
			</h2>
			<a href="<c:url value="/dashboard/${Useremail}"/>"
			class="btn btn-light " id="submit"> <i class="fas fa-arrow-left"></i>
			Back To Dashboard
		</a>

		</div>
           
            
                <div id="accordion">

                    <div class="card" id="cardForm">
                        
                      </div>
                      <div class="card" id="cardForm">
                          <div class="card-header" >
                             
                            <div style="display: flex">
                                <c:forEach var="Users" items="${allDataForLawyer}">
                          <a><img src="folder.png" alt="Workplace" width="70" height="70"  style="display: block">{Users.email}</a>
                          
                          </c:forEach>
                            </div>
                          </div>
                        </div>
                      
                        
                          </div>
       		<div>
			<h2>Directory : ${presentDirectory}</h2>
			<table class="table table-dark">
				<tr>
					<th></th>
					<th>Name</th>
					<th>Action</th>
					<th>Uploaded By</th>
					<th>Upload Date</th>
				</tr>
				<%
					List<String[]> list = (List<String[]>) request.getAttribute("fileinfo");
					List<File> filelist = (List<File>)request.getAttribute("filelist");
					String presentDirectory = (String)request.getAttribute("presentDirectory");

					for(File f : filelist){
						out.print("<tr>");
						
						if( f.isDirectory() ){
							out.print("<td>" + f.getName() + "</td>");
							out.print("<td><a href='files/"+ f.getName() + "'>Next</a></td>");
							out.print("<td></td>");
							out.print("<td></td>");
							
						}
						else if ( f.isFile() ){
							for (String[] listitem : list){
								//System.out.println("matching = " + listitem[0] + "," + f.getName() + " :" + listitem[0].equals(f.getName()) );
								//System.out.println(listitem);
								if( listitem[0].equals(f.getName()) ){
									out.print("<td><input type='checkbox' id='sel' class='sel' name='"+ f.getName() + "' value='"+ f.getName() + "'/></td>");
									out.print("<td>" + listitem[3] + "</td>");
									out.print("<td>" +
										"<form method='POST' action='/download'>"+
										"<input type='hidden' name='filename' value='"+ f.getName()+ "'/>"+
										"<input type='hidden' name='foldername' "+
										" value='" + presentDirectory +"' /> "
										+ "<input type='submit' value='Download file' class='btn btn-link' /> </form>" +								
								
										"</td>");
									out.print("<td>" + listitem[1] +" </td>");
									out.print("<td>" + listitem[2] + "</td>");
									
									
								}
							}
						}
						out.print("</tr>");
					}
					
				%>
			</table>
			<div id="formDelete">
				<form id="submitForm" method="Post" action="/deleteFileAdmin/${presentDirectory}">
					<input type="hidden" id="Useremail" name="Useremail" value="${Useremail}"/>
					<input type="hidden" id="hiddenInp" name="hiddenInp"/>
					<input type="button" onClick="processDelete()" value="Delete selected files" />
				</form>
			</div>
			<span class="border-top my-3"></span>
			<h2>Add file</h2>
			<form method="POST"
				action="/upload/<c:out value= "${presentDirectory}" />"
				enctype="multipart/form-data">
				<input type="hidden" name="Useremail" value="${Useremail}" />
				<input type="file" name="file" type="button"
					class="btn btn-primary btn-lg" /><br /> <br /> <input
					type="submit" value="Submit" />
			</form>
			<hr>
			<br /> 
			<div c:if="${message}">
				<h2 c:text="${message}" />
			</div>
		</div>
        
        </div>
                  

	<script  type="text/javascript">
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
		
		function processDelete(){
			var selected = new Array();
			var boxes = document.getElementsByClassName("sel");
			for (var i=0;i<boxes.length;i++) {
			   var box = boxes[i];
			   if (box.checked) {
				   selected.push(box.value);
			   }
			}
			alert("in process: "+ selected);
			document.getElementById("hiddenInp").value = selected;
			document.getElementById("submitForm").submit();
			
		}
	</script>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>


	<script>
		// Get the current year for the copyright
		$('#year').text(new Date().getFullYear());
	</script>
</body>
</html>
