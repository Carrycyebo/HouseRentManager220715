package com.renter.data;

public class Admin {

    public Admin(String name, String passwd) {
        this.name = name;
        this.passwd = passwd;
    }

    private String name;
    private String passwd;


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


}

