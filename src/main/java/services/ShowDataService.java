package services;

import dao.ShowData;
import data.MyData;

import java.util.List;

public class ShowDataService {
    private ShowData data = new ShowData();
    public List<MyData> seleteData(){
        return  data.seleteData();
    }
}
