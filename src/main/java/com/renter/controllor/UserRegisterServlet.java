package com.renter.controllor;

import com.renter.services.RegisterService;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/register")
public class UserRegisterServlet extends HttpServlet {
    private final RegisterService registerService = new RegisterService();
    @Override
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String uname = req.getParameter("uname");
        String password = req.getParameter("password");

        int status = registerService.addUser(email,uname,password);{
            if (status == 1){
                req.setAttribute("tipUser", "该管理账户已存在！");
            } else {

            }
        }

    }
}