/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.dao;

import com.bakenow.core.model.Order;
import com.bakenow.core.model.OrderItem;
import com.bakenow.util.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tlminh
 */
public class OrderDAO {

    private static final String GET_ORDER_LIST = "SELECT id, orderNumber, buyerId, createTime, total, statusId FROM [Order]";
    private static final String GET_ORDER_ITEMS = "SELECT id, productId, quantity, price FROM OrderItem WHERE orderId = ?";
    private static final String GET_PRODUCT_NAME = "SELECT title FROM Product WHERE id = ?";
    private static final String GET_PRODUCT_IMG = "SELECT imgUrl FROM Product WHERE id = ?";
    private static final String GET_SHOP_NAME = "SELECT name FROM Shop WHERE id = ?";
    private static final String GET_SHOP_ID_BY_PRODUCT_ID = "SELECT shopId FROM Product WHERE id = ?";

    public List<Order> getOrderList() throws SQLException {
        List<Order> orderList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ORDER_LIST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int orderId = rs.getInt("id");
                    int buyerId = rs.getInt("buyerId");
                    Date createTime = rs.getDate("createTime");
                    String orderNumber = rs.getString("orderNumber");
                    double total = rs.getDouble("total");
                    int statusId = rs.getInt("statusId");
                    orderList.add(new Order(orderId, orderNumber, buyerId, createTime, total, null, statusId));
                }
                for (Order order : orderList) {
                    order.setOrderItems(getOrderItemsByOrderId(order.getOrderId()));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return orderList;
    }

    //Get all items of an order by providing the orderId
    public ArrayList<OrderItem> getOrderItemsByOrderId(int orderId) throws SQLException {
        ArrayList<OrderItem> orderItems = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ORDER_ITEMS);
                ptm.setInt(1, orderId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    int productId = rs.getInt("productId");
                    double price = rs.getDouble("price");
                    int orderQuantity = rs.getInt("quantity");
                    orderItems.add(new OrderItem(id, orderId, productId, "", orderQuantity, price, 0, "", ""));
                }
                for (OrderItem orderItem : orderItems) {
                    orderItem.setProductName(getProductNameById(orderItem.getProductId()));
                    int shopId = getShopIdByProductId(orderItem.getProductId());
                    orderItem.setShopId(shopId);
                    orderItem.setShopName(getShopNameById(shopId));
                    orderItem.setProductImgUrl(getProductImgById(orderItem.getProductId()));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return orderItems;
    }
    
    //Get the product title by providing productId
    public String getProductNameById(int productId) throws SQLException{
        String productName = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_NAME);
                ptm.setInt(1, productId);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    productName = rs.getString("title");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return productName;
    }
    
    //Get the shopId by prodiving productId
    public int getShopIdByProductId(int productId) throws SQLException{
        int shopId = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SHOP_ID_BY_PRODUCT_ID);
                ptm.setInt(1, productId);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    shopId = rs.getInt("shopId");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return shopId;
    }
    
    //Get the shopName by providing shopId
    public String getShopNameById(int shopId) throws SQLException{
        String shopName = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SHOP_NAME);
                ptm.setInt(1, shopId);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    shopName = rs.getString("name");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return shopName;
    }
    
    //Get the product image url by providing productId
    public String getProductImgById(int productId) throws SQLException{
        String productImg = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_IMG);
                ptm.setInt(1, productId);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    productImg = rs.getString("imgUrl");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return productImg;
    }
}
