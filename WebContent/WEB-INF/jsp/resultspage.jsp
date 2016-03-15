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
  <link href="css/jquery-ui.min.css" rel="stylesheet">
  <link href="css/resultspage.css" type="text/css" rel="stylesheet" />
 <!--  The Google Maps API is a JavaScript library. It can be added to a web page with a <script> tag:-->
 
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDB8NwjBc0moypQd_PXWddjggTAS3Tbb_k"
  type="text/javascript"></script>
 
</head>

<body>
 <script>
        var geocoder;
          var map;
          var myData=[];
             function initialize() {
        	  console.log("init")
            geocoder = new google.maps.Geocoder();
            var latlng = new google.maps.LatLng(42.331429,-83.045753);
            var mapOptions = {
              zoom:15,
              center: latlng,
              mapTypeId: google.maps.MapTypeId.ROADMAP,
            }
            map = new google.maps.Map(document.getElementById("map"), mapOptions);
            
			for(var i =0; i<myData.length;i++){
            	codeAddress(myData[i]);
			}
                      
          }
                   google.maps.event.addDomListener(window, "load", initialize);
                  
                   function codeAddress(address) {
                	                 	   
                  		 geocoder.geocode( {'address': address}, function(results, status) {
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
//                   	  }
                    } 	  
        
       </script>

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
              <p>${restaurant.getCityAddress()}</p>
              <p>${restaurant.getStateAddress()}</p>
                     
                     </div>
                     <script>
                       myData.push('${restaurant.getStreetAddress()}'+","+'${restaurant.getCityAddress()}'+","+'${restaurant.getStateAddress()}') ;
                                          
                    </script> 
            <div class = "col-md-6" id = "prices">
                 
              <p>Breakfast Price:</p>
              <c:out value="${restaurant.getBreakfast_price() * numberofdiners}"/>
              <p>Lunch Price:</p>
              <c:out value="${restaurant.getLunch_price()* numberofdiners}" />
              <p>Dinner Price: </p>
             <c:out value="${restaurant.getDinner_price()* numberofdiners}"/>
            </div>
 
           </div>
          </li>
        </ol>
        </c:forEach>
        </section>
     
      <section>
     <div class="col-md-6" id  = "globe">
          <div id="map" style="width: 370px; height: 720px;"></div>
              </div>
              <script>
              
              </script>
                  </section>
            
</body>
</html>
