package dao.inter;



import entity.User;
import entity.UserSkill;

import java.util.List;

public interface UserDaoInter {
    public List<User> getAll(String name,String surname,String email);
    public User getById(int userId);
    public boolean updateUser(User user);
    public boolean removeUser(int id);
    public boolean addUser(User user);
    public User findByEmailAndPassword(String email,String password);
    public User findByEmail(String email);




}
