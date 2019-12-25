<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.sql.*,java.util.*,javax.servlet.*" %>
    <%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String driver=application.getInitParameter("driver");
String url=application.getInitParameter("url");
String user=application.getInitParameter("user");
String pwd=application.getInitParameter("pwd");

Class.forName(driver);
Connection con= DriverManager.getConnection(url,user,pwd);
String pattern = "dd-MM-yyyy";
SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

String date = simpleDateFormat.format(new Date());

Statement stmt=con.createStatement();
String query="alter table event add date1 varchar(100) default null";
stmt.executeUpdate(query);
 
 PreparedStatement psmt=con.prepareStatement("select * from event");
 ResultSet rs=psmt.executeQuery();
while(rs.next()){
	String n1=String.valueOf(rs.getInt("id"));
	String att=request.getParameter(String.valueOf(rs.getInt("id")));
	PreparedStatement psmt2=con.prepareStatement("update event set attendance=? where id=? ");
	psmt2.setString(1,att);
	psmt2.setString(2,n1);
	psmt2.executeUpdate();
}

%>