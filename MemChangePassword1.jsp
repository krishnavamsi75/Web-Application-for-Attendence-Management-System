<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.io.*" %>
<% 

String driver=application.getInitParameter("driver");
String url=application.getInitParameter("url");
String user=application.getInitParameter("user");
String pwd=application.getInitParameter("pwd");


   String password=request.getParameter("pwd");
   String id =(String)session.getAttribute("id");
   Class.forName(driver);
   Connection con= DriverManager.getConnection(url,user,pwd);
   PreparedStatement psmt=con.prepareStatement("update member set password=? where id=?");
   psmt.setString(1,password);
   psmt.setString(2,id);
   
   psmt.executeUpdate();
   
   %>
   <script type="text/javascript">
     alert("password Updated Successfully...!")
     window.location = "MemberHome.jsp";
</script>
   
