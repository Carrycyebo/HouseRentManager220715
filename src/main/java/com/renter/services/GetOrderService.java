package com.renter.services;

import com.renter.dao.GetOrderDao;
import com.renter.dao.ShowData;
import com.renter.data.Data;
import com.renter.data.Order;

import java.util.ArrayList;
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

    public Order queryOrderByHouseId(List<Order> allOrders, String house_id){
        Order foundOrder = new Order();

        for (Order order : allOrders) {
            if (order.getHouse_id().equals(house_id)) {
                foundOrder = order;
                System.out.println(foundOrder.getHouse_id());
                break;
            }
        }

        return foundOrder;
    }
    public List<Order> queryHouse(List<Order> allOrders, String house_id, String price_min, String price_max, String status) {
        List<Order> queryHouse = new ArrayList<>();

        if (!house_id.isEmpty()) {
            for (Order order : allOrders) {
                if (order.getHouse_id().equals(house_id)) {
                    queryHouse.add(order);
                    break;
                }
            }
        } else {
            int minPrice = price_min.isEmpty() ? Integer.MIN_VALUE : Integer.parseInt(price_min);
            int maxPrice = price_max.isEmpty() ? Integer.MAX_VALUE : Integer.parseInt(price_max);

            for (Order order : allOrders) {
                int price = Integer.parseInt(order.getPrice());
                boolean isValidPrice = price >= minPrice && price <= maxPrice;

                if (status.equals("Y")) {
                    if (isValidPrice && order.getRenting_status().equals("Y")) {
                        queryHouse.add(order);
                    }
                } else if (status.equals("N")) {
                    if (isValidPrice && order.getRenting_status().equals("N")) {
                        queryHouse.add(order);
                    }
                } else {
                    if (isValidPrice) {
                        queryHouse.add(order);
                    }
                }
            }
        }

        return queryHouse;
    }
    public List<Order> queryMyOrder(List<String> OrderId){
        List<Order> orders = order.getOrder();
        List<Order> list = new ArrayList<>();
        for (String id : OrderId) {
            for (Order order : orders) {
                if (order.getOrder_id().contains(id)) {
                    list.add(order);

                    break;
                }
            }
        }
        System.out.println(list);
        return list;
    }

}
