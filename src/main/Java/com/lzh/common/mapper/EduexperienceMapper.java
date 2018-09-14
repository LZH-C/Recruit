package com.lzh.common.mapper;

import com.lzh.common.entity.Eduexperience;
import com.lzh.common.entity.EduexperienceExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EduexperienceMapper {
    int countByExample(EduexperienceExample example);

    int deleteByExample(EduexperienceExample example);

    int deleteByPrimaryKey(Integer aid);

    int insert(Eduexperience record);

    int insertSelective(Eduexperience record);

    List<Eduexperience> selectByExample(EduexperienceExample example);

    Eduexperience selectByPrimaryKey(Integer aid);

    int updateByExampleSelective(@Param("record") Eduexperience record, @Param("example") EduexperienceExample example);

    int updateByExample(@Param("record") Eduexperience record, @Param("example") EduexperienceExample example);

    int updateByPrimaryKeySelective(Eduexperience record);

    int updateByPrimaryKey(Eduexperience record);
}