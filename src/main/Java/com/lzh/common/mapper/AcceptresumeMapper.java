package com.lzh.common.mapper;

import com.lzh.common.entity.AcceptresumeExample;
import com.lzh.common.entity.AcceptresumeKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AcceptresumeMapper {
    int countByExample(AcceptresumeExample example);

    int deleteByExample(AcceptresumeExample example);

    int deleteByPrimaryKey(AcceptresumeKey key);

    int insert(AcceptresumeKey record);

    int insertSelective(AcceptresumeKey record);

    List<AcceptresumeKey> selectByExample(AcceptresumeExample example);

    int updateByExampleSelective(@Param("record") AcceptresumeKey record, @Param("example") AcceptresumeExample example);

    int updateByExample(@Param("record") AcceptresumeKey record, @Param("example") AcceptresumeExample example);
}