package com.lzh.common.mapper;

import com.lzh.common.entity.Applicant;
import com.lzh.common.entity.ApplicantExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ApplicantMapper {
    int countByExample(ApplicantExample example);

    int deleteByExample(ApplicantExample example);

    int deleteByPrimaryKey(Integer aid);

    int insert(Applicant record);

    int insertSelective(Applicant record);

    List<Applicant> selectByExample(ApplicantExample example);

    Applicant selectByPrimaryKey(Integer aid);

    int updateByExampleSelective(@Param("record") Applicant record, @Param("example") ApplicantExample example);

    int updateByExample(@Param("record") Applicant record, @Param("example") ApplicantExample example);

    int updateByPrimaryKeySelective(Applicant record);

    int updateByPrimaryKey(Applicant record);
}