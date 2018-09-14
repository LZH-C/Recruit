package com.lzh.controller;

import com.lzh.service.DiscussService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lzh.common.pojo.EasyUIDataGridResult;

@Controller
@RequestMapping("/ae/discuss")
public class discussController {
	
	@Autowired
	private DiscussService service;
	
	//获取所有用户的工作经历信息（分页查询）
	@RequestMapping("/msg/list")
	@ResponseBody
	public EasyUIDataGridResult getDiscussList(Integer page,Integer rows){
		EasyUIDataGridResult result=service.getDiscussList(page, rows);
	return result;
	}
			
	//根据aid,result 审核是否通过
	@RequestMapping("/toexamine")
	public void toExamineById(Integer did , Integer result){
		service.toExamineById(did,result);
	}
	
}
