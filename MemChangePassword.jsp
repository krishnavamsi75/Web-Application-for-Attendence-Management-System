<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Password</title>
</head>
<body>
<br><br><br><br><br>
  <form action="MemChangePassword1.jsp" method="post">
      <table align="center" cellspacing=10>
         <!--  <tr>
           <td>Id:</td>
           <td><input type="text" name="id" required></td>
         </tr> -->
         <tr>
           <td>New Password:</td>
           <td><input type="text" name="pwd" required></td>
         </tr>
         
         <tr>
           <td></td>
           <td><input type="submit" value="submit"></td>
         </tr>
      </table>
  </form>
</body>
</html>