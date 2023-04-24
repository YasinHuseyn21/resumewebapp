package com.company.resume.controller;

import dao.inter.UserDaoInter;
import entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.Context;

import java.io.IOException;

@WebServlet(name = "UserDetailController", value = "/userDetail")
public class UserDetailController extends HttpServlet {
    private UserDaoInter userDao = Context.instanceUserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userIdstr = request.getParameter("id");
            if (userIdstr == null || userIdstr.trim().isEmpty()) {
                throw new IllegalArgumentException("id not specify");
            }
            Integer id = Integer.parseInt(userIdstr);
            UserDaoInter userDao = Context.instanceUserDao();
            User u = userDao.getById(id);
            if (u == null) {
                throw new IllegalArgumentException("There is no user with id GO BACK !!!");
            }
            request.setAttribute("user",u);
            request.getRequestDispatcher("userdetail.jsp").forward(request,response);
        } catch (Exception ex) {
            response.sendRedirect("error?msg="+ex.getMessage());
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");

        User user = userDao.getById(id);
        user.setName(name);
        user.setSurname(surname);

        userDao.updateUser(user);
//        response .getOutputStream().println("Successfully update :");
//        response.getOutputStream().close();

        response.sendRedirect("users");


    }

}
