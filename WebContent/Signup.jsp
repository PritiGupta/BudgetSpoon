<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/css/sign-up.css" type = "text/css" rel = "stylesheet" />
</head>

<body>
  <header>
    <nav>
      <div class = "comp pull-left" id = "logo">
        <a href = "" style = "text-decoration:none;" id = "BudgetSpoon">BudgetSpoon</a><br />
      </div>
      <div class = "comp pull-right">
        <a href = "" style = "text-decoration:none;">Log In</a>
      </div>
      <div class = "comp pull-right">
        <a href = "" style = "text-decoration:none;">Sign Up</a>
      </div>
      <div class = "comp pull-right">
        <a href = "" style = "text-decoration:none;">About Us</a>
      </div>
    </nav>
  </header>

  <div class = "header-banner">
    <h2>Create a Profile</h2>
      <h4>Where would you like to eat?</h4>
  </div>

  <div class="title">
    <h2>New Restaurant Sign Up</h2>
  </div>

    <form id = "Signup" method = "get" action="Signupsuccess">
    <div class="container">
    	<div class = "sign-up">
         <div class = "row">
          <label>Restaurant:</label><input class = "textbox" type="text" name="name" required/>
          <label>Password:</label><input class = "textbox" type="password" name="password" required/>
        </div>
        <div class = "row">
             <label>Address:</label><input class = "textbox" type="text" name="address" />
             <label>Zip Code:</label><input class = "textbox" id = "zip" type="text" name="address2" />
          </div>
          <div class="row">
            <label>Email:</label><input class = "textbox" type="email" name="emailAddress" />
            <label>Website:</label><input class = "textbox" type="url" name="website" />
          </div>

        <div class = "row">
             <label>Cuisine:</label><input class = "textbox" type="text" name="cuisine">
        </div>

        <div class="row">
             <label>Average Breakfast Price:</label><input class = "textbox" id = "prices" type="number" name="breakfast_price" maxlength=5 step="0.1">
             <label>Average Lunch Price:</label><input class = "textbox" id = "prices" type="number" name="lunch_price" maxlength=5>
             <label>Average Dinner Price:</label><input class = "textbox" id = "prices" type="number" name="dinner_price" maxlength=5>
        </div>
      </div>

  <div class = "row">
          <div id = "button">
            <input class="submit" id="submit" name="submit" type="submit" value="Submit">
          </div>
        </div>
        </div>
  </form>

  <script type = "text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
  <script src="jquery-ui.js"></script>
  <script type = "text/javascript" src="script.js"></script>

</body>
</html>

  <script type = "text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
  <script src="jquery-ui.js"></script>
  <script type = "text/javascript" src="script.js"></script>



</body>
</html>

</body>
</html>