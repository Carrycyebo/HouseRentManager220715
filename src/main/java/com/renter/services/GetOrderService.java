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
}
