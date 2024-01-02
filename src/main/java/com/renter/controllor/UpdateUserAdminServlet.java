package com.renter.controllor;

import com.renter.data.User;
import com.renter.services.LoginService;
import com.renter.services.UpdateUserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/page/view/pages/admin/updateUser")
public class UpdateUserAdminServlet extends HttpServlet {
    private final UpdateUserService updateUserService = new UpdateUserService();
    private final LoginService loginService = new LoginService();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User update = new User();

        update.setEmail(req.getParameter("email"));
        update.setName(req.getParameter("username"));
        update.setPhone(req.getParameter("phone"));
        update.setPasswd(req.getParameter("passwd"));
        update.setMoney(req.getParameter("money"));

        String orderIds = req.getParameter("orderIds");

        List<String> orderIdList = new ArrayList<>();

        if (orderIds == null || orderIds.isEmpty()) {
            orderIdList.add(orderIds);
        } else if (orderIds.contains(",")) {
            String[] orderIdArray = orderIds.split(",");
            orderIdList = Arrays.asList(orderIdArray);
        } else {
            orderIdList.add(orderIds);
        }

        update.setOrderIds(orderIdList);

        System.out.println(update.getEmail());
        System.out.println(update.getName());
        System.out.println(update.getPhone());
        System.out.println(update.getPasswd());
        System.out.println(update.getOrderIds());
        String od = orderIdList.toString().replace("[", "").replace("]", "");
        System.out.println(od);

        boolean status = updateUserService.doUpdateUserAdmin(update);
        resp.setContentType("text/plain;charset=UTF-8");

        if (status) {
            resp.sendRedirect("/page/view/pages/status/sccUpdateUserAdmin.jsp");
        } else {
            // 设置响应头的 Content-Type 值
            resp.setContentType("text/plain;charset=UTF-8");
            // 返回失败响应
            resp.getWriter().write("订单不存在");
        }


    }
}
