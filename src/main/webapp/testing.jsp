<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.cj.*" %>
<%@page import="com.mysql.jdbc.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MySQL Connection Test</title>
</head>
<body>
<h1>MySQL Connection Test</h1>

<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/test";
    String dbUsername = "root";
    String dbPassword = "MyNewPass";

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the database connection
        java.sql.Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

        // Create a statement to execute SQL queries
        Statement statement = connection.createStatement();

        // Example query to retrieve data from a table
        String query = "SELECT * FROM test.users";
        ResultSet resultSet = statement.executeQuery(query);

        // Display retrieved data
        out.println("<table border='1'>");
        out.println("<tr><th>ID</th><th>Name</th></tr>");
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            out.println("<tr><td>" + id + "</td><td>" + name + "</td></tr>");
        }
        out.println("</table>");

        // Close resources
        resultSet.close();
        statement.close();
        connection.close();

    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
        e.printStackTrace();
    }
%>
</body>
</html>
