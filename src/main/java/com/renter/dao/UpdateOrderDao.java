package com.renter.dao;

import com.renter.data.Order;
import com.renter.util.HbaseUtil;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

import java.io.IOException;

public class UpdateOrderDao {
    public boolean updateOrder(Order update) {
        Table table = HbaseUtil.getTable("HouseManager:house");
        try {
            Put put = new Put(Bytes.toBytes(update.getRow()));
            put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("order_id"), Bytes.toBytes(update.getOrder_id()));
            put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("house_id"), Bytes.toBytes(update.getHouse_id()));
            put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("price"), Bytes.toBytes(update.getPrice()));
            put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("startint_time"), Bytes.toBytes(update.getStartint_time()));
            put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("end_time"), Bytes.toBytes(update.getEnd_time()));
            put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("renting_status"), Bytes.toBytes(update.getRenting_status()));

            table.put(put);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return true;
    }
}
