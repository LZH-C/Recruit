package com.lzh.service;

import java.util.List;

import com.lzh.common.entity.Quarters;
import com.lzh.common.pojo.EasyUIDataGridResult;
import com.lzh.common.pojo.RecruitResult;
import com.lzh.common.pojo.quarterItem;


public interface QuartersService {
	//根据ID获取岗位信息
	public Quarters getQuartersById(Integer qid);
	//获取所有岗位的信息（分页查询）
	public EasyUIDataGridResult getQuartersList(int page, int rows);
	//根据id 审核岗位是否通过
	void toExamineById(int qid, int result);
	//修改岗位信息
	public RecruitResult replaceQuarter(Quarters quarters);
	//删除岗位
	public RecruitResult deleteQuarter(int qid);
	//添加新的职位
	void addQuarter(Quarters quarters);
	//获取一组职位item基本信息
	public List<quarterItem> selectQuarterItemByEId(int eid, int pageNumber, int pageSize);
	//获取全部职位item基本信息
	public List<quarterItem> selectQuarterItem(Integer pageNumber, Integer pageSize);
	//获取关键字职位的信息
	public RecruitResult selectQuarterItemByKey(String key, Integer pageNumber, Integer pageSize);
	//获取正在招聘职位的数量
	public RecruitResult getCountQuarter(int eid);
}
