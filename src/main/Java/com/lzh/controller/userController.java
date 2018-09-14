package com.lzh.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lzh.common.entity.User;
import com.lzh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lzh.common.pojo.RecruitResult;
import com.lzh.common.pojo.UserItem;


@Controller
@RequestMapping("/user")
public class userController {
	@Autowired
	private UserService service;
	
	@RequestMapping("/login/applicant")
	@ResponseBody
	public RecruitResult alogin(User user, HttpServletRequest request, HttpServletResponse response){
		RecruitResult recruitResult=service.alogin(user);
		if(recruitResult.getStatus()==200){
			request.getSession().setAttribute("auserid", ((User)recruitResult.getData()).getId());
			request.getSession().setAttribute("ausername", ((User)recruitResult.getData()).getUsername());
			return RecruitResult.ok();
		}
		return RecruitResult.fail();
	}
	
	@RequestMapping("/login/enterprise")
	@ResponseBody
	public RecruitResult elogin(User user,HttpServletRequest request,HttpServletResponse response){
		RecruitResult recruitResult=service.elogin(user);
		if(recruitResult.getStatus()==200){
			request.getSession().setAttribute("euserid", ((User)recruitResult.getData()).getId());
			request.getSession().setAttribute("eusername", ((User)recruitResult.getData()).getUsername());
			return RecruitResult.ok();
		}
		return RecruitResult.fail();
	}
	
	@RequestMapping("/logout/applicant")
	@ResponseBody
	public RecruitResult alogout(User user,HttpServletRequest request,HttpServletResponse response){
		request.getSession(false).removeAttribute("auserid");
		request.getSession(false).removeAttribute("ausername");
		return RecruitResult.ok();
	}
	@RequestMapping("/logout/enterprise")
	@ResponseBody
	public RecruitResult elogout(User user,HttpServletRequest request,HttpServletResponse response){
		request.getSession(false).removeAttribute("euserid");
		request.getSession(false).removeAttribute("eusername");
		return RecruitResult.ok();
	}
	
	@RequestMapping("/aregister/u")
	@ResponseBody
	public RecruitResult auregisterUser(User user,HttpServletRequest request,HttpServletResponse response){
		RecruitResult recruitResult= service.auregisterUser(user);
		if(recruitResult.getStatus()==200){
			request.getSession().setAttribute("auserid", ((User)recruitResult.getData()).getId());
			request.getSession().setAttribute("ausername", ((User)recruitResult.getData()).getUsername());
			return RecruitResult.ok();
		}
		return RecruitResult.fail();
	}
	@RequestMapping("/aregister/e")
	@ResponseBody
	public RecruitResult aeregisterUser(User user,HttpServletRequest request,HttpServletResponse response){
		RecruitResult recruitResult= service.aeregisterUser(user);
		if(recruitResult.getStatus()==200){
			request.getSession().setAttribute("auserid", ((User)recruitResult.getData()).getId());
			request.getSession().setAttribute("ausername", ((User)recruitResult.getData()).getUsername());
			return RecruitResult.ok();
		}
		return RecruitResult.fail();
	}
	
	@RequestMapping("/eregister")
	@ResponseBody
	public RecruitResult eregisterUser(User user,HttpServletRequest request,HttpServletResponse response){
		RecruitResult recruitResult= service.eregisterUser(user);
		if(recruitResult.getStatus()==200){
			request.getSession().setAttribute("euserid", ((User)recruitResult.getData()).getId());
			request.getSession().setAttribute("eusername", ((User)recruitResult.getData()).getUsername());
			return RecruitResult.ok();
		}
		return RecruitResult.fail();
	}
	
	@RequestMapping("/pwdchange")
	@ResponseBody
	public RecruitResult pwdChange(UserItem userItem){
		return service.pwdChange(userItem);
	}
	
}
