package com.renter.util;

import com.renter.data.Data;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.util.Bytes;

import java.io.IOException;
import java.util.List;

public class HbaseUtil {
    static Configuration conf = HBaseConfiguration.create();
    static Connection conn = null;
    static Table table = null ;
    static {
        try {
            conn = ConnectionFactory.createConnection(conf);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    //获取Table对象
    public static Table getTable(String tableName){
        try {
            TableName user = TableName.valueOf(tableName);
            if (conn!= null){
                table = conn.getTable(user);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return table ;
    }

    public static  void close(){
        try {
            if (table != null){
                table.close();
            }
            if (conn != null){
                conn.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
