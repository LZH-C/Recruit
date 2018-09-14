package com.lzh.common.pojo;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 招聘系统自定义响应结构
 */
public class RecruitResult {

    // 定义jackson对象
    private static final ObjectMapper MAPPER = new ObjectMapper();

    // 响应业务状态
    private Integer status;

    // 响应消息
    private String msg;

    // 响应中的数据
    private Object data;

    public static RecruitResult build(Integer status, String msg, Object data) {
        return new RecruitResult(status, msg, data);
    }

    public static RecruitResult ok(Object data) {
        return new RecruitResult(data);
    }

    public static RecruitResult ok() {
        return new RecruitResult(null);
    }
    
    public static RecruitResult fail() {
    	RecruitResult fail=new RecruitResult();
    	fail.data=null;
    	fail.msg="fail";
    	fail.status=500;
        return fail;
    }
    
    public static RecruitResult betweenInOkAndFail(int status) {
    	RecruitResult betweenInOkAndFail=new RecruitResult();
    	betweenInOkAndFail.data=null;
    	betweenInOkAndFail.msg="betweenInOkAndFail";
    	betweenInOkAndFail.status=status;
        return betweenInOkAndFail;
    }

    public RecruitResult() {

    }

    public static RecruitResult build(Integer status, String msg) {
        return new RecruitResult(status, msg, null);
    }

    public RecruitResult(Integer status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public RecruitResult(Object data) {
        this.status = 200;
        this.msg = "OK";
        this.data = data;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    /**
     * 将json结果集转化为RecruitResult对象
     * 
     * @param jsonData json数据
     * @param clazz RecruitResult中的object类型
     * @return
     */
    public static RecruitResult formatToPojo(String jsonData, Class<?> clazz) {
        try {
            if (clazz == null) {
                return MAPPER.readValue(jsonData, RecruitResult.class);
            }
            JsonNode jsonNode = MAPPER.readTree(jsonData);
            JsonNode data = jsonNode.get("data");
            Object obj = null;
            if (clazz != null) {
                if (data.isObject()) {
                    obj = MAPPER.readValue(data.traverse(), clazz);
                } else if (data.isTextual()) {
                    obj = MAPPER.readValue(data.asText(), clazz);
                }
            }
            return build(jsonNode.get("status").intValue(), jsonNode.get("msg").asText(), obj);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 没有object对象的转化
     * 
     * @param json
     * @return
     */
    public static RecruitResult format(String json) {
        try {
            return MAPPER.readValue(json, RecruitResult.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Object是集合转化
     * 
     * @param jsonData json数据
     * @param clazz 集合中的类型
     * @return
     */
    public static RecruitResult formatToList(String jsonData, Class<?> clazz) {
        try {
            JsonNode jsonNode = MAPPER.readTree(jsonData);
            JsonNode data = jsonNode.get("data");
            Object obj = null;
            if (data.isArray() && data.size() > 0) {
                obj = MAPPER.readValue(data.traverse(),
                        MAPPER.getTypeFactory().constructCollectionType(List.class, clazz));
            }
            return build(jsonNode.get("status").intValue(), jsonNode.get("msg").asText(), obj);
        } catch (Exception e) {
            return null;
        }
    }

}
