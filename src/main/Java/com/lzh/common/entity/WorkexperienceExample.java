package com.lzh.common.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WorkexperienceExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public WorkexperienceExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andAidIsNull() {
            addCriterion("aid is null");
            return (Criteria) this;
        }

        public Criteria andAidIsNotNull() {
            addCriterion("aid is not null");
            return (Criteria) this;
        }

        public Criteria andAidEqualTo(Integer value) {
            addCriterion("aid =", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidNotEqualTo(Integer value) {
            addCriterion("aid <>", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidGreaterThan(Integer value) {
            addCriterion("aid >", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidGreaterThanOrEqualTo(Integer value) {
            addCriterion("aid >=", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidLessThan(Integer value) {
            addCriterion("aid <", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidLessThanOrEqualTo(Integer value) {
            addCriterion("aid <=", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidIn(List<Integer> values) {
            addCriterion("aid in", values, "aid");
            return (Criteria) this;
        }

        public Criteria andAidNotIn(List<Integer> values) {
            addCriterion("aid not in", values, "aid");
            return (Criteria) this;
        }

        public Criteria andAidBetween(Integer value1, Integer value2) {
            addCriterion("aid between", value1, value2, "aid");
            return (Criteria) this;
        }

        public Criteria andAidNotBetween(Integer value1, Integer value2) {
            addCriterion("aid not between", value1, value2, "aid");
            return (Criteria) this;
        }

        public Criteria andBegintimeIsNull() {
            addCriterion("begintime is null");
            return (Criteria) this;
        }

        public Criteria andBegintimeIsNotNull() {
            addCriterion("begintime is not null");
            return (Criteria) this;
        }

        public Criteria andBegintimeEqualTo(Date value) {
            addCriterion("begintime =", value, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeNotEqualTo(Date value) {
            addCriterion("begintime <>", value, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeGreaterThan(Date value) {
            addCriterion("begintime >", value, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeGreaterThanOrEqualTo(Date value) {
            addCriterion("begintime >=", value, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeLessThan(Date value) {
            addCriterion("begintime <", value, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeLessThanOrEqualTo(Date value) {
            addCriterion("begintime <=", value, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeIn(List<Date> values) {
            addCriterion("begintime in", values, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeNotIn(List<Date> values) {
            addCriterion("begintime not in", values, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeBetween(Date value1, Date value2) {
            addCriterion("begintime between", value1, value2, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeNotBetween(Date value1, Date value2) {
            addCriterion("begintime not between", value1, value2, "begintime");
            return (Criteria) this;
        }

        public Criteria andEndtimeIsNull() {
            addCriterion("endtime is null");
            return (Criteria) this;
        }

        public Criteria andEndtimeIsNotNull() {
            addCriterion("endtime is not null");
            return (Criteria) this;
        }

        public Criteria andEndtimeEqualTo(Date value) {
            addCriterion("endtime =", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotEqualTo(Date value) {
            addCriterion("endtime <>", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeGreaterThan(Date value) {
            addCriterion("endtime >", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeGreaterThanOrEqualTo(Date value) {
            addCriterion("endtime >=", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeLessThan(Date value) {
            addCriterion("endtime <", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeLessThanOrEqualTo(Date value) {
            addCriterion("endtime <=", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeIn(List<Date> values) {
            addCriterion("endtime in", values, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotIn(List<Date> values) {
            addCriterion("endtime not in", values, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeBetween(Date value1, Date value2) {
            addCriterion("endtime between", value1, value2, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotBetween(Date value1, Date value2) {
            addCriterion("endtime not between", value1, value2, "endtime");
            return (Criteria) this;
        }

        public Criteria andOrganizationIsNull() {
            addCriterion("organization is null");
            return (Criteria) this;
        }

        public Criteria andOrganizationIsNotNull() {
            addCriterion("organization is not null");
            return (Criteria) this;
        }

        public Criteria andOrganizationEqualTo(String value) {
            addCriterion("organization =", value, "organization");
            return (Criteria) this;
        }

        public Criteria andOrganizationNotEqualTo(String value) {
            addCriterion("organization <>", value, "organization");
            return (Criteria) this;
        }

        public Criteria andOrganizationGreaterThan(String value) {
            addCriterion("organization >", value, "organization");
            return (Criteria) this;
        }

        public Criteria andOrganizationGreaterThanOrEqualTo(String value) {
            addCriterion("organization >=", value, "organization");
            return (Criteria) this;
        }

        public Criteria andOrganizationLessThan(String value) {
            addCriterion("organization <", value, "organization");
            return (Criteria) this;
        }

        public Criteria andOrganizationLessThanOrEqualTo(String value) {
            addCriterion("organization <=", value, "organization");
            return (Criteria) this;
        }

        public Criteria andOrganizationLike(String value) {
            addCriterion("organization like", value, "organization");
            return (Criteria) this;
        }

        public Criteria andOrganizationNotLike(String value) {
            addCriterion("organization not like", value, "organization");
            return (Criteria) this;
        }

        public Criteria andOrganizationIn(List<String> values) {
            addCriterion("organization in", values, "organization");
            return (Criteria) this;
        }

        public Criteria andOrganizationNotIn(List<String> values) {
            addCriterion("organization not in", values, "organization");
            return (Criteria) this;
        }

        public Criteria andOrganizationBetween(String value1, String value2) {
            addCriterion("organization between", value1, value2, "organization");
            return (Criteria) this;
        }

        public Criteria andOrganizationNotBetween(String value1, String value2) {
            addCriterion("organization not between", value1, value2, "organization");
            return (Criteria) this;
        }

        public Criteria andTradeIsNull() {
            addCriterion("trade is null");
            return (Criteria) this;
        }

        public Criteria andTradeIsNotNull() {
            addCriterion("trade is not null");
            return (Criteria) this;
        }

        public Criteria andTradeEqualTo(String value) {
            addCriterion("trade =", value, "trade");
            return (Criteria) this;
        }

        public Criteria andTradeNotEqualTo(String value) {
            addCriterion("trade <>", value, "trade");
            return (Criteria) this;
        }

        public Criteria andTradeGreaterThan(String value) {
            addCriterion("trade >", value, "trade");
            return (Criteria) this;
        }

        public Criteria andTradeGreaterThanOrEqualTo(String value) {
            addCriterion("trade >=", value, "trade");
            return (Criteria) this;
        }

        public Criteria andTradeLessThan(String value) {
            addCriterion("trade <", value, "trade");
            return (Criteria) this;
        }

        public Criteria andTradeLessThanOrEqualTo(String value) {
            addCriterion("trade <=", value, "trade");
            return (Criteria) this;
        }

        public Criteria andTradeLike(String value) {
            addCriterion("trade like", value, "trade");
            return (Criteria) this;
        }

        public Criteria andTradeNotLike(String value) {
            addCriterion("trade not like", value, "trade");
            return (Criteria) this;
        }

        public Criteria andTradeIn(List<String> values) {
            addCriterion("trade in", values, "trade");
            return (Criteria) this;
        }

        public Criteria andTradeNotIn(List<String> values) {
            addCriterion("trade not in", values, "trade");
            return (Criteria) this;
        }

        public Criteria andTradeBetween(String value1, String value2) {
            addCriterion("trade between", value1, value2, "trade");
            return (Criteria) this;
        }

        public Criteria andTradeNotBetween(String value1, String value2) {
            addCriterion("trade not between", value1, value2, "trade");
            return (Criteria) this;
        }

        public Criteria andDepartmentIsNull() {
            addCriterion("department is null");
            return (Criteria) this;
        }

        public Criteria andDepartmentIsNotNull() {
            addCriterion("department is not null");
            return (Criteria) this;
        }

        public Criteria andDepartmentEqualTo(String value) {
            addCriterion("department =", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentNotEqualTo(String value) {
            addCriterion("department <>", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentGreaterThan(String value) {
            addCriterion("department >", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentGreaterThanOrEqualTo(String value) {
            addCriterion("department >=", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentLessThan(String value) {
            addCriterion("department <", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentLessThanOrEqualTo(String value) {
            addCriterion("department <=", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentLike(String value) {
            addCriterion("department like", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentNotLike(String value) {
            addCriterion("department not like", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentIn(List<String> values) {
            addCriterion("department in", values, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentNotIn(List<String> values) {
            addCriterion("department not in", values, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentBetween(String value1, String value2) {
            addCriterion("department between", value1, value2, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentNotBetween(String value1, String value2) {
            addCriterion("department not between", value1, value2, "department");
            return (Criteria) this;
        }

        public Criteria andJobIsNull() {
            addCriterion("job is null");
            return (Criteria) this;
        }

        public Criteria andJobIsNotNull() {
            addCriterion("job is not null");
            return (Criteria) this;
        }

        public Criteria andJobEqualTo(String value) {
            addCriterion("job =", value, "job");
            return (Criteria) this;
        }

        public Criteria andJobNotEqualTo(String value) {
            addCriterion("job <>", value, "job");
            return (Criteria) this;
        }

        public Criteria andJobGreaterThan(String value) {
            addCriterion("job >", value, "job");
            return (Criteria) this;
        }

        public Criteria andJobGreaterThanOrEqualTo(String value) {
            addCriterion("job >=", value, "job");
            return (Criteria) this;
        }

        public Criteria andJobLessThan(String value) {
            addCriterion("job <", value, "job");
            return (Criteria) this;
        }

        public Criteria andJobLessThanOrEqualTo(String value) {
            addCriterion("job <=", value, "job");
            return (Criteria) this;
        }

        public Criteria andJobLike(String value) {
            addCriterion("job like", value, "job");
            return (Criteria) this;
        }

        public Criteria andJobNotLike(String value) {
            addCriterion("job not like", value, "job");
            return (Criteria) this;
        }

        public Criteria andJobIn(List<String> values) {
            addCriterion("job in", values, "job");
            return (Criteria) this;
        }

        public Criteria andJobNotIn(List<String> values) {
            addCriterion("job not in", values, "job");
            return (Criteria) this;
        }

        public Criteria andJobBetween(String value1, String value2) {
            addCriterion("job between", value1, value2, "job");
            return (Criteria) this;
        }

        public Criteria andJobNotBetween(String value1, String value2) {
            addCriterion("job not between", value1, value2, "job");
            return (Criteria) this;
        }

        public Criteria andSynopsisIsNull() {
            addCriterion("synopsis is null");
            return (Criteria) this;
        }

        public Criteria andSynopsisIsNotNull() {
            addCriterion("synopsis is not null");
            return (Criteria) this;
        }

        public Criteria andSynopsisEqualTo(String value) {
            addCriterion("synopsis =", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisNotEqualTo(String value) {
            addCriterion("synopsis <>", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisGreaterThan(String value) {
            addCriterion("synopsis >", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisGreaterThanOrEqualTo(String value) {
            addCriterion("synopsis >=", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisLessThan(String value) {
            addCriterion("synopsis <", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisLessThanOrEqualTo(String value) {
            addCriterion("synopsis <=", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisLike(String value) {
            addCriterion("synopsis like", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisNotLike(String value) {
            addCriterion("synopsis not like", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisIn(List<String> values) {
            addCriterion("synopsis in", values, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisNotIn(List<String> values) {
            addCriterion("synopsis not in", values, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisBetween(String value1, String value2) {
            addCriterion("synopsis between", value1, value2, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisNotBetween(String value1, String value2) {
            addCriterion("synopsis not between", value1, value2, "synopsis");
            return (Criteria) this;
        }

        public Criteria andCheckstateIsNull() {
            addCriterion("checkstate is null");
            return (Criteria) this;
        }

        public Criteria andCheckstateIsNotNull() {
            addCriterion("checkstate is not null");
            return (Criteria) this;
        }

        public Criteria andCheckstateEqualTo(Integer value) {
            addCriterion("checkstate =", value, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateNotEqualTo(Integer value) {
            addCriterion("checkstate <>", value, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateGreaterThan(Integer value) {
            addCriterion("checkstate >", value, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateGreaterThanOrEqualTo(Integer value) {
            addCriterion("checkstate >=", value, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateLessThan(Integer value) {
            addCriterion("checkstate <", value, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateLessThanOrEqualTo(Integer value) {
            addCriterion("checkstate <=", value, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateIn(List<Integer> values) {
            addCriterion("checkstate in", values, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateNotIn(List<Integer> values) {
            addCriterion("checkstate not in", values, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateBetween(Integer value1, Integer value2) {
            addCriterion("checkstate between", value1, value2, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateNotBetween(Integer value1, Integer value2) {
            addCriterion("checkstate not between", value1, value2, "checkstate");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}