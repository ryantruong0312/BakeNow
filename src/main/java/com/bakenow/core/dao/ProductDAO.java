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
import java.util.Date;
import java.util.List;
/**
 *
 * @author Admin
 */
public class ProductDAO {

    // nhớ là chưa có check kết nối giữa db với netbean nha
    private static final String GET_PRODUCT = "";
    private static final String LOAD = "select id,title,price,rating,reviewCount,imgUrl from product where statusID = 1";
    private static final String GET_PRODUCT_BY_ID = "select id,shopId,categoryId,imgUrl,title,origin,mnfDate,expDate,[description],price,stock,rating,reviewCount from product where id = ?";
    private static final String GET_PRODUCT_BY_CATEGORY_ID = """
                                                          SELECT p.id,p.title,p.price,p.rating,p.reviewCount,p.imgUrl
                                                                 FROM Product p JOIN ProductCategory c ON c.id = p.categoryId
                                                                 WHERE (c.id) = ?""";
    private static final String GET_PRODUCT_BY_SHOP_ID = "select id,shopId,categoryId,imgUrl,title,origin,mnfDate,expDate,[description],price,stock,rating,reviewCount from product where shopId = ?";
    private static final String GET_PRODUCT_FOR_DISPLAY_IN_SHOP = "select id,shopId,categoryId,imgUrl,title,origin,mnfDate,expDate,[description],price,stock,rating,reviewCount from product where shopId = ? and statusID = ?";
    private static final String SEARCH_PRODUCT_BY_NAME = "select id,shopId,categoryId,imgUrl,title,origin,mnfDate,expDate,[description],price,stock,rating,reviewCount from product where title like ? and statusID = 1";
    private static final String DELETE_PRODUCT = """
                                                 UPDATE Product
                                                 SET statusId = 3
                                                 WHERE id = ?""";
    private static final String ADD_NEW_PRODUCT = """
                                                 INSERT INTO[Product]([shopId],[categoryId],[createTime],
                                                 [imgUrl],[title],[origin],
                                                  [mnfDate],[expDate],[description],[price],[stock],[statusId])
                                                 VALUES
                                                 	(?,?,?,
                                                  ?,?,?,
                                                  ?,?,?,?,?,0)""";
    public List<Product> getAllProductByShopId(String shopID,int statusId) throws SQLException {
        List<Product> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_FOR_DISPLAY_IN_SHOP);
                ptm.setString(1, shopID);
                ptm.setInt(2, statusId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    int shopId = rs.getInt("shopId");
                    int categoryId = rs.getInt("categoryId");
                    String imgUrl = rs.getString("imgUrl");
                    String name = rs.getString("title").toUpperCase();
                    String origin = rs.getString("origin");
                    Date mnfDate = rs.getDate("mnfDate");
                    Date expDate = rs.getDate("expDate");
                    String description = rs.getString("description");
                    double price = rs.getDouble("price");
                    int stock = rs.getInt("stock");
                    double rating = rs.getDouble("rating");
                    int reviewCount = rs.getInt("reviewCount");
                    listProduct.add(new Product(id, shopId, categoryId, imgUrl, name, origin, mnfDate, expDate, description, price, stock, rating, reviewCount));
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
    
    
    public void addNewProDuct(int shopId, int categoryId,Date createDate,String imgUrl,String title,String origin,Date mnfDate,Date expDate,
            String description,double price,int stock) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD_NEW_PRODUCT);
                ptm.setInt(1, shopId);
                ptm.setInt(2, categoryId);
                java.sql.Date createDateSQLDate = new java.sql.Date(createDate.getTime());
                ptm.setDate(3, createDateSQLDate);
                ptm.setString(4, imgUrl);
                ptm.setString(5, title);
                ptm.setString(6, origin);
                java.sql.Date manuDateSQLDate = new java.sql.Date(mnfDate.getTime());
                ptm.setDate(7, manuDateSQLDate);
                java.sql.Date expDateSQLDate = new java.sql.Date(expDate.getTime());
                ptm.setDate(8, expDateSQLDate);
                ptm.setString(9, description);
                ptm.setDouble(10, price);
                ptm.setInt(11, stock);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
    
    
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
                    listProduct.add(new Product(id, name, imgUrl, price, rating, reviewCount));
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
    public List<Product> getProductsByCategoryId(String categoryId) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<Product> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_BY_CATEGORY_ID);
                ptm.setString(1, categoryId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("title").toUpperCase();
                    double price = rs.getDouble("price");
                    double rating = rs.getDouble("rating");
                    int reviewCount = rs.getInt("reviewCount");
                    String imgUrl = rs.getString("imgUrl");
                    list.add(new Product(id, name, imgUrl, price, rating, reviewCount));
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

    public Product getProductsById(String searchid) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Product product;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_BY_ID);
                int productId = Integer.parseInt(searchid);
                ptm.setInt(1, productId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    int shopId = rs.getInt("shopId");
                    int categoryId = rs.getInt("categoryId");
                    String imgUrl = rs.getString("imgUrl");
                    String name = rs.getString("title").toUpperCase();
                    String origin = rs.getString("origin");
                    Date mnfDate = rs.getDate("mnfDate");
                    Date expDate = rs.getDate("expDate");
                    String description = rs.getString("description");
                    double price = rs.getDouble("price");
                    int stock = rs.getInt("stock");
                    double rating = rs.getDouble("rating");
                    int reviewCount = rs.getInt("reviewCount");

                    return product = new Product(id, shopId, categoryId, imgUrl, name, origin, mnfDate, expDate, description, price, stock, rating, reviewCount);
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
        return null;
    }

    public List<Product> getAllProductByShopId(String shopID) throws SQLException {
        List<Product> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_BY_SHOP_ID);
                ptm.setString(1, shopID);
//                ptm.setInt(2, noOfProducts);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    int shopId = rs.getInt("shopId");
                    int categoryId = rs.getInt("categoryId");
                    String imgUrl = rs.getString("imgUrl");
                    String name = rs.getString("title").toUpperCase();
                    String origin = rs.getString("origin");
                    Date mnfDate = rs.getDate("mnfDate");
                    Date expDate = rs.getDate("expDate");
                    String description = rs.getString("description");
                    double price = rs.getDouble("price");
                    int stock = rs.getInt("stock");
                    double rating = rs.getDouble("rating");
                    int reviewCount = rs.getInt("reviewCount");
                    listProduct.add(new Product(id, shopId, categoryId, imgUrl, name, origin, mnfDate, expDate, description, price, stock, rating, reviewCount));
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

    public List<Product> getProductsByName(String productName) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<Product> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_PRODUCT_BY_NAME);
                ptm.setString(1, "%" + productName + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    int shopId = rs.getInt("shopId");
                    int categoryId = rs.getInt("categoryId");
                    String imgUrl = rs.getString("imgUrl");
                    String name = rs.getString("title").toUpperCase();
                    String origin = rs.getString("origin");
                    Date mnfDate = rs.getDate("mnfDate");
                    Date expDate = rs.getDate("expDate");
                    String description = rs.getString("description");
                    double price = rs.getDouble("price");
                    int stock = rs.getInt("stock");
                    double rating = rs.getDouble("rating");
                    int reviewCount = rs.getInt("reviewCount");
                    list.add(new Product(id, shopId, categoryId, imgUrl, name, origin, mnfDate, expDate, description, price, stock, rating, reviewCount));
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

    public void deleteProductsById(String productId) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_PRODUCT);
                ptm.setInt(1, Integer.parseInt(productId));
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
    public String classifyImgUrl(String imgUrl){
        if (imgUrl.contains(LOAD)) {
            
        }
    return null;
    }
  
}
