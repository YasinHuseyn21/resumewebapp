package dao.impl;

import dao.inter.AbstractDao;
import dao.inter.UserSkillDaoInter;
import entity.Skill;
import entity.User;
import entity.UserSkill;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserSkillDaoImpl extends AbstractDao implements UserSkillDaoInter {

    public UserSkill getUserSkill(ResultSet rs) throws Exception {

        int userId = rs.getInt("id");
//        int userId = rs.getInt("user_id");
        int skillId = rs.getInt("skill_id");
        String skillName = rs.getString("skill_name");
        int power = rs.getInt("power");


        return new UserSkill(null, new User(userId), new Skill(skillId, skillName), power);


    }

    @Override
    public List<UserSkill> getAllSkillByUserId(int userId) {
        List<UserSkill> result = new ArrayList<>();
        try (Connection c = connect()) {
            PreparedStatement stmt = c.prepareStatement("SELECT" +
                    "\tu.*," +
                    "\tus.skill_id," +
                    "\ts.NAME AS skill_name," +
                    "\tus.power " +
                    "FROM" +
                    "\tuser_skill us" +
                    "\tLEFT JOIN USER u ON us.id = u.id" +
                    "\tLEFT JOIN skill s ON us.id = s.id " +
                    "WHERE" +
                    "\tus.user_id = ?");
            stmt.setInt(1, userId);
            stmt.execute();
            ResultSet rs = stmt.getResultSet();
            while (rs.next()) {
                UserSkill u = getUserSkill(rs);
                result.add(u);

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;


    }
}
