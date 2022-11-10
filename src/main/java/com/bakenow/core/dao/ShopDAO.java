/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.dao;
import com.bakenow.core.model.Product;
import java.util.List;
import com.bakenow.core.model.Shop;
import com.bakenow.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author Admin
 */
public class ShopDAO {
    public static final String LOAD_ALL_SHOP = "select id,ownerId,[name],avatarUrl,[description],rating,ratingCount,productCount,email,phone,[address] from Shop";
    private static final String SEARCH_SHOP_BY_SHOPID ="select id,ownerId,[name],avatarUrl,[description],rating,ratingCount,productCount,email,phone,[address] from Shop where id = ?";
    private static final String GET_SHOP_BY_OWNER_ID ="select id,ownerId,[name],avatarUrl,[description],rating,ratingCount,productCount,email,phone,[address] from Shop where ownerId = ?";
    public List<Shop> getAllShop() throws SQLException {
        List<Shop> listShop = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOAD_ALL_SHOP);
               //ptm.setInt(1, offset);
               //ptm.setInt(2, noOfProducts);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    int ownerId = rs.getInt("ownerId");
                    String name = rs.getString("[name]") ;
                    String avatarUrl= rs.getString("avatarUrl");
                    String description= rs.getString("[description]");
                    double rating= rs.getDouble("rating") ;
                    int ratingCount = rs.getInt("ratingCount");
                    int productCount= rs.getInt("productCount");
                    String email= rs.getString("email");
                    String phone= rs.getString("phone");
                    String address= rs.getString("[address]");
                    listShop.add(new Shop(id, ownerId, name, avatarUrl, description, rating, ratingCount, productCount, email, phone, address));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
//            if (rs != null) {
//                ptm = conn.prepareStatement(NUMBER_OF_ALL_PRODUCT);
//                rs = ptm.executeQuery();
//                if (rs.next()) {
//                    this.numberOfProduct = rs.getInt("ROW_COUNT");
//                }
//                rs.close();
//            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listShop;
    }
    
    public Shop getShopById(String shopId) throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_SHOP_BY_SHOPID);
                ptm.setString(1, shopId.trim());
//                ptm.setInt(2, noOfProducts);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    int ownerId = rs.getInt("ownerId");
                    String name = rs.getString("name") ;
                    String avatarUrl= rs.getString("avatarUrl");
                    String description= rs.getString("description");
                    double rating= rs.getDouble("rating") ;
                    int ratingCount = rs.getInt("ratingCount");
                    int productCount= rs.getInt("productCount");
                    String email= rs.getString("email");
                    String phone= rs.getString("phone");
                    String address= rs.getString("address");
                    return new Shop(id, ownerId, name, avatarUrl, description, rating, ratingCount, productCount, email, phone, address);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
//            if (rs != null) {
//                ptm = conn.prepareStatement(NUMBER_OF_ALL_PRODUCT);
//                rs = ptm.executeQuery();
//                if (rs.next()) {
//                    this.numberOfProduct = rs.getInt("ROW_COUNT");
//                }
//                rs.close();
//            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
       return null;
    }
    
    public Shop getShopByOwnerId(int tmpownerId) throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SHOP_BY_OWNER_ID);
                ptm.setString(1, Integer.toString(tmpownerId).trim());
//                ptm.setInt(2, noOfProducts);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    int ownerId = rs.getInt("ownerId");
                    String name = rs.getString("name") ;
                    String avatarUrl= rs.getString("avatarUrl");
                    String description= rs.getString("description");
                    double rating= rs.getDouble("rating") ;
                    int ratingCount = rs.getInt("ratingCount");
                    int productCount= rs.getInt("productCount");
                    String email= rs.getString("email");
                    String phone= rs.getString("phone");
                    String address= rs.getString("address");
                    return new Shop(id, ownerId, name, avatarUrl, description, rating, ratingCount, productCount, email, phone, address);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
//            if (rs != null) {
//                ptm = conn.prepareStatement(NUMBER_OF_ALL_PRODUCT);
//                rs = ptm.executeQuery();
//                if (rs.next()) {
//                    this.numberOfProduct = rs.getInt("ROW_COUNT");
//                }
//                rs.close();
//            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
       return null;
    }
}
