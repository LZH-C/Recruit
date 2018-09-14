package com.lzh.controller;


import com.lzh.common.entity.Applicantintention;
import com.lzh.service.ApplicantintentionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lzh.common.pojo.EasyUIDataGridResult;

@Controller
@RequestMapping("/ae/applicantintention")
public class applicantintentionController {
	
	@Autowired
	private ApplicantintentionService service;
	
	//根据ID获取用户的求职意向信息
	@RequestMapping("/msg/{aid}")
	public String getApplicantIntentionById(@PathVariable Integer aid,Model model){
		Applicantintention applicantintention=service.getApplicantintentionById(aid);
		model.addAttribute("applicantintention", applicantintention);
		return "applicantintention-msg";
	};

	//根据ID获取用户的求职意向信息
		@RequestMapping("/getmsg/{aid}")
		@ResponseBody
		public Applicantintention getApplicantIntentionById(@PathVariable Integer aid){
			Applicantintention applicantintention=service.getApplicantintentionById(aid);
			return applicantintention;
		};
	
	//获取所有用户的求职意向信息（分页查询）
	@RequestMapping("/msg/list")
	@ResponseBody
	public EasyUIDataGridResult getApplicantIntentionList(Integer page,Integer rows){
		EasyUIDataGridResult result=service.getApplicantIntentionList(page, rows);
		return result;
	}
	
	//根据aid,result 审核是否通过
	@RequestMapping("/toexamine")
	public void toExamineById(Integer aid , Integer result){
		service.toExamineById(aid,result);
	}
	
	//新建基本信息
	@RequestMapping("/msg/insert")
	@ResponseBody
	public void insertApplicantintention(Applicantintention applicantintention){
		applicantintention.setCheckstate(0);
		service.newApplicantintentionMsg(applicantintention);
	}
	
	//保存求职意向信息
	@RequestMapping("/msg/save")
	@ResponseBody
	public void Applicantintention(Applicantintention msg){
		service.updateApplicantintention(msg);
	}
			
	//删除求职意向信息
	@RequestMapping("/msg/delete")
	@ResponseBody
	public void deleteApplicantintention(Integer aid){
		service.deleteApplicantintentionById(aid);
	}

}
