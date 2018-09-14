package com.lzh.service.impl;

import java.util.List;

import com.lzh.common.entity.Quarters;
import com.lzh.common.entity.QuartersExample;
import com.lzh.common.mapper.QuartersMapper;
import com.lzh.mapper.QuarterItemMapper;
import com.lzh.service.QuartersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzh.common.pojo.EasyUIDataGridResult;
import com.lzh.common.pojo.RecruitResult;
import com.lzh.common.pojo.quarterItem;
import com.lzh.common.util.HttpClientUtil;
import com.lzh.common.util.IDUtils;
import com.lzh.common.util.JsonUtils;




@Service
public class QuartersServiceImpl implements QuartersService {
	@Autowired
	private QuartersMapper mapper;
	@Autowired
	private QuarterItemMapper qitemapper;
	@Override
	public Quarters getQuartersById(Integer qid) {
		return mapper.selectByPrimaryKey(qid);
	}

	@Override
	public EasyUIDataGridResult getQuartersList(int page, int rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void toExamineById(int qid, int result) {
		Quarters quarters=mapper.selectByPrimaryKey(qid);
		quarters.setCheckstate(result);
		mapper.updateByPrimaryKey(quarters);
		
	}

	@Override
	public void addQuarter(Quarters quarters) {
		int qid=IDUtils.genItemId();
		quarters.setQid(qid);
		quarters.setCheckstate(0);
		mapper.insert(quarters);
	}

	@Override
	public List<quarterItem> selectQuarterItemByEId(int eid, int pageNumber, int pageSize) {
		return qitemapper.selectQuarterItemByEId(eid, pageNumber, pageSize);
	}

	@Override
	public List<quarterItem> selectQuarterItem(Integer pageNumber, Integer pageSize) {
		return qitemapper.selectQuarterItem(pageNumber, pageSize);
	}

	@Override
	public RecruitResult replaceQuarter(Quarters quarters) {
		int count=mapper.updateByPrimaryKeySelective(quarters);
		if(count==1){
			return RecruitResult.ok();
		}else{
			return RecruitResult.fail();
		}
	}

	@Override
	public RecruitResult deleteQuarter(int qid) {
		int count=mapper.deleteByPrimaryKey(qid);
		if(count==1){
			return RecruitResult.ok();
		}else{
			return RecruitResult.fail();
		}
	}

	@Override
	public RecruitResult selectQuarterItemByKey(String key, Integer pageNumber, Integer pageSize) {
		/*QuartersExample example=new QuartersExample();
		System.out.println("test"+quarters.getName());
		example.createCriteria().andNameLike("%"+quarters.getName()+"%");
		List<Quarters> list=mapper.selectByExample(example);
		return RecruitResult.ok(list);*/

		String jsonResult = HttpClientUtil.doGet("http://localhost:8082/quarters/msg/quarteritem/key/"+key+"/"+pageNumber+"/"+pageSize);
		RecruitResult recruitResult=JsonUtils.jsonToPojo(jsonResult, RecruitResult.class);
		return recruitResult;
	}

	@Override
	public RecruitResult getCountQuarter(int eid) {
		int count=qitemapper.getCountQuarter(eid);
		return RecruitResult.ok(count);
	}
	
	
}
