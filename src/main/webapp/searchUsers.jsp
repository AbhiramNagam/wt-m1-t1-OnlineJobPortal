<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Search</title>
    <link rel="stylesheet" href="css/css_exploreUsers.css">
</head>
<body>
<div class="container">
    <h1>User Search</h1>
    <form action="searchResults.jsp" method="get">
        <%--@declare id="age"--%><label for="skill">Search by Skill:</label>
        <select id="skill" name="skill">
            <option value="default">Any</option>
            <%
                String jdbcUrl = "jdbc:mysql://127.0.0.1/test";
                String dbUser = "testUser";
                String dbPassword = "Ripple#Xrp";

                Connection connection = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery("SELECT DISTINCT skill_name FROM Skills");

                    while (resultSet.next()) {
                        String skillName = resultSet.getString("skill_name");
            %>
            <%
                if(!skillName.equals("default")){
            %>
            <option value="<%= skillName %>"><%= skillName %></option>
            <%
                }
                }
            %>
        </select>

        <label for="aspiration">Aspiring Role</label>
        <select id="aspiration" name="aspiration">
            <option value="default">Any</option>
            <%
                resultSet = statement.executeQuery("SELECT DISTINCT aspiration_name FROM Aspirations");

                while (resultSet.next()) {
                    String aspirationName = resultSet.getString("aspiration_name");
            %>
            <%
                if(!aspirationName.equals("default")) {
            %>
            <option value="<%= aspirationName %>"><%= aspirationName %></option>
            <%      }

                }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select>

        <label for="age">Age Range:</label>
        <label for="ageFrom" id="ageFromLabel">From
        </label>
            <input type="number" id="ageFrom" name="ageFrom" placeholder="From" min="13" max="150" value="18">

        <label for="ageTo" id="ageToLabel">To:
        </label>
            <input type="number" id="ageTo" name="ageTo" placeholder="To" min="13" max="150" value="40">
        <label for="gender">Gender:</label>
        <select id="gender" name="gender">
            <option value="any">Any</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
        </select>

        <label for="experience">Minimum Experience:</label>
        <input type="number" id="experience" name="experience" placeholder="Any" min="0" value="0">

        <br><br>
        <button type="submit">Search</button>
    </form>
</div>
</body>
</html>