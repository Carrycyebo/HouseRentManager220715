package com.renter.controllor;

import com.renter.data.User;
import com.renter.services.LoginService;
import com.renter.services.UpdateUserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/page/view/pages/user/charge")
public class MoneyChargeServlet extends HttpServlet {
    private final UpdateUserService updateUserService = new UpdateUserService();
    private final LoginService loginService = new LoginService();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User charge = new User();

        String charge_money = req.getParameter("charge");
        HttpSession session = req.getSession();

        charge = (User) session.getAttribute("loggedInUser");
        int setMoney = Integer.parseInt(charge.getMoney()) +  Integer.parseInt(charge_money);
        charge.setMoney(String.valueOf(setMoney));

        boolean status = updateUserService.doCharge(charge);

        if (status) {
            User loggedInUser = loginService.getUser(charge.getEmail());
            session.setAttribute("loggedInUser", loggedInUser);
            resp.sendRedirect("/page/view/pages/status/scUpdateUser.jsp");
        } else {
            // 设置响应头的 Content-Type 值
            resp.setContentType("text/plain;charset=UTF-8");
            // 返回失败响应
            resp.getWriter().write("充值失败，请返回重试！");
        }
    }


}
