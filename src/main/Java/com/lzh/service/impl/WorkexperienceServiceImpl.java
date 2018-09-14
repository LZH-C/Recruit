package com.lzh.service.impl;

import com.lzh.common.entity.Workexperience;
import com.lzh.common.mapper.WorkexperienceMapper;
import com.lzh.service.WorkexperienceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzh.common.pojo.EasyUIDataGridResult;
import com.lzh.common.pojo.RecruitResult;
import com.lzh.common.util.HttpClientUtil;
import com.lzh.common.util.JsonUtils;



@Service
public class WorkexperienceServiceImpl implements WorkexperienceService {

	@Autowired
	WorkexperienceMapper workexperienceMapper;

	@Override
	public Workexperience getWorkexperienceById(int aid) {
		return workexperienceMapper.selectByPrimaryKey(aid);
	}

	@Override
	public EasyUIDataGridResult getWorkexperienceList(int page, int rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void toExamineById(int aid, int result) {
		Workexperience workexperience=workexperienceMapper.selectByPrimaryKey(aid);
		workexperience.setCheckstate(result);
		workexperienceMapper.updateByPrimaryKey(workexperience);
		
	}

	@Override
	public RecruitResult updateWorkexperience(Workexperience workexperience) {
		int count=workexperienceMapper.updateByPrimaryKey(workexperience);
		if(count==0){
			try{
				workexperience.setCheckstate(0);
				workexperienceMapper.insert(workexperience);
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
	public void deleteWorkexperienceById(Integer aid) {
		workexperienceMapper.deleteByPrimaryKey(aid);
		
	}

	@Override
	public void newWorkexperienceMsg(Workexperience workexperience) {
		try{
			workexperience.setCheckstate(0);
			workexperienceMapper.insert(workexperience);
			//return RecruitResult.ok();
		}catch(Exception e){
			e.printStackTrace();
			//return RecruitResult.fail();
		}
	}
	

}
