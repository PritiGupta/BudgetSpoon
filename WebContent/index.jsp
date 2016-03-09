<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>

<head>
  <meta charset="utf-8">
  <title>BudgetSpoon</title>
  <link href="style.css" type="text/css" rel="stylesheet" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
  <link href="jquery-ui.min.css" rel="stylesheet">
</head>

<body>
  <header>
    <nav>
      <div class = "comp pull-left" id = "logo">
        <a href = "" style = "text-decoration:none;" id = "BudgetSpoon">BudgetSpoon</a><br />
      </div>
      <div class = "comp pull-right">
        <a href = "LoginForm.jsp" style = "text-decoration:none;">Log In</a>
      </div>
      <div class = "comp pull-right">
        <a href = "Signup.jsp" style = "text-decoration:none;">Sign Up</a>
      </div>
      <div class = "comp pull-right">
        <a href = "" style = "text-decoration:none;">About Us</a>
      </div>
      <!-- <ul>
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

    <form action = "search
" id = "searchForm" method = "get">
    <div class="container">
      <!-- <h1>BudgetSpoon</h1>
      <h3>Find the perfect meal for your budget</h3> -->
      <div class="searchbox">
        <div class="row">
          <div class="col-md-3">
              <select name="price">
                <option selected disabled>Select price range</option>
                <option value="$10-20">$10-20</option>
                <option value="$20-30">$20-30</option>
                <option value="$30-40">$30-40</option>
                <option value="$50-60">$50-60</option>
              </select>
          </div>

          <div class="col-md-3">
            <select name="meal">
              <option selected disabled>Select meal</option>
              <option value="breakfast">Breakfast</option>
              <option value="lunch">Lunch</option>
              <option value="dinner">Dinner</option>
            </select>
          </div>

          <div class = "col-md-3">
            <select name = "Cuisine" id ="selectmenu">
              <option selected disabled>Cuisine</option>
              <option value = "American">American</option>
              <option value = "Asian">Asian</option>
              <option value = "Mexican">Mexican</option>
              <option value = "French">French</option>
              <option value = "South American">South American</option>
            </select>
          </div>
          <div class="col-md-2" id="button">
            <input class="submit" id="submit" name="submit" type="submit" value="SEARCH">
          </div>
        </div>
        <div class = "row">
        <div id="searchInContainer">
          <label>Includes:</label><input type="checkbox" name="activity" value="Appetizers" id = "Appetizers" />
            <label for = "Appetizers" id = "course">Appetizers</label>
          <input type="checkbox" name="activity" value="Drinks" id = "Drinks" />
            <label for = "Drinks" id = "courseType">Drinks</label>
          <input type="checkbox" name="activity" value="Entrees" id = "Entrees" />
          <label for = "Entrees" id = "courseType">Entrees</label>
          <input type="checkbox" name="activity" value="Desserts" id = "Deserts"/>
          <label for = "Desserts" id = "courseType">Desserts</label>
        </div>
      </div>
      </div>
      </div>
      </form>

  </div>

</div>
  <script type = "text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
  <script src="jquery-ui.js"></script>
  <script type = "text/javascript" src="script.js"></script>

</body>

</html>
