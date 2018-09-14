package com.lzh.service;

import com.lzh.common.entity.Workexperience;
import com.lzh.common.pojo.EasyUIDataGridResult;
import com.lzh.common.pojo.RecruitResult;

public interface WorkexperienceService {
	
	//根据id获取用户的工作经历信息
	Workexperience getWorkexperienceById(int aid);
	
	//获取所有用户的工作经历信息（分页查询）
	EasyUIDataGridResult getWorkexperienceList(int page, int rows);
	
	//根据id 审核企业用户是否通过
	void toExamineById(int aid, int result);
	
	//新建基本信息
	void newWorkexperienceMsg(Workexperience workexperience);
	
	//保存工作经历信息
	RecruitResult updateWorkexperience(Workexperience workexperience);
		
	//删除工作经历信息
	void deleteWorkexperienceById(Integer aid);
}
