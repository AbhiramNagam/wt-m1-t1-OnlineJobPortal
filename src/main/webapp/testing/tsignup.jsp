<%@ page  language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<html>
<head lang="en-IN">
<meta http-equiv="refresh" content="100">
<%--    <link rel="stylesheet" href="css/style1.css">--%>
</head>
<body>
<div class="container">
    <center>
        <h1 class="mainheading">Registration Form</h1>
        <form action="tstore.jsp">
            <input type="text" name="firstName" class="input">
            <label class="label">
                First Name
            </label>
            <br><br>

            <label class="label">
                Last Name
                <input type="text" name="lastName" class="input">
            </label>
            <br><br>
            <label>Enter your email
                <input type="text" name="email">
            </label>
            <br><br>
            <label>Enter your password
                <input type="password" placeholder="Password" name="password">
            </label>
            <br><br>

            <label>Male
                <input type="radio" name="gender" value="male">
            </label>
            <label>Female
                <input type="radio" name="gender" value="female">
            </label>
            <br><br>
            <label>Enter your age
                <input type="number" name="age">
            </label>
            <br><br>
            <label>Your skills
                <textarea name="skills">
            </textarea>
            </label>
            <br><br>
            <label>Aspirations
                <textarea name="aspirations">
            </textarea>
            </label>
            <br><br>
            <label>Experience in years
                <input type="number" name="experience">
            </label>
            <br><br>
            <label>Username
                <input type="text" name="username">
            </label>
            <br><br>
            <input type="submit" value="submit">
        </form>
    </center>
</div>
</body>
</html>
