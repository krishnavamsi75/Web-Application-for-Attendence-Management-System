<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*, java.sql.*" %>
<% 
String driver=application.getInitParameter("driver");
 String url=application.getInitParameter("url");
 String user=application.getInitParameter("user");
 String pwd=application.getInitParameter("pwd");
 
 String uname= request.getParameter("username");
 String pswd= request.getParameter("password");
 
 Class.forName(driver);
 Connection con= DriverManager.getConnection(url,user,pwd);
 PreparedStatement psmt=con.prepareStatement("select * from leader where id=? or username=? or emailid=? or mobile=?");
 psmt.setString(1,uname);
 psmt.setString(2,uname);
 psmt.setString(3,uname);
 psmt.setString(4,uname);
 ResultSet rs=psmt.executeQuery();
 if(rs.next()){
	 String pswd1=rs.getString("password");
	 
	 if(pswd.equals(pswd1)){
		 String id=(String)rs.getString("id");
		 session.setAttribute("id",id);
		 response.sendRedirect("LeaderHome.jsp");
	 }
	 else{
		 response.sendRedirect("LeaderLoginFail.jsp");
	 }
 }
 else{
	 response.sendRedirect("LeaderLoginFail.jsp");	 
 }
 %>