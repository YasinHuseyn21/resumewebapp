package com.company.resume.filter;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;


import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(filterName = "JspFileFilter", urlPatterns = {"*.jsp"})
public class JspFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse res = (HttpServletResponse) servletResponse;
        try {
            res.sendRedirect("error?msg=not found");
        } catch (Exception ex) {
            ex.printStackTrace();
        }


    }
}





