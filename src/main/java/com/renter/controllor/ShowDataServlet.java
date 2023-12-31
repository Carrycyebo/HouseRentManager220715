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
        String id = req.getParameter("id");
        if(id.equals("1")){
            List<Data> data1 = service.selectData1();
            String jsonData1 = JSONObject.toJSONString(data1);
            resp.getWriter().write(jsonData1);
        } else {
            List<Data> data2 = service.selectData2();
            String jsonData2 = JSONObject.toJSONString(data2);
            System.out.println(jsonData2);
            resp.getWriter().write(jsonData2);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
