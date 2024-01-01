package com.renter.data;

public class Order {
    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getHouse_id() {
        return house_id;
    }

    public void setHouse_id(String house_id) {
        this.house_id = house_id;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getStartint_time() {
        return startint_time;
    }

    public void setStartint_time(String startint_time) {
        this.startint_time = startint_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public String getRenting_status() {
        return renting_status;
    }

    public void setRenting_status(String renting_status) {
        this.renting_status = renting_status;
    }

    private String order_id;
    private String house_id;
    private String price;
    private String startint_time;
    private String end_time;
    private String renting_status;

    public Order(String order_id, String house_id, String price, String startint_time, String end_time, String renting_status) {
        this.order_id = order_id;
        this.house_id = house_id;
        this.price = price;
        this.startint_time = startint_time;
        this.end_time = end_time;
        this.renting_status = renting_status;
    }
}
