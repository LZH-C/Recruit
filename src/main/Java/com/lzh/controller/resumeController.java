package com.lzh.controller;

import com.lzh.common.entity.*;
import com.lzh.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lzh.common.pojo.RecruitResult;


@Controller
@RequestMapping("/ae/resume")
public class resumeController {
	@Autowired
	private ResumeService service;
	@Autowired
	private ApplicantService aservice;
	@Autowired
	private ApplicantintentionService aiservice;
	@Autowired
	private EduexperienceService eservice;
	@Autowired
	private WorkexperienceService wservice;
	
	@RequestMapping("/inresume/{aid}/{qid}")
	@ResponseBody
	public RecruitResult addResume(@PathVariable Integer aid,@PathVariable Integer qid) {
		InresumeKey resume=new InresumeKey();
		resume.setAid(aid);
		resume.setQid(qid);
		return service.addResume(resume);
	}
	
	@RequestMapping("/acceptresume/{aid}/{qid}")
	@ResponseBody
	public RecruitResult acceptResume(@PathVariable Integer aid,@PathVariable Integer qid) {
		AcceptresumeKey resume=new AcceptresumeKey();
		resume.setAid(aid);
		resume.setQid(qid);
		return service.acceptResume(resume);
	}
	
	@RequestMapping("/refuseresume/{aid}/{qid}")
	@ResponseBody
	public RecruitResult refuseResume(@PathVariable Integer aid,@PathVariable Integer qid) {
		RefuseresumeKey resume=new RefuseresumeKey();
		resume.setAid(aid);
		resume.setQid(qid);
		return service.refuseResume(resume);
	}
	@RequestMapping("/getNotDeal/{eid}/{pageNumber}/{pageSize}")
	@ResponseBody
	public RecruitResult getNotDealResumeByEid(@PathVariable Integer eid, @PathVariable Integer pageNumber, @PathVariable Integer pageSize) {
		return service.getNotDealResumeByEid(eid, pageNumber, pageSize);
	}
	
	@RequestMapping("/getAccept/{eid}/{pageNumber}/{pageSize}")
	@ResponseBody
	public RecruitResult getAcceptResumeByEid(@PathVariable Integer eid, @PathVariable Integer pageNumber, @PathVariable Integer pageSize) {
		return service.getAcceptResumeByEid(eid, pageNumber, pageSize);
	}
	
	@RequestMapping("/getRefuse/{eid}/{pageNumber}/{pageSize}")
	@ResponseBody
	public RecruitResult getRefuseResumeByEid(@PathVariable Integer eid, @PathVariable Integer pageNumber, @PathVariable Integer pageSize) {
		return service.getRefuseResumeByEid(eid, pageNumber, pageSize);
	}
	
	@RequestMapping("/getDealed/{eid}/{pageNumber}/{pageSize}")
	@ResponseBody
	public RecruitResult getDealedResumeByEid(@PathVariable Integer eid, @PathVariable Integer pageNumber, @PathVariable Integer pageSize) {
		return service.getDealedResumeByEid(eid, pageNumber, pageSize);
	}
	
	@RequestMapping("/getAll/{eid}/{pageNumber}/{pageSize}")
	@ResponseBody
	public RecruitResult getAllResumeByEid(@PathVariable Integer eid, @PathVariable Integer pageNumber, @PathVariable Integer pageSize) {
		return service.getAllResumeByEid(eid, pageNumber, pageSize);
	}
	
	//根据ID获取用户的基本信息页面
	@RequestMapping("/msg/{aid}/{qid}")
	public String getApplicantByIdToPage(@PathVariable Integer aid,@PathVariable Integer qid,Model model){
		Applicant applicant=aservice.getApplicantById(aid);
		Applicantintention applicantintention=aiservice.getApplicantintentionById(aid);
		Eduexperience eduexperience=eservice.getEduexperienceById(aid);
		Workexperience workexperience=wservice.getWorkexperienceById(aid);
		model.addAttribute("applicant", applicant);
		model.addAttribute("applicantintention", applicantintention);
		model.addAttribute("eduexperience", eduexperience);
		model.addAttribute("workexperience", workexperience);
		model.addAttribute("qid", qid);
		return "office-msg";
	};
	//根据ID获取用户的基本信息页面
	@RequestMapping("/msg/deal/{aid}/{qid}")
	public String getApplicantDealByIdToPage(@PathVariable Integer aid,@PathVariable Integer qid,Model model){
		Applicant applicant=aservice.getApplicantById(aid);
		Applicantintention applicantintention=aiservice.getApplicantintentionById(aid);
		Eduexperience eduexperience=eservice.getEduexperienceById(aid);
		Workexperience workexperience=wservice.getWorkexperienceById(aid);
		model.addAttribute("applicant", applicant);
		model.addAttribute("applicantintention", applicantintention);
		model.addAttribute("eduexperience", eduexperience);
		model.addAttribute("workexperience", workexperience);
		model.addAttribute("qid", qid);
		return "office-msg-deal";
	};
	
	//根据ID获取用户的基本信息页面
	@RequestMapping("/msg2/{aid}/{qid}")
	public String getApplicantByIdToPagetoInterview(@PathVariable Integer aid,@PathVariable Integer qid,Model model){
		Applicant applicant=aservice.getApplicantById(aid);
		Applicantintention applicantintention=aiservice.getApplicantintentionById(aid);
		Eduexperience eduexperience=eservice.getEduexperienceById(aid);
		Workexperience workexperience=wservice.getWorkexperienceById(aid);
		model.addAttribute("applicant", applicant);
		model.addAttribute("applicantintention", applicantintention);
		model.addAttribute("eduexperience", eduexperience);
		model.addAttribute("workexperience", workexperience);
		model.addAttribute("qid", qid);
		return "interview-msg";
	};
	
	//根据ID获取用户的基本信息页面
	@RequestMapping("/msg3/{aid}/{qid}")
	public String getDealInterview(@PathVariable Integer aid,@PathVariable Integer qid,Model model){
		Applicant applicant=aservice.getApplicantById(aid);
		Applicantintention applicantintention=aiservice.getApplicantintentionById(aid);
		Eduexperience eduexperience=eservice.getEduexperienceById(aid);
		Workexperience workexperience=wservice.getWorkexperienceById(aid);
		model.addAttribute("applicant", applicant);
		model.addAttribute("applicantintention", applicantintention);
		model.addAttribute("eduexperience", eduexperience);
		model.addAttribute("workexperience", workexperience);
		model.addAttribute("qid", qid);
		return "interview-deal-msg";
	};
	
	//删除简历信息
	@RequestMapping("/msg/delete/auser/{aid}")
	@ResponseBody
	public RecruitResult deleteResumeByAid(@PathVariable Integer aid){
		return service.deleteResumeByAid(aid);
	}
	//获取未处理简历的数量
	@RequestMapping("/getCount/resume/{eid}")
	@ResponseBody
	RecruitResult getCountResume(@PathVariable Integer eid){
		RecruitResult result=service.getCountResume(eid);
		return result;
	}
	//获取所有简历的数量
	@RequestMapping("/getAllCount/resume/{eid}")
	@ResponseBody
	RecruitResult getAllCountResume(@PathVariable Integer eid){
		return service.getAllCountResume(eid);
	}
}
