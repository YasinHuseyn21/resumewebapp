package com.company.resume.controller;

import at.favre.lib.crypto.bcrypt.BCrypt;
import dao.inter.UserDaoInter;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.Context;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    private UserDaoInter userDao = Context.instanceUserDao();
    private BCrypt.Verifyer verifyer=BCrypt.verifyer();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            User user = userDao.findByEmail(email);
            if (user == null) {
                throw new IllegalArgumentException("email or password not correct !!!");
            }
           BCrypt.Result rs= verifyer.verify(password.toCharArray(),user.getPassword().toCharArray());
            if(!rs.verified){
                throw new IllegalArgumentException("Password is not correct !!!");
            }
            request.getSession().setAttribute("LoggedInUser", user);
            response.sendRedirect("users");
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("error?msg=" + ex.getMessage());
        }
    }

}
