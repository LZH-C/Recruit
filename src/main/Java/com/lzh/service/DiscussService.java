package com.lzh.service;

import com.lzh.common.pojo.EasyUIDataGridResult;

public interface DiscussService {
	//获取所有讨论的信息（分页查询）
	EasyUIDataGridResult getDiscussList(int page, int rows);
	//根据id 审核讨论信息是否通过
	void toExamineById(int did, int result);

}
