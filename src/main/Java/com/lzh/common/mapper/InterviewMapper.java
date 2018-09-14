package com.lzh.common.mapper;

import com.lzh.common.entity.Interview;
import com.lzh.common.entity.InterviewExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InterviewMapper {
    int countByExample(InterviewExample example);

    int deleteByExample(InterviewExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Interview record);

    int insertSelective(Interview record);

    List<Interview> selectByExample(InterviewExample example);

    Interview selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Interview record, @Param("example") InterviewExample example);

    int updateByExample(@Param("record") Interview record, @Param("example") InterviewExample example);

    int updateByPrimaryKeySelective(Interview record);

    int updateByPrimaryKey(Interview record);
}