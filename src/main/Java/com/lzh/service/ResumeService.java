package com.lzh.service;

import com.lzh.common.entity.AcceptresumeKey;
import com.lzh.common.entity.InresumeKey;
import com.lzh.common.entity.RefuseresumeKey;
import com.lzh.common.pojo.RecruitResult;


public interface ResumeService {
	//添加一份简历到待处理简历表：即投简历
	public RecruitResult addResume(InresumeKey resume);
	//添加一份简历到接受简历表：接受一份简历
	public RecruitResult acceptResume(AcceptresumeKey resume);
	//添加一份简历到拒绝简历表：拒绝一份简历
	public RecruitResult refuseResume(RefuseresumeKey resume);
	//获取未处理的简历
	public RecruitResult getNotDealResumeByEid(int eid, int pageNumber, int pageSize);
	//获取接受的简历
	public RecruitResult getAcceptResumeByEid(int eid, int pageNumber, int pageSize);
	//获取拒绝的简历
	public RecruitResult getRefuseResumeByEid(int eid, int pageNumber, int pageSize);
	//获取已处理的简历
	public RecruitResult getDealedResumeByEid(int eid, int pageNumber, int pageSize);
	//获取所有的简历
	public RecruitResult getAllResumeByEid(int eid, int pageNumber, int pageSize);
	//删除简历
	public RecruitResult deleteResumeByAid(int aid);
	//获取未查看的简历的数量
	public RecruitResult getCountResume(int eid);
	//获取所有简历的数量
	public RecruitResult getAllCountResume(int eid);
}
