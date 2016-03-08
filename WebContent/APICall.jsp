<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.apache.http.*" %>
<%@ page import="org.apache.http.client.methods.HttpGet" %>
<%@ page import="org.apache.http.impl.client.DefaultHttpClient" %>
<%@ page import="org.apache.http.util.EntityUtils" %>
<%@ page import="org.json.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	

	
	DefaultHttpClient httpclient = new DefaultHttpClient();

	
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
		//System.out.println(rests.getJSONObject(i).getJSONObject("restaurant").getJSONObject("location").getString("locality"));
		//int zipcode = rests.getJSONObject(i).getJSONObject("restaurant").getJSONObject("location").getInt("zipcode");
		
		//if(zipcode == 48216 || zipcode == 48226 || zipcode == 48201 || zipcode == 48233 || zipcode == 48243 || zipcode == 48202 || zipcode == 48208 || zipcode == 48207) {
			int restId = rests.getJSONObject(i).getJSONObject("restaurant").getInt("id");
			String restName = rests.getJSONObject(i).getJSONObject("restaurant").getString("name");
			String restAddress = rests.getJSONObject(i).getJSONObject("restaurant").getJSONObject("location").getString("address");
			String restCuisine = (rests.getJSONObject(i).getJSONObject("restaurant").getString("cuisines"));
			//System.out.println(rests.getJSONObject(i).getJSONObject("restaurant").getJSONObject("location").getInt("zipcode"));
			
			System.out.println(restId);
			System.out.println(restName);
			System.out.println(restAddress);
			System.out.println(restCuisine);
			System.out.println(c+i);
			System.out.println();
		//}
	}
	}
	
	
	
	
%>


</body>
</html>