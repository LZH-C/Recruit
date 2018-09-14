package com.lzh.controller;

import com.lzh.common.entity.Interview;
import com.lzh.service.InterviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lzh.common.pojo.RecruitResult;

@Controller
@RequestMapping("/ae/interview")
public class interviewController {
	
	@Autowired
	private InterviewService service;
	
	//获取邀请面试
	@RequestMapping("/get/invated/user/{aid}/{pageNumber}/{pageSize}")
	@ResponseBody
	public RecruitResult getHadInterview(@PathVariable Integer aid,@PathVariable Integer pageNumber,@PathVariable Integer pageSize){
		return service.getInvatedToUserInterview(aid, pageNumber, pageSize);
	}
	
	//获取待面试
	@RequestMapping("/get/invated/et/{eid}/{pageNumber}/{pageSize}")
	@ResponseBody
	public RecruitResult getReadyInterview(@PathVariable Integer eid,@PathVariable Integer pageNumber,@PathVariable Integer pageSize) {
		return service.getInvatedToEtInterview(eid, pageNumber, pageSize);
	}
	
	//获取面试成功
	@RequestMapping("/get/success/user/{aid}/{pageNumber}/{pageSize}")
	@ResponseBody
	public RecruitResult getSuccessTOaInterview(@PathVariable Integer aid,@PathVariable Integer pageNumber,@PathVariable Integer pageSize) {
		return service.getPassToUserInterview(aid, pageNumber, pageSize);
	}
		
	//获取面试成功
	@RequestMapping("/get/success/et/{eid}/{pageNumber}/{pageSize}")
	@ResponseBody
	public RecruitResult getSuccessInterview(@PathVariable Integer eid,@PathVariable Integer pageNumber,@PathVariable Integer pageSize) {
		return service.getPassToEtInterview(eid, pageNumber, pageSize);
	}
		
	//获取面试失败
	@RequestMapping("/get/fail/user/{aid}/{pageNumber}/{pageSize}")
	@ResponseBody
	public RecruitResult getFailToaInterview(@PathVariable Integer aid,@PathVariable Integer pageNumber,@PathVariable Integer pageSize) {
		return service.getFailToUserInterview(aid, pageNumber, pageSize);
	}
		
	//获取面试失败
	@RequestMapping("/get/fail/et/{eid}/{pageNumber}/{pageSize}")
	@ResponseBody
	public RecruitResult getFailInterview(@PathVariable Integer eid,@PathVariable Integer pageNumber,@PathVariable Integer pageSize) {
		return service.getFailToEtInterview(eid, pageNumber, pageSize);
	}
		
	//获取所有面试
	@RequestMapping("/get/all/user/{aid}/{pageNumber}/{pageSize}")
	@ResponseBody
	public RecruitResult getAllToAInterview(@PathVariable Integer aid,@PathVariable Integer pageNumber,@PathVariable Integer pageSize){
		return service.getAllToUserInterview(aid, pageNumber, pageSize);
	}
		
	//获取所有面试
	@RequestMapping("/get/all/et/{eid}/{pageNumber}/{pageSize}")
	@ResponseBody
	public RecruitResult getAllInterview(@PathVariable Integer eid,@PathVariable Integer pageNumber,@PathVariable Integer pageSize){
		return service.getAllToEtInterview(eid, pageNumber, pageSize);
	}
	
	//面试成功
	@RequestMapping("/success/{aid}/{qid}")
	@ResponseBody
	RecruitResult interviewSuccess(@PathVariable Integer aid, @PathVariable Integer qid, Interview interview){
		interview.setAid(aid);
		interview.setQid(qid);
		return service.interviewSuccess(interview);	
	}
	//面试失败
	@RequestMapping("/fail/{aid}/{qid}")
	@ResponseBody
	RecruitResult interviewFail(@PathVariable Integer aid,@PathVariable Integer qid,Interview interview){
		interview.setAid(aid);
		interview.setQid(qid);
		return service.interviewFail(interview);
	}
	
	//添加心得
	@RequestMapping("/add/experience")
	@ResponseBody
	RecruitResult addexperience(Interview interview){
		return service.addExperience(interview);
	}
}
