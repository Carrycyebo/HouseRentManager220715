package services;

import dao.ShowData;
import data.User;

import java.util.List;

public class ShowDataService {
    private final ShowData data = new ShowData();
    public List<User> selectData(){
        return  data.selectData();
    }
}
