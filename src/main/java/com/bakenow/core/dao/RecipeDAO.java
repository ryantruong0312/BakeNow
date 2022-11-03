/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.dao;

import com.bakenow.core.model.Ingredient;
import com.bakenow.util.DBUtils;
import com.bakenow.core.model.Recipe;
import com.bakenow.core.model.Tool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author tlminh
 */
public class RecipeDAO {

    private static final String GET_RECIPE_LIST = "SELECT id, authorId, createTime, approvalTime, approverId, title, [desc], cookTime, imgUrl, voteCount"
            + " FROM Recipe WHERE statusId = 1";
    private static final String GET_RECIPE_BY_ID = "SELECT authorId, createTime, approvalTime, approverId, title, [desc], cookTime, imgUrl, voteCount"
            + " FROM Recipe WHERE id = ?";
    private static final String GET_STEPS_BY_ID = "SELECT stepNumber, contents FROM RecipeStep WHERE recipeId = ?";
    private static final String GET_INGREDIENTS_BY_ID = "SELECT productCategoryId, alias, amount FROM RecipeItem WHERE recipeId = ? AND isIngredient = 1";
    private static final String GET_TOOLS_BY_ID = "SELECT productCategoryId, alias FROM RecipeItem WHERE recipeId = ? AND isIngredient = 0";
    private static final String GET_DISPLAY_NAME_BY_ID = "SELECT displayName FROM [User] WHERE id = ?";
    private static final String GET_AVATAR_URL_BY_ID = "SELECT avatarUrl FROM [User] WHERE id = ?";

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
                    Timestamp createTime = rs.getTimestamp("createTime");
                    Timestamp approvalTime = rs.getTimestamp("approvalTime");
                    int approverId = rs.getInt("approverId");
                    String title = rs.getString("title");
                    String desc = rs.getString("desc");
                    int cookTime = rs.getInt("cookTime");
                    String imgUrl = rs.getString("imgUrl");
                    int voteCount = rs.getInt("voteCount");
                    recipeList.add(new Recipe(id, authorId, "", createTime, approvalTime, approverId, "", imgUrl, title, desc, null, null, null, cookTime, voteCount, 0, ""));
                }
                for (Recipe recipe : recipeList) {
                    String authorName = getDisplayNameById(recipe.getAuthorId());
                    String approverName = getDisplayNameById(recipe.getApproverId());
                    String authorAvatarUrl = getAvatarUrlOfUserById(recipe.getAuthorId());
                    recipe.setAuthorName(authorName);
                    recipe.setApproverName(approverName);
                    recipe.setAuthorAvatarUrl(authorAvatarUrl);
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

    //Get avatar url of an account by providing user id
    public String getAvatarUrlOfUserById(int id) throws SQLException {
        String url = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_AVATAR_URL_BY_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    url = rs.getString("avatarUrl");
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
        return url;
    }

    //Get info of a recipe by providing recipeId
    public Recipe getRecipeById(int recipeId) throws SQLException {
        Recipe recipe = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_RECIPE_BY_ID);
                ptm.setInt(1, recipeId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int authorId = rs.getInt("authorId");
                    Timestamp createTime = rs.getTimestamp("createTime");
                    Timestamp approvalTime = rs.getTimestamp("approvalTime");
                    int approverId = rs.getInt("approverId");
                    String title = rs.getString("title");
                    String desc = rs.getString("desc");
                    int cookTime = rs.getInt("cookTime");
                    String imgUrl = rs.getString("imgUrl");
                    int voteCount = rs.getInt("voteCount");
                    recipe = new Recipe(recipeId, authorId, "", createTime, approvalTime, approverId, "", imgUrl, title, desc, null, null, null, cookTime, voteCount, 0, "");
                }
                recipe.setAuthorName(getDisplayNameById(recipe.getAuthorId()));
                recipe.setApproverName(getDisplayNameById(recipe.getApproverId()));
                recipe.setAuthorAvatarUrl(getAvatarUrlOfUserById(recipe.getAuthorId()));
                recipe.setSteps(getRecipeStepsById(recipeId));
                recipe.setIngredients(getRecipeIngredientsById(recipeId));
                recipe.setTools(getRecipeToolsById(recipeId));
                
                System.out.println(recipe.getTitle());
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
        return recipe;
    }

    //Get all steps of a recipe
    public  HashMap<Integer,String> getRecipeStepsById(int recipeId) throws SQLException {
        HashMap<Integer,String> steps = new HashMap();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_STEPS_BY_ID);
                ptm.setInt(1, recipeId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int stepNumber = rs.getInt("stepNumber");
                    String contents = rs.getString("contents");
                    steps.put(stepNumber, contents);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
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
        return steps;
    }
    
    //Get the list of all ingredients and their amount by providing recipeId
    public ArrayList<Ingredient> getRecipeIngredientsById(int recipeId) throws SQLException {
        ArrayList<Ingredient> ingredients = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_INGREDIENTS_BY_ID);
                ptm.setInt(1, recipeId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productCategoryId = rs.getInt("productCategoryId");
                    String alias = rs.getString("alias");
                    String amount = rs.getString("amount");
                    ingredients.add(new Ingredient(productCategoryId, alias, amount));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
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
        return ingredients;
    }
    
    //Get the list of all tool
    public ArrayList<Tool> getRecipeToolsById(int recipeId) throws SQLException{
        ArrayList<Tool> tools = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_TOOLS_BY_ID);
                ptm.setInt(1, recipeId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productCategoryId = rs.getInt("productCategoryId");
                    String alias = rs.getString("alias");
                    tools.add(new Tool(productCategoryId, alias));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
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
        return tools;
    }
}
