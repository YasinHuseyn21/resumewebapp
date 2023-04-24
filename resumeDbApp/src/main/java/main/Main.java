package main;

import dao.impl.UserDaoImpl;
import dao.inter.UserDaoInter;
import entity.User;

public class Main {
    public static void main(String[] args) throws Exception {

        UserDaoImpl userDao = new UserDaoImpl();
        User user=userDao.findByEmailAndPassword("yasin.huseyn.dev@gmail.com","232306");
        System.out.println(user);



    }
}
