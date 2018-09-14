package com.lzh.common.mapper;

import com.lzh.common.entity.Discusstopic;
import com.lzh.common.entity.DiscusstopicExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DiscusstopicMapper {
    int countByExample(DiscusstopicExample example);

    int deleteByExample(DiscusstopicExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Discusstopic record);

    int insertSelective(Discusstopic record);

    List<Discusstopic> selectByExample(DiscusstopicExample example);

    Discusstopic selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Discusstopic record, @Param("example") DiscusstopicExample example);

    int updateByExample(@Param("record") Discusstopic record, @Param("example") DiscusstopicExample example);

    int updateByPrimaryKeySelective(Discusstopic record);

    int updateByPrimaryKey(Discusstopic record);
}