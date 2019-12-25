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
 try{
 Class.forName(driver);
 Connection con= DriverManager.getConnection(url,user,pwd);
 PreparedStatement psmt=con.prepareStatement("select * from member where username=?");
 psmt.setString(1,uname);
 ResultSet rs1=psmt.executeQuery();
 if(rs1.next()){
	 String pswd1=rs1.getString("password");
	 if(pswd.equals(pswd1)){
		 //request.setAttribute("username",uname);
		 String id=(String)rs1.getString("id");
		 session.setAttribute("id",id);
		 response.sendRedirect("MemberHome.jsp");
	 }
	 else{
		 response.sendRedirect("MemberLoginFail.jsp");
	 }
 }
 else{
	 response.sendRedirect("MemberLoginFail.jsp");	 
 }
 }
 catch(Exception e){
	 out.println(e);
 }
 %>