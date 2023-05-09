<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="Header.jsp" />
	
	<div align=center>
	<h1>Login</h1>
	</div>
	<form action=LoginServlet method=post>
	<table>
	<tr><td>Email:</td><td><input type=text name=email></td></tr>
	<tr><td>Password:</td><td><input type=password name=password></td></tr>
	<tr><td><input type=submit value=login></td><td><input type=reset></td></tr>
	</table>
	</form>
	<jsp:include page="Footer.jsp" />
</body>
</html>