<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*, java.sql.*" %>
<% 
String driver=application.getInitParameter("driver");
String url=application.getInitParameter("url");
String user=application.getInitParameter("user");
String pwd=application.getInitParameter("pwd");

String id= request.getParameter("id");
String firstname= request.getParameter("firstname");
String lastname= request.getParameter("lastname");
String dob= request.getParameter("dob");
String emailid= request.getParameter("email");
String phone= request.getParameter("phone");
String username= request.getParameter("username");
String password= request.getParameter("password");

Class.forName(driver);
Connection con= DriverManager.getConnection(url,user,pwd);
PreparedStatement psmt=con.prepareStatement("insert into member values(?,?,?,?,?,?,?,?)");
psmt.setString(1,id);
psmt.setString(2,firstname);
psmt.setString(3,lastname);
psmt.setString(4,dob);
psmt.setString(5,emailid);
psmt.setString(6,phone);
psmt.setString(7,username);
psmt.setString(8,password);

psmt.executeUpdate();

PreparedStatement psmt1=con.prepareStatement("insert into event values(?,?)");
psmt1.setString(1,id);
psmt1.setString(2,null);
psmt1.executeUpdate();
response.sendRedirect("SignedUp.jsp");
%>