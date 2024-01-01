package com.renter.controllor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // 检查当前用户是否是管理员
        if (session.getAttribute("loggedInAdmin") != null) {
            // 管理员登出逻辑
            session.invalidate(); // 使会话失效
            response.sendRedirect("/page/admin/login.jsp"); // 重定向到管理员登录页面
        } else if (session.getAttribute("loggedInUser") != null) {
            // 用户登出逻辑
            session.invalidate(); // 使会话失效
            response.sendRedirect("/page/user/login.jsp"); // 重定向到用户登录页面
        } else {
            // 如果没有用户或管理员登录，则默认重定向到用户登录页面
            response.sendRedirect("/page/user/login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
