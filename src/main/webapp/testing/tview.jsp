<%--
  Created by IntelliJ IDEA.
  User:
  Date: 21-08-2023
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.lang.*" language="java" %>
<%@ page import="java.sql.*" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    try {
        String connectionURL = "jdbc:mysql://localhost:3306/test";
        Class.forName("com.mysql.jdbc.Driver");


        Connection connection = DriverManager.getConnection(connectionURL, "testUser", "Ripple#Xrp");

        if(!connection.isClosed())
%>
<font size="+3" color="green"></b>
    <%
        out.println("Successfully connected to " + "MySQL server using TCP/IP...");
        Statement st = connection.createStatement();
//      String query="insert into test.users values('"+firstName+"','"+lastName+"','"+email+"','"+password+"','"+gender+"','"+age+"','"+skills+"','"+aspirations+"','"+experience+"','"+username+"');";
        String query="select * from test.users";
        ResultSet rs= st.executeQuery(query);
        out.println("<center><h2>Users</h2></center>");
        out.println("<center>");
        out.println("<table border=1>");
        out.println("<tr>");
        out.println("<th>Username</th>");
        out.println("<th>First Name</th>");
        out.println("<th>Last Name</th>");
        out.println("<th>Email</th>");
        out.println("<th>Age</th>");
        out.println("<th>gender</th>");
        out.println("<th>Skills</th>");
        out.println("<th>Aspirations</th>");
        out.println("<th>Experience</th>");

        out.println("</tr>");
        while (rs.next()){
            String firstName=rs.getString("firstName");
            String lastName=rs.getString("lastName");
            String email=rs.getString("email");
            String password=rs.getString("password");
            String age=rs.getString("age");
            String gender=rs.getString("gender");
            String skills=rs.getString("skills");
            String aspirations=rs.getString("aspirations");
            String experience=rs.getString("experience");
            String username=rs.getString("username");
//            print content in tables in table form

            out.println("<tr><td>"+username+"</td><td>"+firstName+"</td><td>"+lastName+"</td><td>"+email+"</td><td>"+gender+"</td><td>"+age+"</td><td>"+skills+"</td><td>"+aspirations+"</td><td>"+experience+"</td></tr>");
        }
        out.println("</table>");
        out.println("</center>");

        connection.close();
    }
    catch(Exception ex){
    %>
</font>
<font size="+3" color="red"></b>
        <%
out.println("Unable to connect to database.");
out.println("Exception Message :" + ex.getMessage());
}
%>
</font>

</body>
</html>
