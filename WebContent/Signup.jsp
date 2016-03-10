<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<header>
    <nav>
      <div class = "comp pull-left" id = "logo">
        <a href = "" style = "text-decoration:none;" id = "BudgetSpoon">BudgetSpoon</a><br />
      <!-- </div>
      <div class = "comp pull-right">
        <a href = "" style = "text-decoration:none;">Log In</a>
      </div>
      <div class = "comp pull-right">
        <a href = "Signup.jsp" style = "text-decoration:none;">Sign Up</a>
      </div>
      <div class = "comp pull-right">
        <a href = "" style = "text-decoration:none;">About Us</a>
      </div>
      <ul>
        <li>BudgetSpoon</li>
        <li>About Us</li>
        <li>Log In</li>
        <li>Sign Up</li>
      </ul> -->
    </nav>
  </header>
  <div class="title">
    <h2>Find the perfect meal in Detroit for your budget</h3>
  </div>

    <form id = "Signup" method = "get" action="Signupsuccess"> 
    <div class="container">
         <h3>New Restaurant SignUp</h3>
         Restaurant Name: <input type="text" name="name" required/> 
            Password: <input type="password" name="password" required/>
        <div class="row">
          <div class="col-md-3">
             Restaurant Address<br>
             Street:<input type="text" name="address" />
<!--             Street:<input type="text" name="address1" /> -->
<!--             City:<input type="text" name="address2" /> -->
<!--             Zip:<input type="text" name="address3" /> -->
          </div>
          <div class="row">
          <div class="col-md-3">
            Contact Email:<input type="text" name="emailAddress" /> 
            Restaurant website:<input type="text" name="website" />     
            </div>
          </div>
          <div class = "col-md-3">
            
          </div>
          
        <div class = "row">
        <div class="col-md-2" id="button">
             Cuisine Type: <input type="text" name="cuisine">
          </div>
      </div>
      <div class="searchbox">
        <div class="row">
          <div class="col-md-3">
             Average Breakfast Price: <input type="text" name="breakfast_price" maxlength=5>
              Average Lunch Price: <input type="text" name="lunch_price" maxlength=5>
              Average Dinner Price: <input type="text" name="dinner_price" maxlength=5>
          </div>
     
  </div>
  </div>
  
  <div class = "row">
          <div class="col-md-2" id="button">
           <div class = "comp pull-right">
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