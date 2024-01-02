package com.renter.controllor;

import com.renter.data.Admin;
import com.renter.data.User;
import com.renter.services.LoginService;
import com.renter.services.UpdateOrderService;
import com.renter.services.UpdateUserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/page/view/pages/user/updateUser")
public class UpdateUserServlet extends HttpServlet {
    private final UpdateUserService updateUserService = new UpdateUserService();
    private final LoginService loginService = new LoginService();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User update = new User();

        update.setEmail(req.getParameter("email"));
        update.setName(req.getParameter("uname"));
        update.setPhone(req.getParameter("phone"));
        update.setPasswd(req.getParameter("passwd"));

        System.out.println(update.getEmail());
        System.out.println(update.getName());
        System.out.println(update.getPhone());
        System.out.println(update.getPasswd());

        boolean status = updateUserService.doUpdateUser(update);
        resp.setContentType("text/plain;charset=UTF-8");

        if (status) {
            User loggedInUser = loginService.getUser(update.getEmail());
            HttpSession session = req.getSession();
            session.setAttribute("loggedInUser", loggedInUser);
            resp.sendRedirect("/page/view/pages/status/scUpdateUser.jsp");
        } else {
            // 设置响应头的 Content-Type 值
            resp.setContentType("text/plain;charset=UTF-8");
            // 返回失败响应
            resp.getWriter().write("订单不存在");
        }


    }
}
