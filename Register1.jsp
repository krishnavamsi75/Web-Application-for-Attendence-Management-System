<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.io.*" %>
<% 
String driver=application.getInitParameter("driver");
String url=application.getInitParameter("url");
String user=application.getInitParameter("user");
String pwd=application.getInitParameter("pwd");

String id=(String)session.getAttribute("id");

Class.forName(driver);
Connection con= DriverManager.getConnection(url,user,pwd);
PreparedStatement psmt=con.prepareStatement("select * from event where id=?");
psmt.setString(1, id);
ResultSet rs=psmt.executeQuery();
if(rs.next()){
	String att=rs.getString("attendance");
	out.println("you are "+att);
}
%>
<br><br>
<table align="right">
<td><button align="right">
<a href="MemberHome.jsp">Return to Home</a>
</button></td>
</table>