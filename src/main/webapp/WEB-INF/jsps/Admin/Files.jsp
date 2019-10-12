<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

fileeee
<table>
<c:forEach items="${filelist}" var="file">
    <tr>
        <td><c:out value="${file.getName()}"/></td>
        <td><c:out value="${file.getAbsolutePath()}"/></td>
        <td>
        	<form method="POST">
        		<input type="hidden" path="url" value="${file.getAbsolutePath()}" />
        		<input type="submit" value="Download file"/>
        		
        	</form>
        </td>
        
    </tr>
</c:forEach>
<c:forEach items="${dirSet}" var="dir">
    <tr>
        <td><c:out value="${dir}"/></td>
        
    </tr>
</c:forEach>

</table>
</body>
</html>