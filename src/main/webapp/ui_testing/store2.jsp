        <%@ page import="java.sql.*, java.util.*,java.lang.*" %>
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/test";
    String dbUser = "testUser";
    String dbPassword = "Ripple#Xrp";

    Connection connection = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        out.println("Connected successfully!");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
        <%
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String username = request.getParameter("username");

            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String age_ = request.getParameter("age");
            int age = Integer.parseInt(age_);
            String gender = request.getParameter("gender");
//    String skills=request.getParameter("skills");
            String skillCount_ = request.getParameter("skillCount");
            int skillCount = 0;
            try {
                skillCount = Integer.parseInt(skillCount_);
            } catch (NumberFormatException e) {
//                out.println("Could not convert skillCount to integer");
                out.println(e);
            }
//    Convert skillCount_ to int without Integer.ParseInt() method
//    Convert skillCount_ to integer

//    out.println(Integer.parseInt(skillCount_));
//    int skillCount=Integer.parseInt(skillCount_);
            String aspirationCount_ = request.getParameter("aspirationCount");
            int aspirationCount = 0;
            try {
                aspirationCount = Integer.parseInt(aspirationCount_);
            } catch (NumberFormatException e) {
//                out.println("Could not convert aspirationCount to integer");
//                out.println(e);
//                out.println(aspirationCount_);
            }
//    String aspirations=request.getParameter("aspirations");
            String experience_ = request.getParameter("experience");
            int experience = Integer.parseInt(experience_);
//    Read skills{n} and store in array
            String[] skills = new String[skillCount];
            for (int i = 0; i < skillCount; i++) {
                skills[i] = request.getParameter("skill" + (i+1));
//                out.println("skill" + (i+1));
//                out.println(skills[i]);
            }

//    Read aspirations{n} and store in array
            String[] aspirations = new String[aspirationCount];
            for (int i = 0; i < aspirationCount; i++) {
                aspirations[i] = request.getParameter("aspiration" + (i+1));
                out.println("aspiration" + (i+1));
            }

        %>
        <%
            String insertUserQuery = "INSERT INTO users (first_name, last_name, username, email, password, age, experience, gender) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement insertUserStmt = null;
            try {
                assert connection != null;
                insertUserStmt = connection.prepareStatement(insertUserQuery);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            try {
                insertUserStmt.setString(1, firstName);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                insertUserStmt.setString(2, lastName);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                insertUserStmt.setString(3, username);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                insertUserStmt.setString(4, email);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                insertUserStmt.setString(5, password);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                insertUserStmt.setInt(6, age);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                insertUserStmt.setInt(7, experience);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                insertUserStmt.setString(8, gender);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }


            try {
                insertUserStmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        %>

        <%
            int userId = -1;
            Statement getUserIdStmt = connection.createStatement();
            ResultSet userIdResult = getUserIdStmt.executeQuery("SELECT LAST_INSERT_ID()");

            if (userIdResult.next()) {
                userId = userIdResult.getInt(1);
            }
        %>

        <%
            //    String[] skills = {"Python", "JavaScript", "SQL"};
//    String[] aspirations = {"Software Engineer", "Network"};

            String insertSkillQuery = "INSERT INTO skills (user_id, skill_name) VALUES (?, ?)";
            PreparedStatement insertSkillStmt = connection.prepareStatement(insertSkillQuery);

            for (String skill : skills) {
                try {
                    insertSkillStmt.setInt(1, userId);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                insertSkillStmt.setString(2, skill);
                insertSkillStmt.executeUpdate();
            }

            String insertAspirationQuery = "INSERT INTO aspirations (user_id, aspiration_name) VALUES (?, ?)";
            PreparedStatement insertAspirationStmt = connection.prepareStatement(insertAspirationQuery);

            for (String aspiration : aspirations) {
                insertAspirationStmt.setInt(1, userId);
                insertAspirationStmt.setString(2, aspiration);
                insertAspirationStmt.executeUpdate();
            }
        %>

        <%
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
