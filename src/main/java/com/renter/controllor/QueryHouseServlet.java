package com.renter.controllor;

import com.renter.data.Order;
import com.renter.services.GetOrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/page/view/pages/user/query")
public class QueryHouseServlet extends HttpServlet {
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
        String price_min = req.getParameter("priceMin");
        String price_max = req.getParameter("priceMax");
        String status = req.getParameter("status");

        System.out.println(searchQuery);
        System.out.println(price_min);
        System.out.println(price_max);
        System.out.println(status);

        String queryString = req.getQueryString();
        System.out.println(queryString);

        if (queryString == null){
            HttpSession session = req.getSession();
            session.setAttribute("searchQuery", searchQuery);
            session.setAttribute("priceMin", price_min);
            session.setAttribute("priceMax", price_max);
            session.setAttribute("status", status);
        } else {
            HttpSession session = req.getSession();
            searchQuery = (String) session.getAttribute("searchQuery");
            price_min = (String) session.getAttribute("priceMin");
            price_max = (String) session.getAttribute("priceMax");
            status = (String) session.getAttribute("status");
        }

        List<Order> allOrders = getOrderService.getOrder();
        HttpSession session = req.getSession();
        session.setAttribute("searchQuery", searchQuery);
        session.setAttribute("priceMin", price_min);
        session.setAttribute("priceMax", price_max);
        session.setAttribute("status", status);

        List<Order> queryOrder = getOrderService.queryHouse(allOrders,searchQuery,price_min,price_max,status);

        allOrders.clear();
        allOrders = queryOrder;


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
        req.getRequestDispatcher("/page/view/pages/user/rentManager.jsp").forward(req, resp);



    }

}
