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
import java.time.LocalDateTime;

@WebServlet("/page/view/pages/admin/ModifyOrderSubmit")
public class ModifyOrderServlet extends HttpServlet {
    private final UpdateOrderService updateOrderService = new UpdateOrderService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取表单中的值
        request.setCharacterEncoding("UTF-8");

        Order update = new Order();
        update.setOrder_id(request.getParameter("orderId"));
        update.setHouse_id(request.getParameter("houseId"));
        update.setPrice(request.getParameter("price"));
        update.setStartint_time(request.getParameter("startTime"));
        update.setEnd_time(request.getParameter("endTime"));
        update.setRenting_status(request.getParameter("status"));
        // 在这里完成自定义验证逻辑，如果有错误则返回响应

        // 修改订单数据
        //boolean status = updateOrderService.doUpdateorder(update);
        System.out.println(update);
        response.setContentType("text/plain;charset=UTF-8");
        response.getWriter().write("订单修改成功！");
        /*if (status) {
            // 设置响应头的 Content-Type 值
            response.setContentType("text/plain;charset=UTF-8");
            // 返回成功响应
            response.getWriter().write("订单修改成功！");
        } else {
            // 设置响应头的 Content-Type 值
            response.setContentType("text/plain;charset=UTF-8");
            // 返回失败响应
            response.getWriter().write("订单不存在");
        }*/
    }
}