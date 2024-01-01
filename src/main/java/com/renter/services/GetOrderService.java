package com.renter.services;

import com.renter.dao.GetOrderDao;
import com.renter.dao.ShowData;
import com.renter.data.Data;
import com.renter.data.Order;

import java.util.List;

public class GetOrderService {
    private final GetOrderDao order = new GetOrderDao();

    public List<Order> getOrder(){
        return  order.getOrder();
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
