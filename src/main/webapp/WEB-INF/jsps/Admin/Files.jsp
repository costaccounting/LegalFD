<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.List"%>


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
        <td><c:out value="${file}"/></td>
        <td><a href="<c:out value="${item.urlForOnline}"    />"  target="_blank"><c:out value="${item.urlForOnline}"    /></a>     
        </td>
    </tr>
</c:forEach>

</table>
</body>
</html>