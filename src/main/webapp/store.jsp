<%@ page import="java.lang.*" language="java" %>
<%@ page import="java.sql.*" language="java" %>
<%@ page import="com.mysql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Connection with mysql database</title>
</head>
<body>
<h1>Connection status </h1>
<%
    String firstName=request.getParameter("firstName");
    String lastName=request.getParameter("lastName");
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String gender=request.getParameter("gender");
    String age=request.getParameter("age");
    String skills=request.getParameter("skills");
    String aspirations=request.getParameter("aspirations");
    String experience=request.getParameter("experience");
    String username=request.getParameter("username");

%>
<%
    try {
        String connectionURL = "jdbc:mysql://localhost:3306/test";
        Class.forName("com.mysql.jdbc.Driver");


        Connection connection = DriverManager.getConnection(connectionURL, "root", "MyNewPass");

        if(!connection.isClosed())
%>
<font size="+3" color="green"></b>
    <%
        out.println("Successfully connected to " + "MySQL server using TCP/IP...");
        Statement st = connection.createStatement();
        String query="insert into test.users values('"+firstName+"','"+lastName+"','"+email+"','"+password+"','"+gender+"','"+age+"','"+skills+"','"+aspirations+"','"+experience+"','"+username+"');";
        st.executeUpdate(query);
        response.sendRedirect("view.jsp");
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
<script type="text/javascript">
</script>
</body>
</html>
