<%@page import="com.BudgetSpoon.dao.RestaurantDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.BudgetSpoon.controller.Restaurants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.apache.http.*" %>
<%@ page import="org.apache.http.client.methods.HttpGet" %>
<%@ page import="org.apache.http.impl.client.DefaultHttpClient" %>
<%@ page import="org.apache.http.util.EntityUtils" %>
<%@ page import="org.json.*" %>
<%@ page import="com.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	DefaultHttpClient httpclient = new DefaultHttpClient();
	
	RestaurantDao restDao = new RestaurantDao();
	ArrayList<Restaurants> addRests = new ArrayList<Restaurants>();
	
	for (int c = 0; c <= 80; c += 20) {
		HttpGet search = new HttpGet("https://developers.zomato.com/api/v2.1/search?q=48226&start="+c);
		search.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");
		search.setHeader("user-key", "abb7b97a85c11187d156105e6f3e77dc");
	
		HttpResponse resp = httpclient.execute(search);
	
		String results = EntityUtils.toString(resp.getEntity());
		out.print(results);
	
	
		JSONObject jsonResult = new JSONObject(results);
		JSONArray rests = jsonResult.getJSONArray("restaurants");
		
		for(int i = 0; i < rests.length(); i++) {
			int restId = rests.getJSONObject(i).getJSONObject("restaurant").getInt("id");
			String restName = rests.getJSONObject(i).getJSONObject("restaurant").getString("name");
			String restAddress = rests.getJSONObject(i).getJSONObject("restaurant").getJSONObject("location").getString("address");
			String restCuisine = (rests.getJSONObject(i).getJSONObject("restaurant").getString("cuisines"));
			
			addRests.add(new Restaurants(restId, restName, restAddress, restCuisine));
		}
	}
	
	restDao.addRestaurants(addRests);
%>


</body>
</html>