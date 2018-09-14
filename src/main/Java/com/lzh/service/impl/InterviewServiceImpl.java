package com.lzh.service.impl;

import com.lzh.common.entity.Interview;
import com.lzh.common.entity.InterviewExample;
import com.lzh.common.mapper.InterviewMapper;
import com.lzh.common.pojo.InterviewItem;
import com.lzh.mapper.InterviewItemMapper;
import com.lzh.service.InterviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzh.common.pojo.RecruitResult;
import com.lzh.common.util.HttpClientUtil;
import com.lzh.common.util.JsonUtils;

import java.util.List;


@Service
public class InterviewServiceImpl implements InterviewService {

	@Autowired
	private InterviewItemMapper mapper;
	@Autowired
	private InterviewMapper imapper;

	@Override
	public RecruitResult interviewSuccess(Interview interview) {
		InterviewExample example=new InterviewExample();
		InterviewExample.Criteria criteria=example.createCriteria();
		criteria.andAidEqualTo(interview.getAid());
		criteria.andQidEqualTo(interview.getQid());
		List<Interview> list=imapper.selectByExample(example);
		list.get(0).setComment(interview.getComment());
		list.get(0).setResult("面试通过");
		imapper.updateByPrimaryKey(list.get(0));
		return RecruitResult.ok();
	}

	@Override
	public RecruitResult interviewFail(Interview interview) {
		InterviewExample example=new InterviewExample();
		example.createCriteria().andAidEqualTo(interview.getAid()).andQidEqualTo(interview.getQid());
		List<Interview> list=imapper.selectByExample(example);
		list.get(0).setComment(interview.getComment());
		list.get(0).setResult("面试失败");
		imapper.updateByPrimaryKey(list.get(0));
		return RecruitResult.ok();
	}

	@Override
	public RecruitResult getAllToUserInterview(int aid, int pageNumber, int pageSize) {
		List<InterviewItem> list1=mapper.getInvatedToUserInterview(aid, pageNumber, pageSize);
		List<InterviewItem> list2=mapper.getPassToUserInterview(aid, pageNumber, pageSize);
		List<InterviewItem> list3=mapper.getFailToUserInterview(aid, pageNumber, pageSize);
		list1.addAll(list2);
		list1.addAll(list3);
		return RecruitResult.ok(list1);
	}

	@Override
	public RecruitResult getAllToEtInterview(int eid, int pageNumber, int pageSize) {
		List<InterviewItem> list1=mapper.getInvatedToEtInterview(eid, pageNumber, pageSize);
		List<InterviewItem> list2=mapper.getPassToEtInterview(eid, pageNumber, pageSize);
		List<InterviewItem> list3=mapper.getFailToEtInterview(eid, pageNumber, pageSize);
		list1.addAll(list2);
		list1.addAll(list3);
		return RecruitResult.ok(list1);
	}

	@Override
	public RecruitResult getInvatedToUserInterview(int aid, int pageNumber, int pageSize) {
		List<InterviewItem> list=mapper.getInvatedToUserInterview(aid, pageNumber, pageSize);
		return RecruitResult.ok(list);
	}

	@Override
	public RecruitResult getInvatedToEtInterview(int eid, int pageNumber, int pageSize) {
		List<InterviewItem> list=mapper.getInvatedToEtInterview(eid, pageNumber, pageSize);
		return RecruitResult.ok(list);
	}

	@Override
	public RecruitResult getPassToUserInterview(int aid, int pageNumber, int pageSize) {
		List<InterviewItem> list=mapper.getPassToUserInterview(aid, pageNumber, pageSize);
		return RecruitResult.ok(list);
	}

	@Override
	public RecruitResult getPassToEtInterview(int eid, int pageNumber, int pageSize) {
		List<InterviewItem> list=mapper.getPassToEtInterview(eid, pageNumber, pageSize);
		return RecruitResult.ok(list);
	}

	@Override
	public RecruitResult getFailToUserInterview(int aid, int pageNumber, int pageSize) {
		List<InterviewItem> list=mapper.getFailToUserInterview(aid, pageNumber, pageSize);
		return RecruitResult.ok(list);
	}

	@Override
	public RecruitResult getFailToEtInterview(int eid, int pageNumber, int pageSize) {
		List<InterviewItem> list=mapper.getFailToEtInterview(eid, pageNumber, pageSize);
		return RecruitResult.ok(list);
	}

	@Override
	public RecruitResult addExperience(Interview interview) {
		InterviewExample example=new InterviewExample();
		InterviewExample.Criteria criteria=example.createCriteria();
		criteria.andAidEqualTo(interview.getAid());
		criteria.andQidEqualTo(interview.getQid());
		Interview newinterview=imapper.selectByExample(example).get(0);
		newinterview.setIexperience(interview.getIexperience());
		imapper.updateByPrimaryKey(newinterview);
		return RecruitResult.ok();
	}

	

}
