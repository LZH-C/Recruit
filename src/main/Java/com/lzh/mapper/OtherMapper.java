package com.lzh.mapper;

import com.lzh.pojo.EduResult;
import com.lzh.pojo.IntentionResult;
import com.lzh.pojo.WorkResult;

import java.util.List;



public interface OtherMapper {
	
	//获取用户部分信息
	IntentionResult selectIntentionResultById(int id);
	EduResult selectEduResultById(int id);
	WorkResult selectWorkResultById(int id);
	
	//获取全部用户部分信息
	List<IntentionResult> selectIntentionResult();
	List<EduResult> selectEduResult();
	List<WorkResult> selectWorkResult();
	
}
