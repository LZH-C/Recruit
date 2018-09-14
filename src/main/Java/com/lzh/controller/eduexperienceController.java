package com.lzh.controller;


import com.lzh.common.entity.Eduexperience;
import com.lzh.service.EduexperienceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lzh.common.pojo.EasyUIDataGridResult;

@Controller
@RequestMapping("/ae/eduexperience")
public class eduexperienceController {
	
	@Autowired
	private EduexperienceService service;
	
	//根据ID获取用户的教育经历信息
	@RequestMapping("/msg/{aid}")
	public String getEduexperienceById(@PathVariable Integer aid,Model model){
		Eduexperience eduexperience=service.getEduexperienceById(aid);
		model.addAttribute("eduexperience", eduexperience);
		return "eduexperience-msg";
	};
	
	//根据ID获取用户的教育经历信息
	@RequestMapping("/getmsg/{aid}")
	@ResponseBody
	public Eduexperience getEduexperienceById(@PathVariable Integer aid){
		Eduexperience eduexperience=service.getEduexperienceById(aid);
		return eduexperience;
	};
	
	//获取所有用户的教育经历信息（分页查询）
	@RequestMapping("/msg/list")
	@ResponseBody
	public EasyUIDataGridResult getEduexperienceList(Integer page,Integer rows){
		EasyUIDataGridResult result=service.getEduexperienceList(page, rows);
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
	public void insertEduexperience(Eduexperience eduexperience){
		eduexperience.setCheckstate(0);
		service.newEduexperienceMsg(eduexperience);
	}
	
	//保存用户信息
	@RequestMapping("/msg/save")
	@ResponseBody
	public void saveEduexperience(Eduexperience msg){
		service.updateEduexperience(msg);
	}
			
	//删除用户基本信息
	@RequestMapping("/msg/delete")
	@ResponseBody
	public void deleteEduexperience(Integer aid){
		service.deleteEduexperienceById(aid);
	}

}
