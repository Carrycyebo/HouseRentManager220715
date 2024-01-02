package com.renter.controllor;

import com.renter.dao.UpdateUserDao;
import com.renter.data.Order;
import com.renter.data.User;
import com.renter.services.GetOrderService;
import com.renter.services.LoginService;
import com.renter.services.UpdateOrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/page/view/pages/user/rentHouse")
public class RentHouseServlet extends HttpServlet {
    private final GetOrderService getOrderService = new GetOrderService();
    private final UpdateOrderService updateOrderService = new UpdateOrderService();
    private final UpdateUserDao updateUser = new UpdateUserDao();
    private final LoginService loginService = new LoginService();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User charge;
        Order createOrder = new Order();
        String house_id = req.getParameter("houseId");
        System.out.println(house_id);
        String start_time = req.getParameter("startTime");
        String end_time = req.getParameter("endTime");

        LocalDate startDate = LocalDate.parse(start_time);
        LocalDate endDate = LocalDate.parse(end_time);

        String formattedStartDate = startDate.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        String formattedEndDate = endDate.format(DateTimeFormatter.ofPattern("yyyyMMdd"));

        LocalDate currentDate = LocalDate.now();
        // 定义日期格式化器，格式为yyyymmdd
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        // 将日期格式化为字符串
        String formattedDate = currentDate.format(formatter);

        createOrder.setOrder_id(formattedDate);


        //对用户账户进行更新
        HttpSession session = req.getSession();
        charge = (User) session.getAttribute("loggedInUser");

        //获取房屋对象
        List<Order> allOrders = getOrderService.getOrder();
        //System.out.println(house_id);
        Order addOrder = getOrderService.queryOrderByHouseId(allOrders,house_id);



        //计费，不足一个月的按一个月计费
        Period period = Period.between(startDate, endDate);

        int months = period.getMonths();
        int days = period.getDays();

        if (days > 0) {
            months++;
        }
        int total_price = Integer.parseInt(addOrder.getPrice()) * months;
        System.out.println(total_price);
        System.out.println(charge.getMoney());
        if(total_price >= Integer.parseInt(charge.getMoney())){
            resp.sendRedirect("/page/view/pages/status/failRent.jsp");
        } else {
            //对用户对象进行更新
            String money = String.valueOf(Integer.parseInt(charge.getMoney()) - total_price);
            User money_e = new User();
            money_e.setMoney(money);
            money_e.setEmail(charge.getEmail());

            List<String> orderIdList = new ArrayList<>();
            if (createOrder.getOrder_id().contains(",")) {
                String[] orderIdArray = createOrder.getOrder_id().split(",");
                orderIdList = Arrays.asList(orderIdArray);
            } else {
                orderIdList.add(createOrder.getOrder_id());
            }
            money_e.setOrderIds(orderIdList);
            boolean status2 = updateUser.rentHouse(money_e);

            addOrder.setOrder_id(formattedDate);
            addOrder.setStartint_time(formattedStartDate);
            addOrder.setEnd_time(formattedEndDate);
            addOrder.setRenting_status("Y");
            //对订单进行更新


            boolean status1 = updateOrderService.doUpdateorder(addOrder);


            resp.setContentType("text/plain;charset=UTF-8");



            if (status1 && status2) {
                User loggedInUser = loginService.getUser(charge.getEmail());
                session.setAttribute("loggedInUser", loggedInUser);
                // 返回成功响应
                resp.sendRedirect("/page/view/pages/status/sucRentHouse.jsp");
            } else {
                // 设置响应头的 Content-Type 值
                resp.setContentType("text/plain;charset=UTF-8");
                // 返回失败响应
                resp.getWriter().write("订单提交失败！");
            }

        }
        }

}
