package com.lzh.common.mapper;

import com.lzh.common.entity.Applicantintention;
import com.lzh.common.entity.ApplicantintentionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ApplicantintentionMapper {
    int countByExample(ApplicantintentionExample example);

    int deleteByExample(ApplicantintentionExample example);

    int deleteByPrimaryKey(Integer aid);

    int insert(Applicantintention record);

    int insertSelective(Applicantintention record);

    List<Applicantintention> selectByExample(ApplicantintentionExample example);

    Applicantintention selectByPrimaryKey(Integer aid);

    int updateByExampleSelective(@Param("record") Applicantintention record, @Param("example") ApplicantintentionExample example);

    int updateByExample(@Param("record") Applicantintention record, @Param("example") ApplicantintentionExample example);

    int updateByPrimaryKeySelective(Applicantintention record);

    int updateByPrimaryKey(Applicantintention record);
}