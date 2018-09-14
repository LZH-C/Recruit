package com.lzh.common.mapper;

import com.lzh.common.entity.RefuseresumeExample;
import java.util.List;

import com.lzh.common.entity.RefuseresumeKey;
import org.apache.ibatis.annotations.Param;

public interface RefuseresumeMapper {
    int countByExample(RefuseresumeExample example);

    int deleteByExample(RefuseresumeExample example);

    int deleteByPrimaryKey(RefuseresumeKey key);

    int insert(RefuseresumeKey record);

    int insertSelective(RefuseresumeKey record);

    List<RefuseresumeKey> selectByExample(RefuseresumeExample example);

    int updateByExampleSelective(@Param("record") RefuseresumeKey record, @Param("example") RefuseresumeExample example);

    int updateByExample(@Param("record") RefuseresumeKey record, @Param("example") RefuseresumeExample example);
}