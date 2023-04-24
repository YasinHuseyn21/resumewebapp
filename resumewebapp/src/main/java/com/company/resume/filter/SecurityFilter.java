package com.company.resume.filter;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(filterName = "SecurityFileFilter", urlPatterns = {"*"})
public class SecurityFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse res = (HttpServletResponse) response;
        HttpServletRequest req = (HttpServletRequest) request;
        try {
            if(!req.getRequestURI().contains("/login") && req.getSession().getAttribute("LoggedInUser")==null) {
                res.sendRedirect("login");
            }
            else{
                chain.doFilter(request,response);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }


    }
}





