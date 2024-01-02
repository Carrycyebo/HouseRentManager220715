package com.renter.controllor;

import com.renter.data.Order;
import com.renter.services.LoginService;
import com.renter.services.UpdateOrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/page/view/pages/admin/ModifyOrderSubmit")
public class ModifyOrderServlet extends HttpServlet {
    private final UpdateOrderService updateOrderService = new UpdateOrderService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取表单中的值
        request.setCharacterEncoding("UTF-8");

        String startTimeString = request.getParameter("startTime");
        String endTimeString = request.getParameter("endTime");

        LocalDate startDate = LocalDate.parse(startTimeString);
        LocalDate endDate = LocalDate.parse(endTimeString);

        String formattedStartDate = startDate.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        String formattedEndDate = endDate.format(DateTimeFormatter.ofPattern("yyyyMMdd"));


        Order update = new Order();
        update.setRow(request.getParameter("rowKey"));
        update.setOrder_id(request.getParameter("orderId"));
        update.setHouse_id(request.getParameter("houseId"));
        update.setPrice(request.getParameter("price"));
        update.setStartint_time(formattedStartDate);
        update.setEnd_time(formattedEndDate);
        update.setRenting_status(request.getParameter("status"));

       /* System.out.println(update.getHouse_id());
        System.out.println(update.getOrder_id());*/

        // 在这里完成自定义验证逻辑，如果有错误则返回响应
        //System.out.println(update.getRow());
        // 修改订单数据
        boolean status = updateOrderService.doUpdateorder(update);
        response.setContentType("text/plain;charset=UTF-8");

        if (status) {
            // 返回成功响应
            response.sendRedirect("/page/view/pages/status/successUpdate.jsp");
        } else {
            // 设置响应头的 Content-Type 值
            response.setContentType("text/plain;charset=UTF-8");
            // 返回失败响应
            response.getWriter().write("订单不存在");
        }
    }
}