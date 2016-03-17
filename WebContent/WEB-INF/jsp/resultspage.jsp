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
        
          var contentString=[];
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
			
				codeAddress(myData[i][0],myData[i][1],myData[i][2]);
            	
			}
             
           }
                   google.maps.event.addDomListener(window, "load", initialize);
             
                   function codeAddress(address,name,url) {
                	                 	   
                  		 geocoder.geocode( {'address': address}, function(results, status) {
                  	     if (status == google.maps.GeocoderStatus.OK) {
                  	        	    
                          map.setCenter(results[0].geometry.location);
                          
                         var infowindow = new google.maps.InfoWindow({
                        	 content:'<a href="' + url + '">' + name + '</a><br/>' + address
                    			
                    		   });
                         
                         
                          var marker = new google.maps.Marker({
                              map: map,
                              position: results[0].geometry.location,
                              title:name
                          });
                          
                      //    marker.setContent(contentString);
                          marker.addListener('click', function() {
                        	 
                        	    infowindow.open(map, marker);
                        	    
                        	  });
                          
                         } else {
                          alert("Geocode was not successful for the following reason: " + status);
                        }
                  	  	   });
                     }  
             
       </script>

  <header>
    <nav>
      <div class = "comp pull-left" id = "logo">
        <a href = "index.html" style = "text-decoration:none;" id = "BudgetSpoon">BudgetSpoon</a><br />
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
        <a href = "userLogout.html" style = "text-decoration:none;">Log Out</a>
      </div>
      <div class = "comp pull-right">
        <a href = "userFavorites.html" style = "text-decoration:none;">Favorites</a>
      </div>
      </c:if>
      <div class = "comp pull-right">
        <a href = "" style = "text-decoration:none;">About Us</a>
      </div>
    </nav>
  </header>

  <div class = "header-banner">
    <h3>Pick a Place to Eat</h3>
      <h4>Where would you like to eat today?</h4>
  </div>
  
    <section class = "search-results-container">
    	<div class = "row" id = "view">
    	<div class = "col-md-6" id = "results">
        <ol id = "search-list">
        <c:forEach items="${restList}" var="restaurant">
          <li class = "search-result-li">
            <div class = "row">
              <div class = "col-md-6" id = "restaurant">
              <h3><a href = "${restaurant.getWebsite()}">${restaurant.getName()}</a></h3>
              <p>${restaurant.getCuisine()}</p>
              <p>${restaurant.getStreetAddress()}</p>
              <p>${restaurant.getCityAddress()}, ${restaurant.getStateAddress()}. ${restaurant.getZipcodeAddress()}</p>
              
               </div>
                     <script>
                       myData.push(["${restaurant.getStreetAddress()}"+","+"${restaurant.getCityAddress()}"+","+"${restaurant.getStateAddress()}"+","+"${restaurant.getZipcodeAddress()}","${restaurant.getName()}","${restaurant.getWebsite()}"]);
                                        
                    </script> 
                    <script>
                    
                    
                    </script>
            <div class = "col-md-6" id = "prices"> 
             <c:choose>
           
           
            <c:when test="${mealChoice == 'breakfast'}">
	          <p>Breakfast Price: $<c:out value="${restaurant.getBreakfast_price()* numberofdiners}" /></p>
            </c:when> 
            <c:when test="${mealChoice == 'lunch'}">
	          <p>Lunch Price: $<c:out value="${restaurant.getLunch_price()* numberofdiners}" /></p>
            </c:when>
            <c:when test="${mealChoice == 'dinner'}">
	          <p>Dinner Price: $<c:out value="${restaurant.getDinner_price()* numberofdiners}" /></p>
            </c:when>
            

	            
            </c:choose>
            <c:if test="${username != null}">
            <form action="addFavorite" method="get">
            	<input type="hidden" name="favorite" value=${restaurant.getId() }>
            	<input type="image" id = "myimage" src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjMycHgiIGhlaWdodD0iMzJweCIgdmlld0JveD0iMCAwIDk0LjY0NiA5NC42NDYiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDk0LjY0NiA5NC42NDY7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4KPGc+Cgk8cGF0aCBkPSJNNjEuOTksMjVjMC0xMi4wMTItNi41NjYtMjUtMTQuNjY3LTI1Yy04LjEwMSwwLTE0LjY2NywxMi45ODgtMTQuNjY3LDI1YzAsMTAuNDYzLDQuOTg0LDE2LjczMSwxMS42MjMsMTguMTc0ICAgYy0xLjE0MSw5Ljg1Ny0xLjg3MywyMy42NDEtMS44NzMsMzMuODA1YzAsMTcuNjI3LDIuMjAxLDE3LjY2Niw0LjkxNywxNy42NjZzNC45MTctMC4wMzksNC45MTctMTcuNjY2ICAgYzAtMTAuMTY0LTAuNzMyLTIzLjk0Ny0xLjg3My0zMy44MDVDNTcuMDA1LDQxLjczMSw2MS45OSwzNS40NjMsNjEuOTksMjV6IiBmaWxsPSIjMDAwMDAwIi8+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPC9zdmc+Cg==" value="favorite">
            </form>
            </c:if>
            </div>
            </div>
          </li>
          </c:forEach>
        </ol>
        </div>
        <div class="col-md-6" id  = "globe">
          	<div id="map" style="width: 100%; height: 100%;"></div>
     	</div>
              <script>
              
              </script>
        
        </div>
    </section>
            
</body>
</html>
