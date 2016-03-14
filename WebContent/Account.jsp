<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create a Profile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/css/account.css" type = "text/css" rel = "stylesheet" />
</head>
<body>
  <header>
    <nav>
      <div class = "comp pull-left" id = "logo">
        <a href = "index.jsp" style = "text-decoration:none;" id = "BudgetSpoon">BudgetSpoon</a><br />
      </div>
      <div class = "comp pull-right">
        <a href = "LoginForm.html" style = "text-decoration:none;">Log In</a>
      </div>
      <div class = "comp pull-right">
        <a href = "Account.jsp" style = "text-decoration:none;">Sign Up</a>
      </div>
      <div class = "comp pull-right">
        <a href = "" style = "text-decoration:none;">About Us</a>
      </div>
    </nav>
  </header>
<div class = "header-banner">
  <h2>Create an Account</h2>
</div>

<form id = "Signup" method = "get" action="AccountSuccess">
<div class="container">
  <div class = "sign-up">
     <div class = "row">
      <label>Username:</label><input class = "textbox" type="text" name="username" required/>
     </div>
     <div class = "row">
      <label>Password:</label><input class = "textbox" type="password" name="password" required/>
    </div>
      <div class="row">
        <label>Email:</label><input class = "textbox" type="email" name="emailAddress" />
      </div>
	<div class = "row">
      <div id = "button">
        <input class="submit" id="submit" name="submit" type="submit" value="Submit">
      </div>
    </div>
    </div>
    </div>
</form>

<script type = "text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="jquery-ui.js"></script>
<script type = "text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
</body>
</html>