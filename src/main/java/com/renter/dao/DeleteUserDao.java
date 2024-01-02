package com.renter.dao;

import com.renter.data.User;
import com.renter.util.HbaseUtil;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

import java.io.IOException;

public class DeleteUserDao {

    public boolean deleteUser(User deleteUser) {
        Table table = HbaseUtil.getTable("HouseManager:user");

        Delete delete1 = new Delete(Bytes.toBytes(deleteUser.getEmail()));
        try {
            table.delete(delete1);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return true;
    }

}
