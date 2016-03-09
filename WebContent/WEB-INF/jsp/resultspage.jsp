<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>

<head>
  <meta charset="utf-8">
  <title>BudgetSpoon</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
  <link href="jquery-ui.min.css" rel="stylesheet">
  <link href="resultspage.css" type="text/css" rel="stylesheet" />
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
    <h3>Pick a Place to Eat</h3>
      <h4>Where would you like to eat?</h4>
  </div>
    <!-- <div class = "container"> -->
    <table class = "table">
      <thead>
        <tr>
          <td>Restaurant</td>
          <td>Cuisine</td>
          <td>Address</td>
        <!--   <td>Price Range</td>  -->
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${restList}" var="restaurant">
        <tr>
          <td>${restaurant.getName()}</td>
          <td>${restaurant.getCuisine()}</td>
          <td>${restaurant.getAddress()}</td>
        <!--   <td>3223 Tuscarora Drive</td>
          <td>$10-20</td>  -->
        </tr>
        </c:forEach>
          <!-- <td><img src = "happy's_pizza.jpg"></td>
          <td>Happy's Pizza</td>
          <td><p>Italian</p><p>Pizza</p></td>
          <td>343 Woodward Avenue</td>
          <td>$20-30</td>
        </tr>  -->
      </tbody>

    </table>
    <!-- </div> -->
</body>
</html>
