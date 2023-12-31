package com.renter.controllor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


//@WebServlet("/view")
public class ViewServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action.equals("manager")){
            req.getRequestDispatcher("/page/admin/view/manager.jsp").forward(req, resp);
        } else if (action.equals("order")) {
            req.getRequestDispatcher("/page/admin/view/orderManager.jsp").forward(req, resp);
        } else if (action.equals("user")) {
            req.getRequestDispatcher("/page/admin/view/userManager.jsp").forward(req, resp);
        } else if (action.equals("charts")) {
            req.getRequestDispatcher("/page/admin/view/charts.jsp").forward(req, resp);
        }
    }
}

