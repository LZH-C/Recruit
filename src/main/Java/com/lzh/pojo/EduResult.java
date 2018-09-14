package com.lzh.pojo;

import java.util.Date;

public class EduResult {
	 private Integer aid;

	 private Date begintime;

	 private Date endtime;

	 private String degree;

	 private String school;

	 private Integer checkstate;
	 
	 private String name;

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
		this.degree = degree;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public Integer getCheckstate() {
		return checkstate;
	}

	public void setCheckstate(Integer checkstate) {
		this.checkstate = checkstate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	    
	    
}
