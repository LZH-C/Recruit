package com.lzh.common.mapper;

import com.lzh.common.entity.Quarters;
import com.lzh.common.entity.QuartersExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QuartersMapper {
    int countByExample(QuartersExample example);

    int deleteByExample(QuartersExample example);

    int deleteByPrimaryKey(Integer qid);

    int insert(Quarters record);

    int insertSelective(Quarters record);

    List<Quarters> selectByExample(QuartersExample example);

    Quarters selectByPrimaryKey(Integer qid);

    int updateByExampleSelective(@Param("record") Quarters record, @Param("example") QuartersExample example);

    int updateByExample(@Param("record") Quarters record, @Param("example") QuartersExample example);

    int updateByPrimaryKeySelective(Quarters record);

    int updateByPrimaryKey(Quarters record);
}