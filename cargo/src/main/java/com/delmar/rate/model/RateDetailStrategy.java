package com.delmar.rate.model;

import java.math.BigDecimal;

import com.delmar.core.model.CoreModel;

public class RateDetailStrategy extends CoreModel{

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column r_detail_strategy.min
     *
     *
     */
    private BigDecimal min;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column r_detail_strategy.max
     *
     *
     */
    private BigDecimal max;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column r_detail_strategy.r_rate_detail_id
     *
     *
     */
    private Integer rRateDetailId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column r_detail_strategy.id
     *
     * @return the value of r_detail_strategy.id
     *
     *
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column r_detail_strategy.id
     *
     * @param id the value for r_detail_strategy.id
     *
     *
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column r_detail_strategy.min
     *
     * @return the value of r_detail_strategy.min
     *
     *
     */
    public BigDecimal getMin() {
        return min;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column r_detail_strategy.min
     *
     * @param min the value for r_detail_strategy.min
     *
     *
     */
    public void setMin(BigDecimal min) {
        this.min = min;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column r_detail_strategy.max
     *
     * @return the value of r_detail_strategy.max
     *
     *
     */
    public BigDecimal getMax() {
        return max;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column r_detail_strategy.max
     *
     * @param max the value for r_detail_strategy.max
     *
     *
     */
    public void setMax(BigDecimal max) {
        this.max = max;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column r_detail_strategy.r_rate_detail_id
     *
     * @return the value of r_detail_strategy.r_rate_detail_id
     *
     *
     */
    public Integer getrRateDetailId() {
        return rRateDetailId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column r_detail_strategy.r_rate_detail_id
     *
     * @param rRateDetailId the value for r_detail_strategy.r_rate_detail_id
     *
     *
     */
    public void setrRateDetailId(Integer rRateDetailId) {
        this.rRateDetailId = rRateDetailId;
    }
}