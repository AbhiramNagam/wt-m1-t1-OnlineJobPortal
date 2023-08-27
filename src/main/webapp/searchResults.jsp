<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*,com.example.onlinejobportal.UserDataUtil.*" %>
<%@ page import="static com.example.onlinejobportal.UserDataUtil.getSkillsForUser" %>
<%@ page import="static com.example.onlinejobportal.UserDataUtil.getAspirationsForUser" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Search Results</title>
    <link rel="stylesheet" href="css/css_searchResults.css">
</head>
<body>
<div class="container">
    <h1>User Search Results</h1>
    <%
        String jdbcUrl = "jdbc:mysql://localhost/test";
        String dbUser = "testUser";
        String dbPassword = "Ripple#Xrp";

        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            String searchSkill = request.getParameter("skill");
            String searchAspiration = request.getParameter("aspiration");
            int searchAgeFrom = Integer.parseInt(request.getParameter("ageFrom"));
            int searchAgeTo = Integer.parseInt(request.getParameter("ageTo"));
            String searchGender = request.getParameter("gender");
            int searchExperience = Integer.parseInt(request.getParameter("experience"));

            String query = "SELECT * FROM Users " +
                    "WHERE user_id IN (SELECT user_id FROM Skills WHERE skill_name = ?) " +
                    "AND user_id IN (SELECT user_id FROM Aspirations WHERE aspiration_name = ?) " +
                    "AND age BETWEEN ? AND ? " +
                    "AND (gender = ? OR 'any' = ?) " +
                    "AND experience >= ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, searchSkill);
            statement.setString(2, searchAspiration);
            statement.setInt(3, searchAgeFrom);
            statement.setInt(4, searchAgeTo);
            statement.setString(5, searchGender);
            statement.setString(6, searchGender);
            statement.setInt(7, searchExperience);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
    %>
    <div class="user">
        <h2><%= resultSet.getString("username") %></h2>
        <p>Name: <%= resultSet.getString("first_name") %> <%= resultSet.getString("last_name") %></p>
        <p>Email: <%= resultSet.getString("email") %></p>
        <p>Age: <%= resultSet.getInt("age") %></p>
        <p>Gender: <%= resultSet.getString("gender") %></p>
        <p>Experience: <%= resultSet.getInt("experience") %> years</p>
        <p class="skills">Skills:
        <div class="skills-container">
            <%
                List<String> skills = getSkillsForUser(resultSet.getInt("user_id"), connection);
                for (String skill : skills) {
                    if(!skill.equals("default")){
            %>
            <div class="skill-box"><%= skill %></div>
            <%
                }
                }
            %>
        </div>
        </p>
        <p class="aspirations">Aspirations:
        <div class="aspirations-container">
            <%
                List<String> aspirations = getAspirationsForUser(resultSet.getInt("user_id"), connection);
                for (String aspiration : aspirations) {
                    if(!Objects.equals(aspiration, "default")){
            %>
            <div class="aspirations-box"><%= aspiration %></div>
            <%
                }
                }
            %>
        </div>
        </p>
    </div>
    <%
            }

            resultSet.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
    <center>
        <a href="searchUsers.jsp"><h2>Click here to go to search page</h2></a>
    </center>
</div>
</body>
</html>
