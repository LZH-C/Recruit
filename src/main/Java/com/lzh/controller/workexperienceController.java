package com.lzh.controller;

import com.lzh.common.entity.Workexperience;
import com.lzh.service.WorkexperienceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lzh.common.pojo.EasyUIDataGridResult;;

@Controller
@RequestMapping("/ae/workexperience")
public class workexperienceController {
	
	@Autowired
	private WorkexperienceService service;
	
	//根据ID获取用户的工作经历信息
	@RequestMapping("/msg/{aid}")
	public String getEduexperienceById(@PathVariable Integer aid,Model model){
		Workexperience workexperience=service.getWorkexperienceById(aid);
		model.addAttribute("workexperience", workexperience);
		return "workexperience-msg";
	};
	
	@RequestMapping("/getmsg/{aid}")
	@ResponseBody
	public Workexperience getEduexperienceById(@PathVariable Integer aid){
		Workexperience workexperience=service.getWorkexperienceById(aid);
		return workexperience;
	};

	//获取所有用户的工作经历信息（分页查询）
	@RequestMapping("/msg/list")
	@ResponseBody
	public EasyUIDataGridResult getWorkexperienceList(Integer page,Integer rows){
		EasyUIDataGridResult result=service.getWorkexperienceList(page, rows);
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
	public void insertWorkexperience(Workexperience workexperience){
		workexperience.setCheckstate(0);
		service.newWorkexperienceMsg(workexperience);
	}
	
	//保存用户信息
	@RequestMapping("/msg/save")
	@ResponseBody
	public void saveWorkexperience(Workexperience msg){
		service.updateWorkexperience(msg);
	}
			
	//删除用户基本信息
	@RequestMapping("/msg/delete")
	@ResponseBody
	public void deleteWorkexperience(Integer aid){
		service.deleteWorkexperienceById(aid);
	}
}
