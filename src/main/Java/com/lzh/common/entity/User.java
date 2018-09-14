package com.lzh.common.entity;

import com.lzh.common.util.MD5Utils;

import java.util.Date;

public class User {
    private Integer id;

    private String username;

    private String pwd;

    private String email;

    private Boolean isenterprise;

    private Date time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        pwd= MD5Utils.encrypty(pwd);
        this.pwd = pwd == null ? null : pwd.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Boolean getIsenterprise() {
        return isenterprise;
    }

    public void setIsenterprise(Boolean isenterprise) {
        this.isenterprise = isenterprise;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}