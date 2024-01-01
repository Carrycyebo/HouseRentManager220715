package com.renter.controllor;

import com.renter.services.RegisterService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/register")
public class RegisterServlet extends HttpServlet {
    private final RegisterService registerService = new RegisterService();
    @Override
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("Name");
        String password = req.getParameter("Passwd");



        System.out.println(name);
        System.out.println(password);

        int status = registerService.addAdmin(name,password);
        if (status == 1){
            req.setAttribute("tipAdmin", "该管理账户已存在！");
            req.getRequestDispatcher("/page/view/pages/admin/register.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("/page/view/pages/status/success.jsp");
        }

    }
}