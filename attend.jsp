<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.sql.*,java.util.*,javax.servlet.*" %>
<%
String driver=application.getInitParameter("driver");
String url=application.getInitParameter("url");
String user=application.getInitParameter("user");
String pwd=application.getInitParameter("pwd");

Class.forName(driver);
Connection con= DriverManager.getConnection(url,user,pwd);
 PreparedStatement psmt=con.prepareStatement("select * from event");
 ResultSet rs=psmt.executeQuery();
while(rs.next()){
	String n1=String.valueOf(rs.getInt("id"));
	String att=request.getParameter(String.valueOf(rs.getInt("id")));
	PreparedStatement psmt1=con.prepareStatement("update event set attendance=? where id=? ");
	psmt1.setString(1,att);
	psmt1.setString(2,n1);
	int n=psmt1.executeUpdate();
	if(n>0){
		%><script>
		  alert("Attendance successfully uploaded");
		  window.location = "LeaderHome.jsp";
		</script><%
	}
	else{
		%><script>
		  alert("Failed to upload Attendance");
		  window.location = "LeaderHome.jsp";
		</script><%
	}
}


%>