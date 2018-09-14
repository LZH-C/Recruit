package com.lzh.service.impl;

import com.lzh.common.entity.Applicantintention;
import com.lzh.common.mapper.ApplicantintentionMapper;
import com.lzh.service.ApplicantintentionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lzh.common.pojo.EasyUIDataGridResult;
import com.lzh.common.pojo.RecruitResult;
import com.lzh.common.util.HttpClientUtil;
import com.lzh.common.util.JsonUtils;



@Service
public class ApplicantintentionServiceImpl implements ApplicantintentionService {
	@Autowired
	ApplicantintentionMapper mapper;

	@Override
	public Applicantintention getApplicantintentionById(int aid) {
		return mapper.selectByPrimaryKey(aid);
	}

	@Override
	public EasyUIDataGridResult getApplicantIntentionList(int page, int rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void toExamineById(int aid, int result) {
		Applicantintention applicantintention=mapper.selectByPrimaryKey(aid);
		applicantintention.setCheckstate(result);
		mapper.updateByPrimaryKey(applicantintention);
		
	}

	@Override
	public RecruitResult updateApplicantintention(Applicantintention applicantintention) {

		int count=mapper.updateByPrimaryKey(applicantintention);
		if(count==0){
			try{
				applicantintention.setCheckstate(0);
				mapper.insert(applicantintention);
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
	public void deleteApplicantintentionById(int aid) {
		mapper.deleteByPrimaryKey(aid);
		
	}

	@Override
	public void newApplicantintentionMsg(Applicantintention applicantintention) {
		try{
			applicantintention.setCheckstate(0);
			mapper.insert(applicantintention);
			//return RecruitResult.ok();
		}catch(Exception e){
			e.printStackTrace();
			//return RecruitResult.fail();
		}
	}
	
	

}
