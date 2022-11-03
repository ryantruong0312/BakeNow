/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.dao;

import com.bakenow.util.DBUtils;
import com.bakenow.core.model.Recipe;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author tlminh
 */
public class RecipeDAO {

    private static final String GET_RECIPE_LIST = "SELECT id, authorId, createTime, approvalTime, approverId, title, [desc], cookTime, imgUrl, voteCount"
            + " FROM Recipe WHERE statusId = 1";
    private static final String GET_DISPLAY_NAME_BY_ID = "SELECT displayName FROM [User] WHERE id = ?";

    public List<Recipe> getRecipeList() throws SQLException {
        List<Recipe> recipeList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_RECIPE_LIST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    int authorId = rs.getInt("authorId");
                    Date createTime = rs.getDate("createTime");
                    Date approvalTime = rs.getDate("approvalTime");
                    int approverId = rs.getInt("approverId");
                    String title = rs.getString("title");
                    String desc = rs.getString("desc");
                    int cookTime = rs.getInt("cookTime");
                    String imgUrl = rs.getString("imgUrl");
                    int voteCount = rs.getInt("voteCount");
                    recipeList.add(new Recipe(id, authorId, "", createTime, approvalTime, approverId, "", imgUrl, title, desc, null, null, null, cookTime, voteCount, 0));
                }
                for(Recipe recipe : recipeList){
                    String authorName = getDisplayNameById(recipe.getAuthorId());
                    String approverName = getDisplayNameById(recipe.getApproverId());
                    recipe.setAuthorName(authorName);
                    recipe.setApproverName(approverName);
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
        return recipeList;
    }

    public String getDisplayNameById(int id) throws SQLException {
        String name = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_DISPLAY_NAME_BY_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    name = rs.getString("displayName");
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
        return name;
    }
}
