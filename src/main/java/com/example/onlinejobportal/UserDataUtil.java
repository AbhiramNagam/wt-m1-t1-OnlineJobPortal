package com.example.onlinejobportal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDataUtil {
    public static List<String> getSkillsForUser(int userId, Connection conn) throws SQLException {
        List<String> skills = new ArrayList<>();
        String skillsQuery = "SELECT skill_name FROM Skills WHERE user_id = ?";
        PreparedStatement skillsStatement = conn.prepareStatement(skillsQuery);
        skillsStatement.setInt(1, userId);
        ResultSet skillsResultSet = skillsStatement.executeQuery();
        while (skillsResultSet.next()) {
            skills.add(skillsResultSet.getString("skill_name"));
        }
        skillsResultSet.close();
        skillsStatement.close();
        return skills;
    }

    public static List<String> getAspirationsForUser(int userId, Connection conn) throws SQLException {
        List<String> aspirations = new ArrayList<>();
        String aspirationsQuery = "SELECT aspiration_name FROM Aspirations WHERE user_id = ?";
        PreparedStatement aspirationsStatement = conn.prepareStatement(aspirationsQuery);
        aspirationsStatement.setInt(1, userId);
        ResultSet aspirationsResultSet = aspirationsStatement.executeQuery();
        while (aspirationsResultSet.next()) {
            aspirations.add(aspirationsResultSet.getString("aspiration_name"));
        }
        aspirationsResultSet.close();
        aspirationsStatement.close();
        return aspirations;
    }
}
