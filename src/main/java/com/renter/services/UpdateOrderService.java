package com.renter.services;

import com.renter.dao.GetOrderDao;
import com.renter.dao.UpdateOrderDao;
import com.renter.data.Order;

public class UpdateOrderService {
    private final UpdateOrderDao updateOrder = new UpdateOrderDao();

    public boolean doUpdateorder(Order update){
        return updateOrder.updateOrder(update);
    }
}
