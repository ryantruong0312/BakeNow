/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author tlminh
 */
public class Order {
    private int orderId;
    private String orderNumber;
    private int buyerId;
    private String buyerName;
    private String buyerAvatarUrl;
    private Date createTime;
    private double total;
    private int statusId;
    private ArrayList<OrderItem> orderItems;

    public Order() {
    }

    public Order(int orderId, String orderNumber, int buyerId, String buyerName, String buyerAvatarUrl, Date createTime, double total, int statusId, ArrayList<OrderItem> orderItems) {
        this.orderId = orderId;
        this.orderNumber = orderNumber;
        this.buyerId = buyerId;
        this.buyerName = buyerName;
        this.buyerAvatarUrl = buyerAvatarUrl;
        this.createTime = createTime;
        this.total = total;
        this.statusId = statusId;
        this.orderItems = orderItems;
    }

    

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public int getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(int buyerId) {
        this.buyerId = buyerId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public ArrayList<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(ArrayList<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName;
    }

    public String getBuyerAvatarUrl() {
        return buyerAvatarUrl;
    }

    public void setBuyerAvatarUrl(String buyerAvatarUrl) {
        this.buyerAvatarUrl = buyerAvatarUrl;
    }
    
    
    
}
