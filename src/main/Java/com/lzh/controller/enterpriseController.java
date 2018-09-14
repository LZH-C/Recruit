package com.lzh.controller;


import com.lzh.common.entity.Enterprise;
import com.lzh.service.EnterpriseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lzh.common.pojo.EasyUIDataGridResult;


@Controller
@RequestMapping("/ae/enterprise")
public class enterpriseController {
	@Autowired
	private EnterpriseService service;
	
	//根据ID获取企业用户信息
	@RequestMapping("/msg/{eid}")
	public String getenterpriseById(@PathVariable Integer eid,Model model) {
		Object enterprise=service.getEnterpriseById(eid);
		if(enterprise==null){
			return "enterprise-msg-create";
		}
		model.addAttribute("enterprise",enterprise);
		return "enterprise-msg";
	}
	
	//根据ID获取企业用户信息
	@RequestMapping("/getmsg/{eid}")
	@ResponseBody
	public Object getenterpriseById(@PathVariable Integer eid) {
		Object enterprise=service.getEnterpriseById(eid);
		return enterprise;
	}
	
	//获取所有企业用户的信息（分页查询）
	@RequestMapping("/msg/list")
	@ResponseBody
	public EasyUIDataGridResult getEnterpriseList(Integer page,Integer rows) {
		EasyUIDataGridResult result=service.getEnterpriseList(page, rows);
		return result;
	}
	
	//根据eid,result 审核企业用户是否通过
	@RequestMapping("/msg/toexamine")
	public void toExamineById(Integer eid , Integer result){
		service.toExamineById(eid,result);
	}	
	
	//新建企业用户信息
	@RequestMapping("/msg/insert")
	@ResponseBody
	public void insertEnterprise(Enterprise enterprise){
		enterprise.setCheckstate(0);
		service.newEnterpriseMsg(enterprise);
	}
		
	
	//保存企业用户信息
	@RequestMapping("/msg/save")
	@ResponseBody
	public void saveEnterprise(Enterprise enterprise){
		service.updateEnterprise(enterprise);
	}
	
	
	

}
