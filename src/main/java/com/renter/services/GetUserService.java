package com.renter.services;

import com.renter.dao.GetOrderDao;
import com.renter.dao.GetUserDao;
import com.renter.dao.ShowData;
import com.renter.data.Data;
import com.renter.data.Order;
import com.renter.data.User;

import java.util.List;

public class GetUserService {
    private final GetUserDao userList = new GetUserDao();

    public List<User> getUser(){
        return  userList.getUser();
    }

    public Order queryOrder(List<Order> allOrders, String searchQuery){
        Order foundOrder = new Order();

        for (Order order : allOrders) {
            if (order.getOrder_id().equals(searchQuery)) {
                foundOrder = order;
                System.out.println(foundOrder.getOrder_id());
                break;
            }
        }

        return foundOrder;
    }
}
