<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type=text/css rel=stylesheet href=login.css />
<title>Login Page</title>
</head>
<body>
<h1 style="color: blue">Welcome to BudgetSpoon!</h1>
<h2 style="color: blue">Your one stop directory to find the perfect restaurant that fits into your budget</h2>

<h2 style="color: blue">Fill Out the Information Below to Log In</h2>

<form action="loginSuccess.html" method="post">
<center>
<table>

	<tr><td><label>Email :</label></td><td><input type="text" name="email" required></td></tr>
	<tr><td><label>Password :</label></td><td><input type="text" name="password" required></td></tr>


<input type="submit" value="Click Here to Submit Form" >
<input type="reset" value="Reset" >
</table>
</center>

</form>
</body>
</html>