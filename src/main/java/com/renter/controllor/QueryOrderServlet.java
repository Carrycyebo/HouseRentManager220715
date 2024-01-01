package com.renter.controllor;

import com.renter.data.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/page/view/pages/admin/query")
public class QueryOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String searchQuery = req.getParameter("searchQuery");
        System.out.println(searchQuery);
        Order searchorder = new Order();
        searchorder.setOrder_id(searchQuery);

    }

}
