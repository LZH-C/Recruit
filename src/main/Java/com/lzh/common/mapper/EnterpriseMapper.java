package com.lzh.common.mapper;

import com.lzh.common.entity.Enterprise;
import com.lzh.common.entity.EnterpriseExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EnterpriseMapper {
    int countByExample(EnterpriseExample example);

    int deleteByExample(EnterpriseExample example);

    int deleteByPrimaryKey(Integer eid);

    int insert(Enterprise record);

    int insertSelective(Enterprise record);

    List<Enterprise> selectByExample(EnterpriseExample example);

    Enterprise selectByPrimaryKey(Integer eid);

    int updateByExampleSelective(@Param("record") Enterprise record, @Param("example") EnterpriseExample example);

    int updateByExample(@Param("record") Enterprise record, @Param("example") EnterpriseExample example);

    int updateByPrimaryKeySelective(Enterprise record);

    int updateByPrimaryKey(Enterprise record);
}