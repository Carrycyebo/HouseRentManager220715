package com.renter.controllor;

import com.renter.data.Order;
import com.renter.services.GetOrderService;
import com.renter.services.UpdateOrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/page/view/pages/admin/query")
public class QueryOrderServlet extends HttpServlet {
    private final GetOrderService getOrderService = new GetOrderService();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int currentPage = 1;
        int pageSize = 10;

        String currentPageParam = req.getParameter("currentPage");
        String pageSizeParam = req.getParameter("pageSize");

        if (currentPageParam != null && pageSizeParam != null) {
            currentPage = Integer.parseInt(currentPageParam);
            pageSize = Integer.parseInt(pageSizeParam);
        }

        String searchQuery = req.getParameter("searchQuery");

        List<Order> allOrders = getOrderService.getOrder();

        Order queryOrder = getOrderService.queryOrder(allOrders,searchQuery);

        if (queryOrder != null){
            allOrders.clear();
            allOrders.add(queryOrder);

            System.out.println(queryOrder.getOrder_id());
            // 计算总共需要分成多少页
            int totalPage = allOrders.size() / pageSize;
            if (allOrders.size() % pageSize != 0) {
                totalPage++;
            }
            // 获取当前页需要显示的订单
            int start = (currentPage - 1) * pageSize;
            int end = Math.min(start + pageSize, allOrders.size());
            List<Order> currentOrders = new ArrayList<>(allOrders.subList(start, end));

            // 将分页信息和订单发送到JSP页面
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("currentPage", currentPage);
            req.setAttribute("pageSize", pageSize);
            req.setAttribute("currentOrders", currentOrders);
            req.getRequestDispatcher("/page/view/pages/admin/order.jsp").forward(req, resp);
        } else {
            resp.getWriter().write("cw");
        }


    }

}
