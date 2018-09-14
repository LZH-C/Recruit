package com.lzh.mapper;

import java.util.List;

import com.lzh.common.pojo.InterviewItem;

public interface InterviewItemMapper {
	//获取待面试(用户)
	List<InterviewItem> getInvatedToUserInterview(int aid, int pageNumber, int pageSize);
	//获取待面试(企业)
	List<InterviewItem> getInvatedToEtInterview(int eid, int pageNumber, int pageSize);
	//获取面试通过(用户)
	List<InterviewItem> getPassToUserInterview(int aid, int pageNumber, int pageSize);
	//获取面试通过(企业)
	List<InterviewItem> getPassToEtInterview(int eid, int pageNumber, int pageSize);
	//获取面试失败(用户)
	List<InterviewItem> getFailToUserInterview(int aid, int pageNumber, int pageSize);
	//获取面试失败(企业)
	List<InterviewItem> getFailToEtInterview(int eid, int pageNumber, int pageSize);
	
	//获取职位收藏
	List<InterviewItem> getCollectedInterview(int aid, int pageNumber, int pageSize);
}
