<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <table align="right" cellspacing=10>
   <tr>
     <td><a href="Attendance.jsp"> Attendance</a></td>
     <td><a href="ChangePassword.jsp"> Change Password</a></td>
     <td><a href="Register.jsp">Attendance Register</a></td>
     <td><a href="team_leader_login.html"> Logout</a></td>
   </tr>
</table> <br><br><br><br><br>
<%@ page import="java.sql.*" %>
<style>
   body{
                background-image:url("https://bit.ly/2KoWrC9");
                background-position: center;
                background-repeat: repeat;
                background-size: cover;
                height: 100%;
            }
        a{
            text-decoration: none;
          }

</style>
<% 
String driver=application.getInitParameter("driver");
String url=application.getInitParameter("url");
String user=application.getInitParameter("user");
String pwd=application.getInitParameter("pwd");

Class.forName(driver);
Connection con= DriverManager.getConnection(url,user,pwd);
PreparedStatement psmt=con.prepareStatement("select * from member");
ResultSet rs=psmt.executeQuery();
%>
<body>
<form name="attendance" method="post" action="attend.jsp">
<table align="center" cellspacing=10>
<tr>
    <th>ID</th>
    <th>Present</th>
    <th>Absent</th>
</tr>
<%
while(rs.next()){
%>
  
  <tr>
    <td><%=rs.getInt(1) %></td>
    <td><input type="radio" name="<%=rs.getInt(1)%>" value="Present"></td>
    <td><input type="radio" name="<%=rs.getInt(1)%>" value="Absent"></td>
  </tr>

<%
}
%>
</table>
<table align="center">
   <tr>
     <td><input type="submit" value="submit"></td>
  </tr>
</table>
</form>
<table align="right"><td><button align="right"><a href="LeaderHome.jsp">Return to Home</a></button></td></table>
</body>