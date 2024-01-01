package com.renter.data;

import java.util.List;

public class User {
    public User(String email, String name, String passwd, String phone, String money, List<String> orderIds) {
        this.name = name;
        this.passwd = passwd;
        this.email = email;
        this.phone = phone;
        this.orderIds = orderIds;
        this.money = money;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public List<String> getOrderIds() {
        return orderIds;
    }

    public void setOrderIds(List<String> orderIds) {
        this.orderIds = orderIds;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }


    private String name;
    private String passwd;
    private String email;
    private String phone;
    private List<String> orderIds;
    private String money;



    public User(String name, String passwd, String email) {
        this.name = name;
        this.passwd = passwd;
        this.email = email;
    }
    public User(){

    }
}
