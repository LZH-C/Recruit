package com.lzh.mapper;

import java.util.List;

import com.lzh.pojo.DiscussResult;

public interface DiscussItemMapper {
	//获取讨论职位主题的所有主讨论信息
	List<DiscussResult> getDiscussTopicMsgByApplicant();
	List<DiscussResult> getDiscussTopicMsgByEnterprise();
	//获取讨论回复的所有讨论信息
	List<DiscussResult> getDiscussSecondMsgByApplicant();
	List<DiscussResult> getDiscussSecondMsgByEnterprise();
	
	//获取讨论职位主题的单个主讨论信息
	DiscussResult getDiscussTopicMsgByApplicant1(int id);
	DiscussResult getDiscussTopicMsgByEnterprise1(int id);
	//获取讨论回复的单个讨论信息
	DiscussResult getDiscussSecondMsgByApplicant1(int id);
	DiscussResult getDiscussSecondMsgByEnterprise1(int id);
	
}
