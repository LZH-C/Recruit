package com.lzh.common.mapper;

import com.lzh.common.entity.Workexperience;
import com.lzh.common.entity.WorkexperienceExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WorkexperienceMapper {
    int countByExample(WorkexperienceExample example);

    int deleteByExample(WorkexperienceExample example);

    int deleteByPrimaryKey(Integer aid);

    int insert(Workexperience record);

    int insertSelective(Workexperience record);

    List<Workexperience> selectByExample(WorkexperienceExample example);

    Workexperience selectByPrimaryKey(Integer aid);

    int updateByExampleSelective(@Param("record") Workexperience record, @Param("example") WorkexperienceExample example);

    int updateByExample(@Param("record") Workexperience record, @Param("example") WorkexperienceExample example);

    int updateByPrimaryKeySelective(Workexperience record);

    int updateByPrimaryKey(Workexperience record);
}