package com.lzh.service.impl;
import com.lzh.common.entity.*;
import com.lzh.common.mapper.*;
import com.lzh.common.pojo.Miniresume;
import com.lzh.common.util.IDUtils;
import com.lzh.mapper.ResumeMapper;
import com.lzh.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzh.common.pojo.RecruitResult;
import com.lzh.common.util.HttpClientUtil;
import com.lzh.common.util.JsonUtils;

import java.util.List;


@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	private InresumeMapper imapper;
	@Autowired
	private AcceptresumeMapper amapper;
	@Autowired
	private RefuseresumeMapper rmapper;
	@Autowired
	private ApplicantMapper applicantmapper;
	@Autowired
	private ApplicantintentionMapper intentionrmapper;
	@Autowired
	private EduexperienceMapper edumapper;
	@Autowired
	private WorkexperienceMapper workmapper;
	@Autowired
	private QuartersMapper qmapper;
	@Autowired
	private ResumeMapper resumeMapper;
	@Autowired
	private InterviewMapper intermapper;

	@Override
	public RecruitResult addResume(InresumeKey resume) {
		if(applicantmapper.selectByPrimaryKey(resume.getAid())==null){
			return RecruitResult.betweenInOkAndFail(300);
		}
		if(intentionrmapper.selectByPrimaryKey(resume.getAid())==null){
			return RecruitResult.betweenInOkAndFail(300);
		}
		if(edumapper.selectByPrimaryKey(resume.getAid())==null){
			return RecruitResult.betweenInOkAndFail(300);
		}
		if(workmapper.selectByPrimaryKey(resume.getAid())==null){
			return RecruitResult.betweenInOkAndFail(300);
		}
		AcceptresumeExample aexample=new AcceptresumeExample();
		RefuseresumeExample rexample=new RefuseresumeExample();
		aexample.createCriteria().andAidEqualTo(resume.getAid()).andQidEqualTo(resume.getQid());
		rexample.createCriteria().andAidEqualTo(resume.getAid()).andQidEqualTo(resume.getQid());
		if(amapper.countByExample(aexample)==1||rmapper.countByExample(rexample)==1){
			return RecruitResult.fail();
		}
		try{
			imapper.insert(resume);
			return RecruitResult.ok();
		}catch(Exception e){
			return RecruitResult.fail();
		}
	}

	@Override
	public RecruitResult acceptResume(AcceptresumeKey resume) {
		InresumeExample example=new InresumeExample();
		InresumeExample.Criteria criteria=example.createCriteria();
		criteria.andAidEqualTo(resume.getAid());
		criteria.andQidEqualTo(resume.getQid());

		int eid=qmapper.selectByPrimaryKey(resume.getQid()).getEid();
		Interview interview=new Interview();
		interview.setId(IDUtils.genItemId());
		interview.setAid(resume.getAid());
		interview.setEid(eid);
		interview.setQid(resume.getQid());
		interview.setIexperience("暂无心得");
		interview.setResult("待面试");
		intermapper.insert(interview);

		int count=imapper.countByExample(example);
		if(count==1){
			try{
				count=imapper.deleteByExample(example);
				if(count==1){
					count=amapper.insert(resume);
					if(count==1){
						return RecruitResult.ok();
					}else{
						RecruitResult.fail();
					}
				}else{
					RecruitResult.fail();
				}
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("acceptResume发生错误！");
			}
			return RecruitResult.fail();
		}else{
			return RecruitResult.fail();
		}
	}

	@Override
	public RecruitResult refuseResume(RefuseresumeKey resume) {
		InresumeExample example=new InresumeExample();
		InresumeExample.Criteria criteria=example.createCriteria();
		criteria.andAidEqualTo(resume.getAid());
		criteria.andQidEqualTo(resume.getQid());
		int count=imapper.countByExample(example);
		if(count==1){
			try{
				count=imapper.deleteByExample(example);
				if(count==1){
					count=rmapper.insert(resume);
					if(count==1){
						return RecruitResult.ok();
					}else{
						RecruitResult.fail();
					}
				}else{
					RecruitResult.fail();
				}
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("refuseResume发生错误！");
			}
			return RecruitResult.fail();
		}else{
			return RecruitResult.fail();
		}
	}

	@Override
	public RecruitResult getNotDealResumeByEid(int eid,int pageNumber, int pageSize) {
		List<Miniresume> list= resumeMapper.getNotDealResumeByEid(eid,pageNumber,pageSize);
		return RecruitResult.ok(list);
	}

	@Override
	public RecruitResult getAcceptResumeByEid(int eid,int pageNumber, int pageSize) {
		List<Miniresume> list= resumeMapper.getAcceptResumeByEid(eid,pageNumber,pageSize);
		return RecruitResult.ok(list);
	}

	@Override
	public RecruitResult getRefuseResumeByEid(int eid,int pageNumber, int pageSize) {
		List<Miniresume> list= resumeMapper.getRefuseResumeByEid(eid,pageNumber,pageSize);
		return RecruitResult.ok(list);
	}

	@Override
	public RecruitResult getDealedResumeByEid(int eid,int pageNumber, int pageSize) {
		List<Miniresume> list1= resumeMapper.getAcceptResumeByEid(eid,pageNumber,pageSize);
		List<Miniresume> list2= resumeMapper.getRefuseResumeByEid(eid,pageNumber,pageSize);
		list1.addAll(list2);
		return RecruitResult.ok(list1);
	}

	@Override
	public RecruitResult getAllResumeByEid(int eid,int pageNumber, int pageSize) {
		List<Miniresume> list= resumeMapper.getNotDealResumeByEid(eid,pageNumber,pageSize);
		List<Miniresume> list1= resumeMapper.getAcceptResumeByEid(eid,pageNumber,pageSize);
		List<Miniresume> list2= resumeMapper.getRefuseResumeByEid(eid,pageNumber,pageSize);
		list.addAll(list1);
		list.addAll(list2);
		return RecruitResult.ok(list);
	}

	@Override
	public RecruitResult deleteResumeByAid(int aid) {
		applicantmapper.deleteByPrimaryKey(aid);
		intentionrmapper.deleteByPrimaryKey(aid);
		edumapper.deleteByPrimaryKey(aid);
		workmapper.deleteByPrimaryKey(aid);
		if(applicantmapper.selectByPrimaryKey(aid)==null&&applicantmapper.selectByPrimaryKey(aid)==null
				&&applicantmapper.selectByPrimaryKey(aid)==null&&applicantmapper.selectByPrimaryKey(aid)==null)
		{
			return RecruitResult.ok();
		}else{
			return RecruitResult.fail();
		}
	}

	@Override
	public RecruitResult getCountResume(int eid) {
		int count=resumeMapper.getCountResume(eid);
		return RecruitResult.ok(count);
	}

	@Override
	public RecruitResult getAllCountResume(int eid) {
		int count=resumeMapper.getAllCountResume(eid);
		return RecruitResult.ok(count);
	}
	
	

}
