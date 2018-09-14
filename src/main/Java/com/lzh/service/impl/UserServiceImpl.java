package com.lzh.service.impl;

import com.lzh.common.entity.User;
import com.lzh.common.entity.UserExample;
import com.lzh.common.mapper.UserMapper;
import com.lzh.common.util.IDUtils;
import com.lzh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzh.common.pojo.RecruitResult;
import com.lzh.common.pojo.UserItem;
import com.lzh.common.util.HttpClientUtil;
import com.lzh.common.util.JsonUtils;



@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper mapper;
	@Override
	public RecruitResult auregisterUser(User user) {
		user.setIsenterprise(false);
		user.setId(IDUtils.genItemId());
		try{
			mapper.insert(user);
			return RecruitResult.ok(user);
		}catch(Exception e){
			e.printStackTrace();
			return RecruitResult.fail();
		}
	}
	@Override
	public RecruitResult aeregisterUser(User user) {
		user.setIsenterprise(false);
		user.setId(IDUtils.genItemId());
		try{
			mapper.insert(user);
			return RecruitResult.ok(user);
		}catch(Exception e){
			e.printStackTrace();
			return RecruitResult.fail();
		}
	}
	
	@Override
	public RecruitResult eregisterUser(User user) {
		user.setIsenterprise(true);
		user.setId(IDUtils.genItemId());
		try{
			mapper.insert(user);
			return RecruitResult.ok(user);
		}catch(Exception e){
			e.printStackTrace();
			return RecruitResult.fail();
		}
	}

	@Override
	public RecruitResult alogin(User user) {
		user.setIsenterprise(false);
		UserExample example=new UserExample();
		UserExample.Criteria criteria=example.createCriteria();
		criteria.andUsernameEqualTo(user.getUsername());
		criteria.andPwdEqualTo(user.getPwd());
		criteria.andIsenterpriseEqualTo(user.getIsenterprise());
		int count=mapper.countByExample(example);
		if(count==1){
			user=mapper.selectByExample(example).get(0);
			return RecruitResult.ok(user);
		}else{
			return RecruitResult.fail();
		}
	}

	@Override
	public RecruitResult elogin(User user) {
		user.setIsenterprise(true);
		UserExample example=new UserExample();
		UserExample.Criteria criteria=example.createCriteria();
		criteria.andUsernameEqualTo(user.getUsername());
		criteria.andPwdEqualTo(user.getPwd());
		criteria.andIsenterpriseEqualTo(user.getIsenterprise());
		int count=mapper.countByExample(example);
		if(count==1){
			user=mapper.selectByExample(example).get(0);
			return RecruitResult.ok(user);
		}else{
			return RecruitResult.fail();
		}
	}
	@Override
	public RecruitResult pwdChange(UserItem userItem) {
		UserExample example=new UserExample();
		UserExample.Criteria criteria=example.createCriteria();
		criteria.andIdEqualTo(userItem.getId());
		criteria.andPwdEqualTo(userItem.getPwd());
		int count=mapper.countByExample(example);
		if(count==1){
			User user=new User();
			user.setId(userItem.getId());
			user.setPwd(userItem.getNewpwd());
			count=mapper.updateByPrimaryKeySelective(user);
			if(count==1){
				return RecruitResult.ok();
			}else{
				return RecruitResult.fail();
			}
		}else{
			return RecruitResult.fail();
		}
	}	

}
