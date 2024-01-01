package com.renter.controllor;

import com.renter.dao.LoginDao;
import com.renter.data.Admin;
import com.renter.data.User;
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
        String email = req.getParameter("userEmail");
        String password = req.getParameter("userPasswd");

        int status = loginService.queryUser(email,password);
        if(status == 0){
            User loggedUser = loginService.getUser(email);
            System.out.println(loggedUser.getName());
            HttpSession session = req.getSession();
            session.setAttribute("loggedInUser", loggedUser);
            resp.sendRedirect("/page/view/index.jsp");
        } else if (status == 1) {
            req.setAttribute("tipUserL", "账号不存在！");
            req.getRequestDispatcher("/page/user/login.jsp").forward(req, resp);
        }else {
            req.setAttribute("tipUserL", "密码不正确！");
            req.getRequestDispatcher("/page/user/login.jsp").forward(req, resp);
        }

    }
}