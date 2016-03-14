<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>

<head>
  <meta charset="utf-8">
  <title>BudgetSpoon</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
  <link href="css/jquery-ui.min.css" rel="stylesheet">
  <link href="css/resultspage.css" type="text/css" rel="stylesheet" />
 <!--  The Google Maps API is a JavaScript library. It can be added to a web page with a <script> tag:-->
 <script src="http://maps.googleapis.com/maps/api/js"></script> 
</head>

<body onload="initialize()">

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
  
    <section class = "search-results-container">
        <c:forEach items="${restList}" var="restaurant">
        <ol id = "search-list">
          <li class = "search-result-li">
            <div class = "row">
              <div class = "col-md-6" id = "restaurant">
              <h3><a href = "${restaurant.getWebsite()}">${restaurant.getName()}</a></h3>
              <p>${restaurant.getCuisine()}</p>
              <p>${restaurant.getStreetAddress()}</p>
            </div>
            <div class = "col-md-6" id = "prices">
              <p>Breakfast Price: ${restaurant.getBreakfast_price()}</p>
              <p>Lunch Price: ${restaurant.getLunch_price()}</p>
              <p>Dinner Price: ${restaurant.getDinner_price()}</p>
            </div>
            <div class="row" id  = "globe">
          <div id="map" style="width: 420px; height: 220px;" ></div>
              </div>
               <div class="row">
     <input id="address" type="textbox" value="Detroit,MI">
     <input type="button" value="Maps" onclick="codeAddress()">
   </div>
          </div>
          </li>
        </ol>
        </c:forEach>
      </section>


    <!-- <div class = "container"> -->
    
    
<%--     <table class = "table">
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
          <td>${restaurant.getStreetAddress()}</td>
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

    </table> --%>
    
		
    
         <script>
        var geocoder;
          var map;
          function initialize() {
            geocoder = new google.maps.Geocoder();
            var latlng = new google.maps.LatLng(42.331429,-83.045753);
            var mapOptions = {
              zoom:10,
              center: latlng
            }
            map = new google.maps.Map(document.getElementById("map"), mapOptions);
          }

          function codeAddress() {
            var address = document.getElementById("address").value;
            geocoder.geocode( { 'address': address}, function(results, status) {
              if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
              } else {
                alert("Geocode was not successful for the following reason: " + status);
              }
            });
          }

       </script>
   
   
   
</body>
</html>
