package com.renter.dao;

import com.renter.data.Data;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import com.renter.util.HbaseUtil;

import java.util.ArrayList;
import java.util.List;

public class ShowData {
    //查所有result2表
    public List<Data> selectData1(){
        List<Data> list1 = new ArrayList<Data>();
        Table result1 = HbaseUtil.getTable("HouseManager:rent_count1");
        try {
                ResultScanner scanner = result1.getScanner(new Scan());
                for(Result result : scanner){
                    while (result.advance()){
                        Cell cell = result.current();
                        //小区
                        String row = Bytes.toString(CellUtil.cloneRow(cell));
                        //每个小区房屋个数
                        double value = Double.parseDouble(Bytes.toString(CellUtil.cloneValue(cell)));
                        Data data =  new Data(row, value);
                        list1.add(data);
                    }
                }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return  list1;
    }

    public List<Data> selectData2(){
        List<Data> list2 = new ArrayList<Data>();
        Table result1 = HbaseUtil.getTable("HouseManager:rent_count2");
        try {
            ResultScanner scanner = result1.getScanner(new Scan());
            for(Result result : scanner){
                while (result.advance()){
                    Cell cell = result.current();

                    String name = Bytes.toString(CellUtil.cloneRow(cell));

                    double value = Double.parseDouble(Bytes.toString(CellUtil.cloneValue(cell)));
                    Data data =  new Data(name, value);
                    list2.add(data);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return  list2;
    }
}
