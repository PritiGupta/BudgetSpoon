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

<body >
  
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
             <label>Street Address:</label><input class = "textbox" type="text" name="streetAddress" />
             <label>City:</label><input class = "textbox" type="text" name="cityAddress" />
        </div>
        <div class = "row">
             <label>State:</label>
               <select id ="states" name ="stateAddress">
                <option value="AL">AL</option>
               	<option value="AK">AK</option>
               	<option value="AZ">AZ</option>
               	<option value="AR">AR</option>
               	<option value="CA">CA</option>
               	<option value="CO">CO</option>
               	<option value="CT">CT</option>
               	<option value="DE">DE</option>
               	<option value="DC">DC</option>
               	<option value="FL">FL</option>
               	<option value="GA">GA</option>
               	<option value="HI">HI</option>
               	<option value="ID">ID</option>
               	<option value="IL">IL</option>
               	<option value="IN">IN</option>
               	<option value="IA">IA</option>
               	<option value="KS">KS</option>
               	<option value="KY">KY</option>
               	<option value="LA">LA</option>
               	<option value="ME">ME</option>
               	<option value="MD">MD</option>
               	<option value="MA">MA</option>
               	<option value="MI">MI</option>
               	<option value="MN">MN</option>
               	<option value="MS">MS</option>
               	<option value="MO">MO</option>
               	<option value="MT">MT</option>
               	<option value="NE">NE</option>
               	<option value="NV">NV</option>
               	<option value="NH">NH</option>
               	<option value="NJ">NJ</option>
               	<option value="NM">NM</option>
               	<option value="NY">NY</option>
               	<option value="NC">NC</option>
               	<option value="ND">ND</option>
               	<option value="OH">OH</option>
               	<option value="OK">OK</option>
               	<option value="OR">OR</option>
               	<option value="PA">PA</option>
               	<option value="RI">RI</option>
               	<option value="SC">SC</option>
               	<option value="SD">SD</option>
               	<option value="TN">TN</option>
               	<option value="TX">TX</option>
               	<option value="UT">UT</option>
               	<option value="VT">VT</option>
               	<option value="VA">VA</option>
               	<option value="WA">WA</option>
               	<option value="WV">WV</option>
               	<option value="WI">WI</option>
               	<option value="WY">WY</option>
</select>

             <label>Zip Code:</label><input class = "textbox" id = "zip" type="text" name="zipcodeAddress" />
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
             <label>Average Lunch Price:</label><input class = "textbox" id = "prices" type="number" name="lunch_price" maxlength=5 step="0.01">
             <label>Average Dinner Price:</label><input class = "textbox" id = "prices" type="number" name="dinner_price" maxlength=5 step="0.01" >
        </div>
      <div class ="row">
          <div id = "button">
            <input class="submit" id="submit" name="submit" type="submit" value="Submit">
          </div>
      </div>
        </div>
        </div>

  
  </form>

  <script type = "text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
  <script src="jquery-ui.js"></script>
  <script type = "text/javascript" src="script.js"></script>
  <script type = "text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>



</body>
</html>
