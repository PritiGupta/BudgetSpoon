<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
    prefix="fn" %>
<!DOCTYPE>
<html>

<head>
  <meta charset="utf-8">
  <title>BudgetSpoon</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
  <link href="jquery-ui.min.css" rel="stylesheet">
  <link href = "${pageContext.request.contextPath}/css/style.css" rel = "stylesheet">
</head>

<body>
  <header>
    <nav>
      <div class = "comp pull-left" id = "logo">
        <a href = "index.jsp" style = "text-decoration:none;" id = "BudgetSpoon">BudgetSpoon</a><br />
      </div>
      <c:if test="${username == null}">
      <div class = "comp pull-right">
        <a href = "LoginForm.html" style = "text-decoration:none;">Log In</a>
      </div>
      <div class = "comp pull-right">
        <a href = "Account.jsp" style = "text-decoration:none;">Sign Up</a>
      </div>
      </c:if>
      <c:if test="${username != null}">
      <div class = "comp pull-right">
        <a href = "LoginForm.html" style = "text-decoration:none;">Log Out</a>
      </div>
      <div class = "comp pull-right">
        <a href = "Account.jsp" style = "text-decoration:none;">Favorites</a>
      </div>
      </c:if>
      <div class = "comp pull-right">
        <a href = "" style = "text-decoration:none;">About Us</a>
      </div>
      
    </nav>
  </header>
  <div class="title">
    <h2>Find the perfect meal in Detroit for your budget</h3>
  </div>

    <form action = "search" id = "searchForm" method = "get">
    <div class="container">
      <!-- <h1>BudgetSpoon</h1>
      <h3>Find the perfect meal for your budget</h3> -->
      <div class="searchbox">
        <div class="row">
          <div class="col-md-3">
              
              <input class="priceSelect" type="text" name="price" pattern="^\d*(\.\d{2}$)?" size="4" placeholder ="Give A Budget$$" required/>
              
          </div>

          <div class="col-md-3">
            <select name="meal" required>
              <option selected disabled>Select meal</option>
              <option value="breakfast">Breakfast</option>
              <option value="lunch">Lunch</option>
              <option value="dinner">Dinner</option>
            </select>
          </div>

          <div class = "col-md-3">
            <select name = "numofdiners" id ="selectmenu" required>
              <option selected disabled>Number of Diners</option>
              <option value = "1">1</option>
              <option value = "2">2</option>
              <option value = "3">3</option>
              <option value = "4">4</option>
              <option value = "5">5</option>
            </select>
          </div>
          <div class="col-md-2" id="button">
            <input class="submit" id="submit" name="submit" type="submit" value="SEARCH">
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
  <script type = "text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
  

</body>

</html>
