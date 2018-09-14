package com.lzh.common.entity;

import java.util.Date;

public class Eduexperience {
    private Integer aid;

    private Date begintime;

    private Date endtime;

    private String degree;

    private String school;

    private Integer checkstate;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Date getBegintime() {
        return begintime;
    }

    public void setBegintime(Date begintime) {
        this.begintime = begintime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree == null ? null : degree.trim();
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school == null ? null : school.trim();
    }

    public Integer getCheckstate() {
        return checkstate;
    }

    public void setCheckstate(Integer checkstate) {
        this.checkstate = checkstate;
    }
}