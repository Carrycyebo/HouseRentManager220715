package com.renter.controllor;

import com.renter.data.Admin;
import com.renter.services.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/login")
public class UserLoginServlet extends HttpServlet {
    private final LoginService loginService = new LoginService();
    @Override
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("adminName");
        String password = req.getParameter("adminPasswd");

        int status = loginService.queryUser(name,password);
        if(status == 0){

            Admin loggedInAdmin = new Admin(name, password);
            HttpSession session = req.getSession();
            session.setAttribute("loggedInUser", loggedInAdmin);
            req.getRequestDispatcher("/view?action=manager").forward(req, resp);
        } else if (status == 1) {
            req.setAttribute("tip", "账号不存在！");
            req.getRequestDispatcher("/page/admin/login.jsp").forward(req, resp);
        }else {
            req.setAttribute("tip", "密码不正确！");
            req.getRequestDispatcher("/page/admin/login.jsp").forward(req, resp);
        }

    }
}