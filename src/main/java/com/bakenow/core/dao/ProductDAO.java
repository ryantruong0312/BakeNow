/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.dao;

import com.bakenow.util.DBUtils;
import com.bakenow.core.model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDAO {
    // nhớ là chưa có check kết nối giữa db với netbean nha
    private static final String GET_PRODUCT = "";
    private static final String LOAD="select id,title,price,rating,reviewCount,imgUrl,shopId from product where statusID = 1";
    private static final String GET_PRODUCT_BY_CATEGORY = """
                                                          SELECT p.id,p.title,p.price,p.rating,p.reviewCount,p.imgUrl
                                                                      FROM Product p JOIN ProductCategory c ON c.id = p.categoryId
                                                                      WHERE (c.name) like ?""";
    
     public List<Product> getAllProduct() throws SQLException {
        List<Product> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOAD);
//                ptm.setInt(1, offset);
//                ptm.setInt(2, noOfProducts);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("title").toUpperCase();
                    double price = rs.getDouble("price");
                    double rating = rs.getDouble("rating");
                    int reviewCount = rs.getInt("reviewCount");
                    String imgUrl = rs.getString("imgUrl");
                    int shopID = rs.getInt("shopId");
                    listProduct.add(new Product(id, shopID, name,imgUrl, price, rating, reviewCount));
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
        return listProduct;
    }
    
    // query bằng id hay bằng tên nhờ nếu nó chọn 1 cái cate bất kỳ thì lấy được cái gì của cate đó tên
    public List<Product> getProductByCategory(String category) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<Product> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_BY_CATEGORY);
                ptm.setString(1, "%" + category + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("title").toUpperCase();
                    double price = rs.getDouble("price");
                    double rating = rs.getDouble("rating");
                    int reviewCount = rs.getInt("reviewCount");
                    String imgUrl = rs.getString("imgUrl");
                    list.add(new Product(id, name,imgUrl, price, rating, reviewCount));
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

        return list;
    }
    
    public List<Product> getProductsByCategory(int categoryID) throws SQLException {
        List<Product> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOAD);
//                ptm.setInt(1, offset);
//                ptm.setInt(2, noOfProducts);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("title").toUpperCase();
                    double price = rs.getDouble("price");
                    double rating = rs.getDouble("rating");
                    int reviewCount = rs.getInt("reviewCount");
                    String imgUrl = rs.getString("imgUrl");
                    listProduct.add(new Product(id, name,imgUrl, price, rating, reviewCount));
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
        return listProduct;
    }
   
}
