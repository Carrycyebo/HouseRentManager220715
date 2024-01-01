package com.renter.data;

import java.util.List;

public class User {
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

    public List<Integer> getOrderIds() {
        return orderIds;
    }

    public void setOrderIds(List<Integer> orderIds) {
        this.orderIds = orderIds;
    }


    private String name;
    private String passwd;
    private String email;
    private String phone;
    private List<Integer> orderIds;

    public User(String name, String passwd, String email) {
        this.name = name;
        this.passwd = passwd;
        this.email = email;
    }
    public User(){

    }
}
