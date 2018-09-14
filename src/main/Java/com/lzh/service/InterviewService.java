package com.lzh.service;

import com.lzh.common.entity.Interview;
import com.lzh.common.pojo.RecruitResult;

public interface InterviewService {
	//获取所有面试
	RecruitResult getAllToUserInterview(int aid, int pageNumber, int pageSize);
	//获取所有面试
	RecruitResult getAllToEtInterview(int eid, int pageNumber, int pageSize);
	
	//获取待面试(用户)
	RecruitResult getInvatedToUserInterview(int aid, int pageNumber, int pageSize);
	//获取待面试(企业)
	RecruitResult getInvatedToEtInterview(int eid, int pageNumber, int pageSize);
	//获取面试通过(用户)
	RecruitResult getPassToUserInterview(int aid, int pageNumber, int pageSize);
	//获取面试通过(企业)
	RecruitResult getPassToEtInterview(int eid, int pageNumber, int pageSize);
	//获取面试失败(用户)
	RecruitResult getFailToUserInterview(int aid, int pageNumber, int pageSize);
	//获取面试失败(企业)
	RecruitResult getFailToEtInterview(int eid, int pageNumber, int pageSize);
		
	//面试成功
	RecruitResult interviewSuccess(Interview interview);
	//面试失败
	RecruitResult interviewFail(Interview interview);
	
	//发表心得
	RecruitResult addExperience(Interview interview);
}
