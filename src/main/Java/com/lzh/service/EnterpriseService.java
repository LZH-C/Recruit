package com.lzh.service;


import com.lzh.common.entity.Enterprise;
import com.lzh.common.pojo.EasyUIDataGridResult;

public interface EnterpriseService {
	//根据ID获取企业用户信息
	Object getEnterpriseById(Integer eid);
	//获取所有企业用户的信息（分页查询）
	EasyUIDataGridResult getEnterpriseList(int page, int rows);
	//根据id 审核企业用户是否通过
	void toExamineById(int eid, int result);
	//新建企业用户基本信息
	void newEnterpriseMsg(Enterprise enterprise);
	//修改企业用基本信息
	void updateEnterprise(Enterprise enterprise);
}
