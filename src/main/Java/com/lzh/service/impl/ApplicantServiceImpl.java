package com.lzh.service.impl;

import com.lzh.common.entity.Applicant;
import com.lzh.common.mapper.ApplicantMapper;
import com.lzh.service.ApplicantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzh.common.pojo.EasyUIDataGridResult;
import com.lzh.common.pojo.RecruitResult;
import com.lzh.common.util.HttpClientUtil;
import com.lzh.common.util.JsonUtils;

@Service
public class ApplicantServiceImpl implements ApplicantService {
	@Autowired
	ApplicantMapper applicantmapper;

	@Override
	public Applicant getApplicantById(int aid) {
		return applicantmapper.selectByPrimaryKey(aid);
	}

	@Override
	public EasyUIDataGridResult getApplicantList(int page, int rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void toExamineById(int aid, int result) {
		Applicant applicant=applicantmapper.selectByPrimaryKey(aid);
		applicant.setCheckstate(result);
		applicantmapper.updateByPrimaryKey(applicant);
		
	}

	@Override
	public RecruitResult updateApplicant(Applicant applicant) {

		int count=applicantmapper.updateByPrimaryKey(applicant);
		if(count==0){
			try{
				applicant.setCheckstate(0);
				applicantmapper.insert(applicant);
				return RecruitResult.ok();
			}catch(Exception e){
				e.printStackTrace();
				return RecruitResult.fail();
			}
		}else{
			return RecruitResult.ok();
		}
	}

	@Override
	public void deleteApplicantById(int aid) {
		applicantmapper.deleteByPrimaryKey(aid);
	}

	@Override
	public void newApplicantMsg(Applicant applicant) {
		try{
			applicant.setCheckstate(0);
			applicantmapper.insert(applicant);
			//return RecruitResult.ok();
		}catch(Exception e){
			e.printStackTrace();
			//return RecruitResult.fail();
		}
	}
	

	

}
