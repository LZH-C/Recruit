package com.lzh.common.mapper;

import com.lzh.common.entity.Discusssecond;
import com.lzh.common.entity.DiscusssecondExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DiscusssecondMapper {
    int countByExample(DiscusssecondExample example);

    int deleteByExample(DiscusssecondExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Discusssecond record);

    int insertSelective(Discusssecond record);

    List<Discusssecond> selectByExample(DiscusssecondExample example);

    Discusssecond selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Discusssecond record, @Param("example") DiscusssecondExample example);

    int updateByExample(@Param("record") Discusssecond record, @Param("example") DiscusssecondExample example);

    int updateByPrimaryKeySelective(Discusssecond record);

    int updateByPrimaryKey(Discusssecond record);
}