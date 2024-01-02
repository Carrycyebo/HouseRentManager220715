package com.renter.services;

import com.renter.dao.DeleteUserDao;
import com.renter.dao.GetOrderDao;
import com.renter.data.User;

public class DeleteUserService {
    private final DeleteUserDao deleteUser = new DeleteUserDao();
    public boolean DeleteUser(User delete){
        return deleteUser.deleteUser(delete);
    }
}
