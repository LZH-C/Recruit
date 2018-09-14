package com.lzh.common.mapper;

import com.lzh.common.entity.Manager;
import com.lzh.common.entity.ManagerExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ManagerMapper {
    int countByExample(ManagerExample example);

    int deleteByExample(ManagerExample example);

    int deleteByPrimaryKey(String username);

    int insert(Manager record);

    int insertSelective(Manager record);

    List<Manager> selectByExample(ManagerExample example);

    Manager selectByPrimaryKey(String username);

    int updateByExampleSelective(@Param("record") Manager record, @Param("example") ManagerExample example);

    int updateByExample(@Param("record") Manager record, @Param("example") ManagerExample example);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);
}