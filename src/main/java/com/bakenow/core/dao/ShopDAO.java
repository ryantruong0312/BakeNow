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
import java.util.Date;
/**
 *
 * @author Admin
 */
public class ShopDAO {
    public static final String LOAD_ALL_SHOP = "select id,ownerId,[name],avatarUrl,[description],rating,ratingCount,productCount,email,phone,[address] from Shop";
    private static final String SEARCH_SHOP_BY_SHOPID ="select id,ownerId,[name],avatarUrl,[description],rating,ratingCount,productCount,email,phone,[address] from Shop where id = ?";
    private static final String GET_SHOP_BY_OWNER_ID ="select id,ownerId,[name],avatarUrl,[description],rating,ratingCount,productCount,email,phone,[address] from Shop where ownerId = ?";
    private static final String GET_SHOP_ESTABLISHDATE ="select createTime from dbo.[User] u join Shop s on u.id = s.ownerId where s.id = ?";
    private static final String GET_SHOP_NUMOFPRODUCT = "SELECT COUNT(id) AS count FROM Product where  shopId = ? and statusId = 1 ";
    private static final String EDIT_SHOP = """
                                                 UPDATE Shop
                                                 SET  avatarUrl = ?,[description] = ?,email= ?,phone=?, name =?
                                                 WHERE id = ?""";
    private static final String EDIT_SHOP_NAME = """
                                                 UPDATE Shop
                                                 SET  name =?
                                                 WHERE id = ?""";
    private static final String EDIT_SHOP_AVA = """
                                                 UPDATE Shop
                                                 SET  avatarUrl =?
                                                 WHERE id = ?""";
    private static final String EDIT_SHOP_DES = """
                                                 UPDATE Shop
                                                 SET  [description] = ?
                                                 WHERE id = ?""";
    private static final String EDIT_SHOP_EMAIL = """
                                                 UPDATE Shop
                                                 SET  email= ?
                                                 WHERE id = ?""";
    private static final String EDIT_SHOP_PHONE = """
                                                 UPDATE Shop
                                                 SET  phone=?
                                                 WHERE id = ?""";
    public void editShopProFile(int shopId,String avatarUrl, String description,String Email,String phone,String name) throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(EDIT_SHOP);
                ptm.setString(1, avatarUrl);
                ptm.setString(2, description);
                ptm.setString(3, Email);
                ptm.setString(4, phone);
                ptm.setString(5, name);
                ptm.setInt(6, shopId);
                ptm.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
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
    public void editShopName(int shopId,String name) throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(EDIT_SHOP_NAME);
                ptm.setString(1, name);
                ptm.setInt(2, shopId);
                ptm.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
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
    public void editShopDis(int shopId,String name) throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(EDIT_SHOP_DES);
                ptm.setString(1, name);
                ptm.setInt(2, shopId);
                ptm.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
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
    public void editShopEmail(int shopId,String name) throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(EDIT_SHOP_EMAIL);
                ptm.setString(1, name);
                ptm.setInt(2, shopId);
                ptm.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
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
    public void editShopAva(int shopId,String name) throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(EDIT_SHOP_AVA);
                ptm.setString(1, name);
                ptm.setInt(2, shopId);
                ptm.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
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
    public void editShopPhone(int shopId,String name) throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(EDIT_SHOP_PHONE);
                ptm.setString(1, name);
                ptm.setInt(2, shopId);
                ptm.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
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
    
    
    public int getProductNumberOfShop(String shopId) throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SHOP_NUMOFPRODUCT);
                ptm.setString(1, shopId.trim());
//                ptm.setInt(2, noOfProducts);
                int numOfProduct = 0;
                rs = ptm.executeQuery();
                while (rs.next()) {
                    numOfProduct = rs.getInt(1);
                    return numOfProduct;
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
        return 0;
    }
    public Date getShopEstablishDate(String ownerId) throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SHOP_ESTABLISHDATE);
                ptm.setString(1, ownerId.trim());
//                ptm.setInt(2, noOfProducts);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Date doe = rs.getDate("createTime");
                    return doe;
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
