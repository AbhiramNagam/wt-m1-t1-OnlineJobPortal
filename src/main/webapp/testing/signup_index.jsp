<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--  <meta http-equiv="refresh" content="1">-->
    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' >
    <link rel="stylesheet" href="css/css_signup.css">
    <script src="script.js">

    </script>
</head>
<body>
<div class="someStuff" style="float: left;background-color: powderblue;width: 70%;height: 100%;position:absolute;" >

</div>
<center>
    <div class="someStuff2" style=" align-content: center;height: 100%;position:relative;">

        <div class="container" style="height: 100%;position:relative;">
            <input id="register_toggle" type="checkbox">
            <div class="slider" style="height: 100%;position:relative;">
                <form class="form" action="../store2.jsp">
                    <span class="title">Login</span>
                    <div class="form_control">
                        <input required="" class="input" type="text" name="username">
                        <label class="label">Username</label>
                    </div>
                    <div class="form_control">
                        <input required="" class="input" type="password" name="password">
                        <label class="label">Password</label>
                    </div>
                    <button>Login</button>

                    <span class="bottom_text">Don't have an account? <label class="swtich" for="register_toggle">Sign Up</label> </span>
                    <!--      -----------------=============--------------->
                    <!--            <script>-->
                    <!--                document.getElementById("register_toggle").click();-->
                    <!--            </script>-->
                </form>
                <form class="form" id="signup_" action="store.jsp" >
                    <span class="title">Sign Up</span>

                    <div class="form_control">
                        <input required="" class="input" type="text" name="firstName">
                        <label class="label">First Name</label>
                    </div>
                    <div class="form_control">
                        <input required="" class="input" type="text" name="lastName">
                        <label class="label">LastName</label>
                    </div>
                    <div class="form_control">
                        <input required="" class="input" type="text" name="username">
                        <label class="label">Username</label>
                    </div>
                    <div class="form_control">
                        <input required="" class="input" type="email" name="email">
                        <label class="label">Email</label>
                    </div>
                    <div class="form_control">
                        <input required="" class="input" type="password" name="password">
                        <label class="label">Password</label>
                    </div>
                    <div class="form_control">
                        <input required="" class="input" type="number" name="age" min="13">
                        <label class="label">Age</label>
                    </div>
                    <div class="">
                        <input required="" class="input" type="radio" value="male" name="gender">
                        <label class="label">Male</label>
                        <input required="" class="input" type="radio" value="female" name="gender">
                        <label class="label">Female</label>
                    </div>


                    <!--          <div class="form_control">-->
                    <!--            <input required="" class="input" type="text">-->
                    <!--            <p style="padding-top: 0;padding-bottom: 0;margin: 0">Add skills</p>-->
                    <!--            <label class="label">skill 0</label>-->
                    <!--          </div>-->

                    <div id="skillsContainer" class="form_control" style="margin: 0">
                        Add skills
                    </div>

                    <!--          <div class="form_control">-->
                    <button id="addSkillButton" type="button">+</button>

                    <script>
                        // Load existing skills from the database and populate the array
                        var existingSkills = [
                            <%-- Load skills from the database using Java code here --%>
                            <%
                                String jdbcUrl = "jdbc:mysql://localhost/test";
                                String dbUser = "testUser";
                                String dbPassword = "Ripple#Xrp";

                                Connection connection = null;
                                Statement statement = null;
                                ResultSet resultSet = null;

                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                                    statement = connection.createStatement();

                                    String skillsQuery = "SELECT skill_name FROM Skills";
                                    resultSet = statement.executeQuery(skillsQuery);

                                    while (resultSet.next()) {
                                        out.print("'" + resultSet.getString("skill_name") + "', ");
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    if (resultSet != null) {
                                        try {
                                            resultSet.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                    if (statement != null) {
                                        try {
                                            statement.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                    if (connection != null) {
                                        try {
                                            connection.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                }
                            %>
                        ];

                        // Rest of the JavaScript code as before
                    </script>
                    <input type="hidden" name="skillCount" id="skillCount" >

                    <div id="aspirationsContainer" class="form_control" style="margin: 0">
                        Aspiring Positions
                    </div>
                    <button id="aspirationsButton" type="button">+</button>
                    <input type="hidden" name="aspirationCount" id="aspirationCount">
                    <div class="form_control">
                        <input required="" class="input" type="number" name="experience" min="0">
                        <label class="label">Experience</label>
                    </div>
                    <button>Sign Up</button>

                    <span class="bottom_text">Already have an account? <label class="swtich" for="register_toggle">Sign In</label> </span>
                </form>


            </div>
        </div>
    </div>
</center>
</body>
</html>