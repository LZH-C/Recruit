package com.lzh.service;


import com.lzh.common.entity.Applicant;
import com.lzh.common.pojo.EasyUIDataGridResult;
import com.lzh.common.pojo.RecruitResult;

public interface ApplicantService {
	
	//根据id获取用户的基本信息
	Applicant getApplicantById(int aid);
	
	//获取所有用户的基本信息（分页查询）
	EasyUIDataGridResult getApplicantList(int page, int rows);
	
	//根据id 审核用户是否通过
	void toExamineById(int aid, int result);
	
	//新建用户基本信息
	void newApplicantMsg(Applicant applicant);
	
	//修改用基本信息
	RecruitResult updateApplicant(Applicant applicant);
	
	//删除用户基本信息
	void deleteApplicantById(int aid);
	
	
}
