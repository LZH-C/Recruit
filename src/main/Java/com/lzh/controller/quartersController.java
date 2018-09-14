package com.lzh.controller;

import java.util.List;

import com.lzh.common.entity.Quarters;
import com.lzh.service.QuartersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lzh.common.pojo.EasyUIDataGridResult;
import com.lzh.common.pojo.RecruitResult;
import com.lzh.common.pojo.quarterItem;


@Controller
@RequestMapping("/ae/quarters")
public class quartersController {
	
	@Autowired
	private QuartersService service;
	
	//根据ID获取岗位信息
	@RequestMapping("/msg/{qid}")
	public String getQuartersById(@PathVariable Integer qid,Model model){
		Quarters quarters=service.getQuartersById(qid);
		model.addAttribute("quarters", quarters);
		return "quarters-msg";
	};
	////根据ID获取岗位信息
	@RequestMapping("/getmsg/{qid}")
	@ResponseBody
	public Quarters getQuarterById(@PathVariable Integer qid){
		return service.getQuartersById(qid);
	};
	
	//获取一组职位item基本信息
	@RequestMapping("/msg/quarteritem/{eid}/{pageNumber}/{pageSize}")
	@ResponseBody
	public List<quarterItem> selectQuarterItemByEId(@PathVariable Integer eid, @PathVariable Integer pageNumber, @PathVariable Integer pageSize) {
		return service.selectQuarterItemByEId(eid, pageNumber, pageSize);
	}
	//获取全部职位item基本信息
	@RequestMapping("/msg/quarteritem/list/{pageNumber}/{pageSize}")
	@ResponseBody
	public List<quarterItem> selectQuarterItem(@PathVariable Integer pageNumber, @PathVariable Integer pageSize) {
		return service.selectQuarterItem(pageNumber, pageSize);
	}
	//获取关键字key全部职位item基本信息
	@RequestMapping("/msg/quarteritem/key/{key}/{pageNumber}/{pageSize}")
	@ResponseBody
	public RecruitResult selectQuarterItem(@PathVariable String key,@PathVariable Integer pageNumber, @PathVariable Integer pageSize) {
		return service.selectQuarterItemByKey(key, pageNumber, pageSize);
	}
	
	//添加新的职位
	@RequestMapping("/add")
	@ResponseBody
	public void addQuarter(Quarters quarter){
		service.addQuarter(quarter);
	}
	
	//修改岗位信息
	@RequestMapping("/replace")
	@ResponseBody
	RecruitResult replaceQuarter(Quarters quarters){
		return service.replaceQuarter(quarters);
	}
	
	//删除岗位
	@RequestMapping("/delete/{qid}")
	@ResponseBody
	public RecruitResult deleteQuarter(@PathVariable Integer qid) {
		return service.deleteQuarter(qid);
	}
	
	//查看职位基本信息
	@RequestMapping("/getqitem/user/{qid}")
	public String getUserQuartersByQId(@PathVariable Integer qid,Model model){
		Quarters quarters=service.getQuartersById(qid);
		model.addAttribute("quarters", quarters);
		return "arecruit-item";
	};
	
	//查看职位基本信息
	@RequestMapping("/getqitem/et/{qid}")
	public String getQuartersByQId(@PathVariable Integer qid,Model model){
		Quarters quarters=service.getQuartersById(qid);
		model.addAttribute("quarters", quarters);
		model.addAttribute("qid", qid);
		return "erecruit-item";
	};
	
	//查看职位基本信息
	@RequestMapping("/getqitem/et1/{qid}")
	public String getQuartersByQId1(@PathVariable Integer qid,Model model){
		Quarters quarters=service.getQuartersById(qid);
		model.addAttribute("quarters", quarters);
		model.addAttribute("qid", qid);
		return "erecruit-item-msg";
	};
		
	//获取所有用户的工作经历信息（分页查询）
	@RequestMapping("/msg/list")
	@ResponseBody
	public EasyUIDataGridResult getQuartersList(Integer page,Integer rows){
		EasyUIDataGridResult result=service.getQuartersList(page, rows);
		return result;
	}
		
	//根据aid,result 审核是否通过
	@RequestMapping("/toexamine")
	public void toExamineById(Integer qid , Integer result){
		service.toExamineById(qid,result);
	}
	
	//获取正在招聘职位的数量
	@RequestMapping("/getCount/quarter/{eid}")
	@ResponseBody
	RecruitResult getCountResume(@PathVariable Integer eid){
		return service.getCountQuarter(eid);
	}
	
}
