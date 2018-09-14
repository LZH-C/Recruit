package com.lzh.common.entity;

import java.util.Date;

public class Quarters {
    private Integer qid;

    private Integer eid;

    private String name;

    private String type;

    private String quality;

    private String region;

    private Integer lsalary;

    private Integer msalary;

    private Date endtime;

    private Integer num;

    private String experience;

    private String edu;

    private String synopsis;

    private Integer checkstate;

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getQuality() {
        return quality;
    }

    public void setQuality(String quality) {
        this.quality = quality == null ? null : quality.trim();
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region == null ? null : region.trim();
    }

    public Integer getLsalary() {
        return lsalary;
    }

    public void setLsalary(Integer lsalary) {
        this.lsalary = lsalary;
    }

    public Integer getMsalary() {
        return msalary;
    }

    public void setMsalary(Integer msalary) {
        this.msalary = msalary;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience == null ? null : experience.trim();
    }

    public String getEdu() {
        return edu;
    }

    public void setEdu(String edu) {
        this.edu = edu == null ? null : edu.trim();
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis == null ? null : synopsis.trim();
    }

    public Integer getCheckstate() {
        return checkstate;
    }

    public void setCheckstate(Integer checkstate) {
        this.checkstate = checkstate;
    }
}