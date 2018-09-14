package com.lzh.common.mapper;

import com.lzh.common.entity.InresumeExample;
import com.lzh.common.entity.InresumeKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InresumeMapper {
    int countByExample(InresumeExample example);

    int deleteByExample(InresumeExample example);

    int deleteByPrimaryKey(InresumeKey key);

    int insert(InresumeKey record);

    int insertSelective(InresumeKey record);

    List<InresumeKey> selectByExample(InresumeExample example);

    int updateByExampleSelective(@Param("record") InresumeKey record, @Param("example") InresumeExample example);

    int updateByExample(@Param("record") InresumeKey record, @Param("example") InresumeExample example);
}