package com.lzh.controller;


import com.lzh.common.entity.Applicant;
import com.lzh.service.ApplicantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lzh.common.pojo.EasyUIDataGridResult;

@Controller
@RequestMapping("/ae/applicant")
public class applicantController {
	@Autowired
	private ApplicantService service;
	
	//根据ID获取用户的基本信息页面
	@RequestMapping("/msg/{aid}")
	public String getApplicantByIdToPage(@PathVariable Integer aid,Model model){
		Applicant applicant=service.getApplicantById(aid);
		model.addAttribute("applicant", applicant);
		return "applicant-msg";
	};
	
	//根据ID获取用户的基本信息的数据
	@RequestMapping("/getmsg/{aid}")
	@ResponseBody
	public Applicant getApplicantByIdToPage(@PathVariable Integer aid){
		return service.getApplicantById(aid);
	};
	
	
	//获取所有用户的基本信息（分页查询）
	@RequestMapping("/msg/list")
	@ResponseBody
	public EasyUIDataGridResult getApplicantList(Integer page,Integer rows){
		EasyUIDataGridResult result=service.getApplicantList(page, rows);
		return result;
	}
	
	//根据aid,result 审核是否通过
	@RequestMapping("/toexamine")
	public void toExamineById(Integer aid , Integer result){
		service.toExamineById(aid,result);
	}
	
	//新建用户信息
	@RequestMapping("/msg/insert")
	@ResponseBody
	public void insertApplicant(Applicant applicant){
		applicant.setCheckstate(0);
		service.newApplicantMsg(applicant);
	}
	
	//保存用户信息
	@RequestMapping("/msg/save")
	@ResponseBody
	public void saveApplicant(Applicant applicant){
		service.updateApplicant(applicant);
	}
		
	//删除用户基本信息
	@RequestMapping("/msg/delete")
	@ResponseBody
	public void deleteApplicant(Integer aid){
		service.deleteApplicantById(aid);
	}

}
