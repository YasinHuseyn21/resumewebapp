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
import java.util.List;

@WebServlet(name = "UserInfoController", value = "/userinfo")

public class UserInfoController extends HttpServlet {
    private UserDaoInter userDao = Context.instanceUserDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userIdstr = request.getParameter("id");
            if (userIdstr == null || userIdstr.trim().isEmpty()) {
                throw new IllegalArgumentException("id not specify");
            }
            Integer id = Integer.parseInt(userIdstr);

            User u = userDao.getById(id);
            if (u == null) {
                throw new IllegalArgumentException("There is no user with id GO BACK !!!");
            }
            request.setAttribute("user",u);
            request.getRequestDispatcher("userinfo.jsp").forward(request,response);
        } catch (Exception ex) {
            response.sendRedirect("error.jsp?msg="+ex.getMessage());
        }


    }}
