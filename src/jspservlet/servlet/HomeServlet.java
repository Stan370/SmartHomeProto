

 package com.example;

 import java.io.IOException;
 import java.util.Enumeration;
 import java.util.HashMap;
 import java.util.Map;
 import java.util.concurrent.ExecutionException;
 import java.util.stream.Collectors;
 
 import javax.servlet.ServletException;
 import javax.servlet.annotation.WebServlet;
 import javax.servlet.http.HttpServlet;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;
 
 import org.slf4j.Logger;
 import org.slf4j.LoggerFactory;
 
 import com.google.actions.api.smarthome.SmartHomeApp;
 import com.google.auth.oauth2.GoogleCredentials;
 
 /**
  * Handles request received via HTTP POST and delegates it to your Actions app. See: [Request
  * handling in Google App
  * Engine](https://cloud.google.com/appengine/docs/standard/java/how-requests-are-handled).
  */
 @WebServlet(name = "smarthome", urlPatterns = "/smarthome")
 public class SmartHomeServlet extends HttpServlet {
   private static final Logger LOG = LoggerFactory.getLogger(MySmartHomeApp.class);
   private final SmartHomeApp actionsApp = new MySmartHomeApp();
 
   {
	 try {
	   GoogleCredentials credentials =
		   GoogleCredentials.fromStream(getClass().getResourceAsStream("/smart-home-key.json"));
	   actionsApp.setCredentials(credentials);
	 } catch (Exception e) {
	   LOG.error("couldn't load credentials");
	 }
   }
 
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse res)
	   throws IOException, ServletException {
	 String body = req.getReader().lines().collect(Collectors.joining());
	 LOG.info("doPost, body = {}", body);
	 Map<String, String> headerMap = getHeaderMap(req);
	 try {
	   String response = actionsApp.handleRequest(body, headerMap).get();
	   res.setStatus(HttpServletResponse.SC_OK);
	   res.setHeader("Access-Control-Allow-Origin", "*");
	   res.setContentType("application/json");
	   writeResponse(res, response);
	 } catch (ExecutionException | InterruptedException e) {
	   LOG.error("failed to handle fulfillment request", e);
	   throw new ServletException(e);
	 }
   }
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
	   throws IOException {
	 response.setContentType("text/plain");
	 response
		 .getWriter()
		 .println(
			 "ActionsServlet is listening but requires valid POST "
				 + "request to respond with Action response.");
   }
 
   private void writeResponse(HttpServletResponse res, String asJson) throws IOException {
	 System.out.println("response = " + asJson);
	 res.getWriter().write(asJson);
	 res.getWriter().flush();
   }
 
   private Map<String, String> getHeaderMap(HttpServletRequest req) {
	 Map<String, String> headerMap = new HashMap<>();
	 Enumeration headerNames = req.getHeaderNames();
	 while (headerNames.hasMoreElements()) {
	   String name = (String) headerNames.nextElement();
	   String val = req.getHeader(name);
	   headerMap.put(name, val);
	 }
	 return headerMap;
   }
 }