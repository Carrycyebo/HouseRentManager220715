package com.renter.services;

import com.renter.dao.ShowData;
import com.renter.data.Data;

import java.util.List;

public class ShowDataService {
    private final ShowData data = new ShowData();
    public List<Data> selectData(){
        return  data.selectData1();
    }
}
