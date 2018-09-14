package com.lzh.common.entity;

import java.util.ArrayList;
import java.util.List;

public class ApplicantintentionExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ApplicantintentionExample() {
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

        public Criteria andWorktypeIsNull() {
            addCriterion("worktype is null");
            return (Criteria) this;
        }

        public Criteria andWorktypeIsNotNull() {
            addCriterion("worktype is not null");
            return (Criteria) this;
        }

        public Criteria andWorktypeEqualTo(String value) {
            addCriterion("worktype =", value, "worktype");
            return (Criteria) this;
        }

        public Criteria andWorktypeNotEqualTo(String value) {
            addCriterion("worktype <>", value, "worktype");
            return (Criteria) this;
        }

        public Criteria andWorktypeGreaterThan(String value) {
            addCriterion("worktype >", value, "worktype");
            return (Criteria) this;
        }

        public Criteria andWorktypeGreaterThanOrEqualTo(String value) {
            addCriterion("worktype >=", value, "worktype");
            return (Criteria) this;
        }

        public Criteria andWorktypeLessThan(String value) {
            addCriterion("worktype <", value, "worktype");
            return (Criteria) this;
        }

        public Criteria andWorktypeLessThanOrEqualTo(String value) {
            addCriterion("worktype <=", value, "worktype");
            return (Criteria) this;
        }

        public Criteria andWorktypeLike(String value) {
            addCriterion("worktype like", value, "worktype");
            return (Criteria) this;
        }

        public Criteria andWorktypeNotLike(String value) {
            addCriterion("worktype not like", value, "worktype");
            return (Criteria) this;
        }

        public Criteria andWorktypeIn(List<String> values) {
            addCriterion("worktype in", values, "worktype");
            return (Criteria) this;
        }

        public Criteria andWorktypeNotIn(List<String> values) {
            addCriterion("worktype not in", values, "worktype");
            return (Criteria) this;
        }

        public Criteria andWorktypeBetween(String value1, String value2) {
            addCriterion("worktype between", value1, value2, "worktype");
            return (Criteria) this;
        }

        public Criteria andWorktypeNotBetween(String value1, String value2) {
            addCriterion("worktype not between", value1, value2, "worktype");
            return (Criteria) this;
        }

        public Criteria andRegionIsNull() {
            addCriterion("region is null");
            return (Criteria) this;
        }

        public Criteria andRegionIsNotNull() {
            addCriterion("region is not null");
            return (Criteria) this;
        }

        public Criteria andRegionEqualTo(String value) {
            addCriterion("region =", value, "region");
            return (Criteria) this;
        }

        public Criteria andRegionNotEqualTo(String value) {
            addCriterion("region <>", value, "region");
            return (Criteria) this;
        }

        public Criteria andRegionGreaterThan(String value) {
            addCriterion("region >", value, "region");
            return (Criteria) this;
        }

        public Criteria andRegionGreaterThanOrEqualTo(String value) {
            addCriterion("region >=", value, "region");
            return (Criteria) this;
        }

        public Criteria andRegionLessThan(String value) {
            addCriterion("region <", value, "region");
            return (Criteria) this;
        }

        public Criteria andRegionLessThanOrEqualTo(String value) {
            addCriterion("region <=", value, "region");
            return (Criteria) this;
        }

        public Criteria andRegionLike(String value) {
            addCriterion("region like", value, "region");
            return (Criteria) this;
        }

        public Criteria andRegionNotLike(String value) {
            addCriterion("region not like", value, "region");
            return (Criteria) this;
        }

        public Criteria andRegionIn(List<String> values) {
            addCriterion("region in", values, "region");
            return (Criteria) this;
        }

        public Criteria andRegionNotIn(List<String> values) {
            addCriterion("region not in", values, "region");
            return (Criteria) this;
        }

        public Criteria andRegionBetween(String value1, String value2) {
            addCriterion("region between", value1, value2, "region");
            return (Criteria) this;
        }

        public Criteria andRegionNotBetween(String value1, String value2) {
            addCriterion("region not between", value1, value2, "region");
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

        public Criteria andDealIsNull() {
            addCriterion("deal is null");
            return (Criteria) this;
        }

        public Criteria andDealIsNotNull() {
            addCriterion("deal is not null");
            return (Criteria) this;
        }

        public Criteria andDealEqualTo(String value) {
            addCriterion("deal =", value, "deal");
            return (Criteria) this;
        }

        public Criteria andDealNotEqualTo(String value) {
            addCriterion("deal <>", value, "deal");
            return (Criteria) this;
        }

        public Criteria andDealGreaterThan(String value) {
            addCriterion("deal >", value, "deal");
            return (Criteria) this;
        }

        public Criteria andDealGreaterThanOrEqualTo(String value) {
            addCriterion("deal >=", value, "deal");
            return (Criteria) this;
        }

        public Criteria andDealLessThan(String value) {
            addCriterion("deal <", value, "deal");
            return (Criteria) this;
        }

        public Criteria andDealLessThanOrEqualTo(String value) {
            addCriterion("deal <=", value, "deal");
            return (Criteria) this;
        }

        public Criteria andDealLike(String value) {
            addCriterion("deal like", value, "deal");
            return (Criteria) this;
        }

        public Criteria andDealNotLike(String value) {
            addCriterion("deal not like", value, "deal");
            return (Criteria) this;
        }

        public Criteria andDealIn(List<String> values) {
            addCriterion("deal in", values, "deal");
            return (Criteria) this;
        }

        public Criteria andDealNotIn(List<String> values) {
            addCriterion("deal not in", values, "deal");
            return (Criteria) this;
        }

        public Criteria andDealBetween(String value1, String value2) {
            addCriterion("deal between", value1, value2, "deal");
            return (Criteria) this;
        }

        public Criteria andDealNotBetween(String value1, String value2) {
            addCriterion("deal not between", value1, value2, "deal");
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