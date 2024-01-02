package com.renter.dao;

import com.renter.data.Order;
import com.renter.data.User;
import com.renter.util.HbaseUtil;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

import java.io.IOException;

public class UpdateUserDao {
    public boolean updateUser(User update) {
        Table table = HbaseUtil.getTable("HouseManager:user");
        try {
            Put put = new Put(Bytes.toBytes(update.getEmail()));
            put.addColumn(Bytes.toBytes("info"),Bytes.toBytes("uname"),Bytes.toBytes(update.getName()));
            put.addColumn(Bytes.toBytes("info"),Bytes.toBytes("passwd"),Bytes.toBytes(update.getPasswd()));
            put.addColumn(Bytes.toBytes("info"),Bytes.toBytes("phone"),Bytes.toBytes(update.getPhone()));

            table.put(put);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return true;
    }

    public boolean updateUserAdmin(User update) {
        Table table = HbaseUtil.getTable("HouseManager:user");
        try {
            Put put = new Put(Bytes.toBytes(update.getEmail()));
            put.addColumn(Bytes.toBytes("info"),Bytes.toBytes("uname"),Bytes.toBytes(update.getName()));
            put.addColumn(Bytes.toBytes("info"),Bytes.toBytes("passwd"),Bytes.toBytes(update.getPasswd()));
            put.addColumn(Bytes.toBytes("info"),Bytes.toBytes("phone"),Bytes.toBytes(update.getPhone()));
            put.addColumn(Bytes.toBytes("info"),Bytes.toBytes("money"),Bytes.toBytes(update.getMoney()));
            put.addColumn(Bytes.toBytes("info"),Bytes.toBytes("orderIds"),Bytes.toBytes(update.getOrderIds().toString().replace("[", "").replace("]", "")));
            table.put(put);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return true;
    }


    public boolean reCharge(User charge){
        Table table = HbaseUtil.getTable("HouseManager:user");
        try {
            Put put = new Put(Bytes.toBytes(charge.getEmail()));
            put.addColumn(Bytes.toBytes("info"),Bytes.toBytes("money"),Bytes.toBytes(charge.getMoney()));

            table.put(put);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return true;
    }

    public boolean rentHouse(User charge){
        Table table = HbaseUtil.getTable("HouseManager:user");
        try {
            Put put = new Put(Bytes.toBytes(charge.getEmail()));
            put.addColumn(Bytes.toBytes("info"),Bytes.toBytes("money"),Bytes.toBytes(charge.getMoney()));
            put.addColumn(Bytes.toBytes("info"),Bytes.toBytes("orderIds"),Bytes.toBytes(charge.getOrderIds().toString().replace("[", "").replace("]", "")));
            table.put(put);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return true;
    }
}
