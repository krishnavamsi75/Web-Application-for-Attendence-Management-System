<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.io.*" %>
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
<body>
<% 
String driver=application.getInitParameter("driver");
String url=application.getInitParameter("url");
String user=application.getInitParameter("user");
String pwd=application.getInitParameter("pwd");

Class.forName(driver);
Connection con= DriverManager.getConnection(url,user,pwd);
PreparedStatement psmt=con.prepareStatement("select * from event");
ResultSet rs=psmt.executeQuery();
%>
<br><
\br><br><br><br><br>
<table align="center"" cellspacing=10>
<tr>
    <th>ID</th>
    <th>Attendance</th>
</tr>
<%
while(rs.next()){
%>
  
  <tr>
    <td><%=rs.getInt("id") %></td>
    <td><%=rs.getString("attendance") %></td>
  </tr>

<%
}
%>
</table>
<table align="right"><td><button align="right"><a href="LeaderHome.jsp">Return to Home</a></button></td></table>
</body>