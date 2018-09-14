package com.lzh.service.impl;

import com.lzh.common.entity.Enterprise;
import com.lzh.common.mapper.EnterpriseMapper;
import com.lzh.common.mapper.UserMapper;
import com.lzh.service.EnterpriseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzh.common.pojo.EasyUIDataGridResult;
import com.lzh.common.pojo.RecruitResult;
import com.lzh.common.util.HttpClientUtil;
import com.lzh.common.util.JsonUtils;



@Service
public class EnterpriseServiceImpl implements EnterpriseService {

	@Autowired
	EnterpriseMapper emsgmapper;
	@Autowired
	UserMapper usermapper;

	@Override
	public Object getEnterpriseById(Integer eid) {
		Enterprise Enterprise=emsgmapper.selectByPrimaryKey(eid);
		return Enterprise;
	}

	@Override
	public EasyUIDataGridResult getEnterpriseList(int page, int rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void toExamineById(int eid, int result) {
		Enterprise enterprise=emsgmapper.selectByPrimaryKey(eid);
		enterprise.setCheckstate(result);
		emsgmapper.updateByPrimaryKey(enterprise);
	}

	@Override
	public void updateEnterprise(Enterprise enterprise) {
		emsgmapper.updateByPrimaryKey(enterprise);
	}

	@Override
	public void newEnterpriseMsg(Enterprise enterprise) {
		emsgmapper.insert(enterprise);
	}
	
	
}
