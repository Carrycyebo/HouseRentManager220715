package com.renter.services;

import com.renter.dao.UpdateOrderDao;
import com.renter.dao.UpdateUserDao;
import com.renter.data.Order;
import com.renter.data.User;

public class UpdateUserService {
    private final UpdateUserDao updateUser = new UpdateUserDao();

    public boolean doUpdateUser(User update){
        return updateUser.updateUser(update);
    }

    public boolean doUpdateUserAdmin(User update){
        return updateUser.updateUserAdmin(update);
    }

    public boolean doCharge(User charge){
        return updateUser.reCharge(charge);
    }
}
