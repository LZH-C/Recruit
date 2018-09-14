package com.lzh.service;

import com.lzh.common.entity.User;
import com.lzh.common.pojo.RecruitResult;
import com.lzh.common.pojo.UserItem;

public interface UserService {
	//注册新应聘用户
	public RecruitResult auregisterUser(User user);
	public RecruitResult aeregisterUser(User user);
	
	//注册新企业用户
	public RecruitResult eregisterUser(User user);
	
	//修改密码
	public RecruitResult pwdChange(UserItem userItem);
	
	//应聘者登录
	public RecruitResult alogin(User user);
	
	//企业登录
	public RecruitResult elogin(User user);
	
}
