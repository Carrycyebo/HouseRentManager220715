package com.renter.controllor;

import com.alibaba.fastjson2.JSONObject;
import com.renter.data.Data;
import com.renter.services.ShowDataService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/user/show")
public class ShowDataServlet extends HttpServlet {
    private final ShowDataService service = new ShowDataService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("123123123213");
        List<Data> data = service.selectData();
        String jsonData = JSONObject.toJSONString(data);
        System.out.println(jsonData);
        resp.getWriter().write(jsonData);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
