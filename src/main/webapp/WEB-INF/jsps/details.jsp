<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ page import="java.util.List"%>
<%@ page import="java.io.File" %>
    
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
  
  <title>Details About User</title>
</head>

<body>

<div>
	<p type="hidden" name ="email" value="${Useremail}"/>
	<p type="hidden" name ="password" value="${UserPassword}"/>		
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
          <h1>Uploading Documents for Users </h1>
        </div>
        <div>
        		<div>
			<h2>Directory : ${presentDirectory}</h2>
			<table class="table table-dark">
				<tr>
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
								System.out.println(listitem);
								if( listitem[0].equals(f.getName()) ){
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
			<span class="border-top my-3"></span>
			<h2>Add file</h2>
			<form method="POST"
				action="/upload/<c:out value= "${presentDirectory}" />"
				enctype="multipart/form-data">
				<input type="file" name="file" type="button"
					class="btn btn-primary btn-lg" /><br /> <br /> <input
					type="submit" value="Submit" />
			</form>
			<hr>
			<br /> message
			<div c:if="${message}">
				<h2 c:text="${message}" />
			</div>
		</div>
        
        </div>
      </div>
    </div>
  </header>

  

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