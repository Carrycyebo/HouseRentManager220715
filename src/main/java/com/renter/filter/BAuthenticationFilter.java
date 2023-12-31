package com.renter.filter;

import com.renter.data.Admin;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//@WebFilter("/view") // 拦截所有请求
public class BAuthenticationFilter implements Filter {
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) req;
        HttpServletResponse httpResponse = (HttpServletResponse) resp;

        HttpSession session = httpRequest.getSession(false);

        // 检查用户是否已登录
        if (session != null && session.getAttribute("loggedInAdmin") != null) {
            // 用户已登录，获取用户信息并添加到请求中
            Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
            httpRequest.setAttribute("loggedInAdmin ", loggedInAdmin);

            chain.doFilter(req, resp);
        } else {
            req.getRequestDispatcher("/page/admin/login.jsp").forward(req, resp);
        }

        // 继续处理请求

    }

    // 其他过滤器方法
}