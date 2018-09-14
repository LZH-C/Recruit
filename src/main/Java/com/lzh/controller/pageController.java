package com.lzh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class pageController {
	
	
	@RequestMapping("/")
	public String getIndex() {
		return "index";
	}
	@RequestMapping("/index")
	public String getIndex1() {
		return "index";
	}
	@RequestMapping("/login")
	public String getlogin() {
		return "login";
	}
	@RequestMapping("/register")
	public String getRegister() {
		return "register-enterprise";
	}
	@RequestMapping("/auser/{page}")
	public String showaPage(@PathVariable String page){
		return page;
	}
	@RequestMapping("/euser/{page}")
	public String showePage(@PathVariable String page){
		return page;
	}
	
}
