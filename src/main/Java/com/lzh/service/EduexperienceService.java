package com.lzh.service;


import com.lzh.common.entity.Eduexperience;
import com.lzh.common.pojo.EasyUIDataGridResult;
import com.lzh.common.pojo.RecruitResult;

public interface EduexperienceService {
	
	//根据id获取用户的教育经历信息
	Eduexperience getEduexperienceById(int aid);
	
	//获取所有用户的教育经历信息（分页查询）
	EasyUIDataGridResult getEduexperienceList(int page, int rows);
	
	//根据id 审核企业用户是否通过
	void toExamineById(int aid, int result);
	
	//新建基本信息
	void newEduexperienceMsg(Eduexperience eduexperience);
	
	//修改教育经历信息
	RecruitResult updateEduexperience(Eduexperience eduexperience);
		
	//删除教育经历信息
	void deleteEduexperienceById(int aid);
}
