package com.lzh.mapper;

import java.util.List;

import com.lzh.common.pojo.Miniresume;

public interface ResumeMapper {
	//获取未处理的简历
	public List<Miniresume> getNotDealResumeByEid(int eid, int pageNumber, int pageSize);
	//获取接受的简历
	public List<Miniresume> getAcceptResumeByEid(int eid, int pageNumber, int pageSize);
	//获取拒绝的简历
	public List<Miniresume> getRefuseResumeByEid(int eid, int pageNumber, int pageSize);
	//获取待面试的简历
	public List<Miniresume> getreadyResume(int eid, int pageNumber, int pageSize);
	//获取面试处理的简历
	public List<Miniresume> getDealResumeToOk(int eid, int pageNumber, int pageSize);
	//获取面试处理的简历
	public List<Miniresume> getDealResumeToFail(int eid, int pageNumber, int pageSize);
	//获取未查看的简历的数量
	public Integer getCountResume(int eid);
	//获取所有简历的数量
	public Integer getAllCountResume(int eid);
}
