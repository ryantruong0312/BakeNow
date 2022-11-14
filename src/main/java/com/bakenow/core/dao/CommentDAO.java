/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.dao;

import com.bakenow.core.model.Comment;
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
public class CommentDAO {
    private static final String GET_PRODUCT_COMMENTS_BY_ID = "SELECT userId, createTime, contents FROM Comment WHERE productId = ?";
    private static final String ADD_PRODUCT_COMMENT = "INSERT INTO Comment(userId, contents, createTime, productId) VALUES (?,?,?,?)";
    
    //Add comment to a product
    public boolean addProductComment(int recipeId, int userId, String contents) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD_PRODUCT_COMMENT);
                ptm.setInt(1, userId);
                ptm.setString(2, contents);
                ptm.setDate(3, java.sql.Date.valueOf(java.time.LocalDate.now()));
                ptm.setInt(4, recipeId);
                result = ptm.executeUpdate() > 0;
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
        return result;
    }
    
    
    public ArrayList<Comment> getProductCommentsById(int productId) throws SQLException {
        ArrayList<Comment> comments = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            UserDAO uDao = new UserDAO();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_COMMENTS_BY_ID);
                ptm.setInt(1, productId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int userId = rs.getInt("userId");
                    java.sql.Date createTime = rs.getDate("createTime");
                    String contents = rs.getString("contents");
                    String displayName = uDao.getDisplayNameById(userId);
                    String avatarUrl = uDao.getAvatarUrlOfUserById(userId);
                    comments.add(new Comment(userId, displayName, avatarUrl, createTime, contents));
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
        return comments;
    }
}
