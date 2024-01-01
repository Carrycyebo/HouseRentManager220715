package com.renter.dao;

import com.renter.data.Data;
import com.renter.data.Order;
import com.renter.util.HbaseUtil;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class GetOrderDao {
    public List<Order> getOrder() {
        List<Order> list = new ArrayList<>();
        Table table = HbaseUtil.getTable("HouseManager:house");
        try {
            ResultScanner scanner = table.getScanner(new Scan());
            Order order = null;
            for (Result result : scanner) {
                String rowKey = Bytes.toString(result.getRow());
                String order_id = null;
                String house_id = null;
                String price = null;
                String startint_time = null;
                String end_time = null;
                String renting_status = null;
                while (result.advance()) {
                    Cell cell = result.current();
                    byte[] family = CellUtil.cloneFamily(cell);
                    byte[] qualifier = CellUtil.cloneQualifier(cell);
                    byte[] value = CellUtil.cloneValue(cell);
                    String column = Bytes.toString(family) + ":" + Bytes.toString(qualifier);

                    switch (column) {
                        case "info:order_id":
                            order_id = Bytes.toString(value);
                            break;
                        case "info:house_id":
                            house_id = Bytes.toString(value);
                            break;
                        case "info:price":
                            price = Bytes.toString(value);
                            break;
                        case "info:startint_time":
                            startint_time = Bytes.toString(value);
                            break;
                        case "info:end_time":
                            end_time = Bytes.toString(value);
                            break;
                        case "info:renting_status":
                            renting_status = Bytes.toString(value);
                            break;
                    }
                }
                // 一行数据遍历结束后，创建一个 Order 对象，并将其加入列表中
                order = new Order(rowKey, order_id, house_id, price, startint_time, end_time, renting_status);
                list.add(order);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}