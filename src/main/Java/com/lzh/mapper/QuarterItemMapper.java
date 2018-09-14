package com.lzh.mapper;

import java.util.List;

import com.lzh.common.pojo.quarterItem;

public interface QuarterItemMapper {
    //根据ID获取职位基本信息
	List<quarterItem> selectQuarterItemByEId(int eid, int pageNumber, int pageSize);
	//获取全部职位item基本信息
	List<quarterItem> selectQuarterItem(Integer pageNumber, Integer pageSize);
	//获取正在招聘职位的数量
	Integer getCountQuarter(int eid);
}