<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 

String driver=application.getInitParameter("driver");
String url=application.getInitParameter("url");
String user=application.getInitParameter("user");
String pwd=application.getInitParameter("pwd");


   String password=request.getParameter("pwd");
   String id = (String)session.getAttribute("id");
  
   
   Class.forName(driver);
   Connection con= DriverManager.getConnection(url,user,pwd);
   PreparedStatement psmt=con.prepareStatement("update leader set password=? where id=?");
   psmt.setString(1,password);
   psmt.setString(2,id);
   
   psmt.executeUpdate();
   %>
   
   <script type="text/javascript">
     alert("password Updated Successfully...!")
     window.location = "LeaderHome.jsp";
</script>