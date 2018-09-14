package com.lzh.service.impl;

import com.lzh.common.entity.Eduexperience;
import com.lzh.common.mapper.EduexperienceMapper;
import com.lzh.service.EduexperienceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzh.common.pojo.EasyUIDataGridResult;
import com.lzh.common.pojo.RecruitResult;
import com.lzh.common.util.HttpClientUtil;
import com.lzh.common.util.JsonUtils;


@Service
public class EduexperienceServiceImpl implements EduexperienceService {

	@Autowired
	EduexperienceMapper eduexperienceMapper;
	@Override
	public Eduexperience getEduexperienceById(int aid) {
		return eduexperienceMapper.selectByPrimaryKey(aid);
	}

	@Override
	public EasyUIDataGridResult getEduexperienceList(int page, int rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void toExamineById(int aid, int result) {
		Eduexperience eduexperience=eduexperienceMapper.selectByPrimaryKey(aid);
		eduexperience.setCheckstate(result);
		eduexperienceMapper.updateByPrimaryKey(eduexperience);
		
	}

	@Override
	public RecruitResult updateEduexperience(Eduexperience eduexperience) {
		int count=eduexperienceMapper.updateByPrimaryKey(eduexperience);
		if(count==0){
			try{
				eduexperience.setCheckstate(0);
				eduexperienceMapper.insert(eduexperience);
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
	public void deleteEduexperienceById(int aid) {
		// TODO Auto-generated method stub
		eduexperienceMapper.deleteByPrimaryKey(aid);
	}

	@Override
	public void newEduexperienceMsg(Eduexperience eduexperience) {
		try{
			eduexperience.setCheckstate(0);
			eduexperienceMapper.insert(eduexperience);
			//return RecruitResult.ok();
		}catch(Exception e){
			e.printStackTrace();
			//return RecruitResult.fail();
		}
	}
	
	
}
