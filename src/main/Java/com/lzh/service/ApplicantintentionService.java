package com.lzh.service;


import com.lzh.common.entity.Applicantintention;
import com.lzh.common.pojo.EasyUIDataGridResult;
import com.lzh.common.pojo.RecruitResult;

public interface ApplicantintentionService {
	
	//根据id获取用户的求职意向信息
	Applicantintention getApplicantintentionById(int aid);
	
	//获取所有用户的求职意向信息（分页查询）
	EasyUIDataGridResult getApplicantIntentionList(int page, int rows);
	
	//根据id 审核用户是否通过
	void toExamineById(int aid, int result);
	
	//新建基本信息
	void newApplicantintentionMsg(Applicantintention applicantintention);
	
	//修改求职意向信息
	RecruitResult updateApplicantintention(Applicantintention applicantintention);
	
	//删除用户求职意向信息
	void deleteApplicantintentionById(int aid);
}
