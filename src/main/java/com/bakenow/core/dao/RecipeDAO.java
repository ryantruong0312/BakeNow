/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.dao;

import com.bakenow.core.model.Comment;
import com.bakenow.util.DBUtils;
import com.bakenow.core.model.Recipe;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author tlminh
 */
public class RecipeDAO {

    private static final String GET_RECIPE_LIST = "SELECT id, authorId, createTime, approvalTime, approverId, title, [desc], cookTime, statusId, imgUrl, voteCount"
            + " FROM Recipe";
    private static final String GET_RECIPE_BY_ID = "SELECT authorId, createTime, approvalTime, approverId, title, [desc], cookTime, imgUrl, voteCount"
            + " FROM Recipe WHERE id = ?";
    private static final String GET_STEPS_BY_ID = "SELECT stepNumber, contents FROM RecipeStep WHERE recipeId = ?";
    private static final String GET_INGREDIENTS_BY_ID = "SELECT name, amount FROM RecipeItem WHERE recipeId = ? AND isIngredient = 1";
    private static final String GET_TOOLS_BY_ID = "SELECT name FROM RecipeItem WHERE recipeId = ? AND isIngredient = 0";
    private static final String GET_DISPLAY_NAME_BY_ID = "SELECT displayName FROM [User] WHERE id = ?";
    private static final String GET_AVATAR_URL_BY_ID = "SELECT avatarUrl FROM [User] WHERE id = ?";
    private static final String GET_RECIPE_COMMENTS_BY_ID = "SELECT userId, createTime, contents FROM Comment WHERE recipeId = ?";
    private static final String ADD_RECIPE_COMMENT = "INSERT INTO Comment(userId, contents, createTime, recipeId) VALUES (?,?,?,?)";
    private static final String UPDATE_RECIPE_INFO = "UPDATE Recipe SET title = ?, [desc] = ?, cookTime = ?, imgUrl = ? WHERE id = ?";
    private static final String INSERT_RECIPE_INFO = "INSERT INTO Recipe(authorId, createTime, title, [desc], cookTime, imgUrl) OUTPUT Inserted.id VALUES(?,?,?,?,?,?)";
    private static final String DELETE_RECIPE_STEPS = "DELETE FROM RecipeStep WHERE recipeId = ?";
    private static final String ADD_RECIPE_STEP = "INSERT INTO RecipeStep(recipeId,stepNumber,contents) VALUES(?,?,?)";
    private static final String DELETE_RECIPE_ITEMS = "DELETE FROM RecipeItem WHERE recipeId = ?";
    private static final String ADD_RECIPE_ITEM = "INSERT INTO RecipeItem(recipeId,name,amount,isIngredient) VALUES(?,?,?,?)";
    private static final String DELETE_RECIPE_VOTES = "DELETE FROM RecipeVote WHERE recipeId = ?";
    private static final String DELETE_RECIPE_COMMENTS = "DELETE FROM Comment WHERE recipeId = ?";
    private static final String DELETE_RECIPE_TODOLIST = "DELETE FROM TodoList WHERE recipeId = ?";
    private static final String DELETE_RECIPE = "DELETE FROM Recipe WHERE id = ?";

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
                    int statusId = rs.getInt("statusId");
                    recipeList.add(new Recipe(id, authorId, "", createTime, approvalTime, approverId, "", imgUrl, title, desc, null, null, null, cookTime, voteCount, statusId, "", null));
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
                    Date createTime = rs.getDate("createTime");
                    Date approvalTime = rs.getDate("approvalTime");
                    int approverId = rs.getInt("approverId");
                    String title = rs.getString("title");
                    String desc = rs.getString("desc");
                    int cookTime = rs.getInt("cookTime");
                    String imgUrl = rs.getString("imgUrl");
                    int voteCount = rs.getInt("voteCount");
                    recipe = new Recipe(recipeId, authorId, "", createTime, approvalTime, approverId, "", imgUrl, title, desc, null, null, null, cookTime, voteCount, 0, "", null);
                }
                recipe.setAuthorName(getDisplayNameById(recipe.getAuthorId()));
                recipe.setApproverName(getDisplayNameById(recipe.getApproverId()));
                recipe.setAuthorAvatarUrl(getAvatarUrlOfUserById(recipe.getAuthorId()));
                recipe.setSteps(getRecipeStepsById(recipeId));
                recipe.setIngredients(getRecipeIngredientsById(recipeId));
                recipe.setTools(getRecipeToolsById(recipeId));
                recipe.setComments(getRecipeCommentsById(recipeId));

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
    public HashMap<Integer, String> getRecipeStepsById(int recipeId) throws SQLException {
        HashMap<Integer, String> steps = new HashMap();
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
        return steps;
    }

    //Get the list of all ingredients and their amount by providing recipeId
    public HashMap<String, String> getRecipeIngredientsById(int recipeId) throws SQLException {
        HashMap<String, String> ingredients = new HashMap<>();
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
                    String name = rs.getString("name");
                    String amount = rs.getString("amount");
                    ingredients.put(name, amount);
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
        return ingredients;
    }

    //Get the list of all tool
    public ArrayList<String> getRecipeToolsById(int recipeId) throws SQLException {
        ArrayList<String> tools = new ArrayList<>();
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
                    String name = rs.getString("name");
                    tools.add(name);
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
        return tools;
    }

    //Get all comments of a recipe by providing recipeId
    public ArrayList<Comment> getRecipeCommentsById(int recipeId) throws SQLException {
        ArrayList<Comment> comments = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_RECIPE_COMMENTS_BY_ID);
                ptm.setInt(1, recipeId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int userId = rs.getInt("userId");
                    Date createTime = rs.getDate("createTime");
                    String contents = rs.getString("contents");
                    String displayName = getDisplayNameById(userId);
                    String avatarUrl = getAvatarUrlOfUserById(userId);
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

    //Add comment to a recipe
    public boolean addRecipeComment(int recipeId, int userId, String contents) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD_RECIPE_COMMENT);
                ptm.setInt(1, userId);
                ptm.setString(2, contents);
                ptm.setDate(3, Date.valueOf(java.time.LocalDate.now()));
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

    public boolean updateRecipe(int recipeId, String title, String desc, int cookTime, String imgUrl, String[] stepContents, String[] ingredientNames, String[] amounts, String[] tools) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_RECIPE_INFO);
                ptm.setString(1, title);
                ptm.setString(2, desc);
                ptm.setInt(3, cookTime);
                ptm.setString(4, imgUrl);
                ptm.setInt(5, recipeId);
                result = ptm.executeUpdate() > 0;

                ptm = conn.prepareStatement(DELETE_RECIPE_STEPS);
                ptm.setInt(1, recipeId);
                result = ptm.executeUpdate() > 0;
                int count = 1;
                for (String stepContent : stepContents) {
                    ptm = conn.prepareStatement(ADD_RECIPE_STEP);
                    ptm.setInt(1, recipeId);
                    ptm.setInt(2, count);
                    ptm.setString(3, stepContent);
                    result = ptm.executeUpdate() > 0;
                    count++;
                }
                ptm = conn.prepareStatement(DELETE_RECIPE_ITEMS);
                ptm.setInt(1, recipeId);
                result = ptm.executeUpdate() > 0;
                count = 0;
                for (String ingredientName : ingredientNames) {
                    ptm = conn.prepareStatement(ADD_RECIPE_ITEM);
                    ptm.setInt(1, recipeId);
                    ptm.setString(2, ingredientName);
                    ptm.setString(3, amounts[count]);
                    ptm.setBoolean(4, true);
                    result = ptm.executeUpdate() > 0;
                    count++;
                }
                for (String tool : tools) {
                    ptm = conn.prepareStatement(ADD_RECIPE_ITEM);
                    ptm.setInt(1, recipeId);
                    ptm.setString(2, tool);
                    ptm.setString(3, "");
                    ptm.setBoolean(4, false);
                    result = ptm.executeUpdate() > 0;
                }
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

    public boolean addRecipe(int authorId, String title, String desc, int cookTime, String imgUrl, String[] stepContents, String[] ingredientNames, String[] amounts, String[] tools) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int recipeId = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_RECIPE_INFO);
                ptm.setInt(1, authorId);
                ptm.setDate(2, Date.valueOf(java.time.LocalDate.now()));
                ptm.setString(3, title);
                ptm.setString(4, desc);
                ptm.setInt(5, cookTime);
                ptm.setString(6, imgUrl);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    recipeId = rs.getInt("id");
                }
                int count = 1;
                for (String stepContent : stepContents) {
                    ptm = conn.prepareStatement(ADD_RECIPE_STEP);
                    ptm.setInt(1, recipeId);
                    ptm.setInt(2, count);
                    ptm.setString(3, stepContent);
                    result = ptm.executeUpdate() > 0;
                    count++;
                }
                count = 0;
                for (String ingredientName : ingredientNames) {
                    ptm = conn.prepareStatement(ADD_RECIPE_ITEM);
                    ptm.setInt(1, recipeId);
                    ptm.setString(2, ingredientName);
                    ptm.setString(3, amounts[count]);
                    ptm.setBoolean(4, true);
                    result = ptm.executeUpdate() > 0;
                    count++;
                }
                for (String tool : tools) {
                    ptm = conn.prepareStatement(ADD_RECIPE_ITEM);
                    ptm.setInt(1, recipeId);
                    ptm.setString(2, tool);
                    ptm.setString(3, "");
                    ptm.setBoolean(4, false);
                    result = ptm.executeUpdate() > 0;
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
        return result;
    }

    public boolean deleteRecipe(int recipeId) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_RECIPE_STEPS);
                ptm.setInt(1, recipeId);
                result = ptm.executeUpdate() > 0;
                ptm = conn.prepareStatement(DELETE_RECIPE_ITEMS);
                ptm.setInt(1, recipeId);
                result = ptm.executeUpdate() > 0;
                ptm = conn.prepareStatement(DELETE_RECIPE_VOTES);
                ptm.setInt(1, recipeId);
                result = ptm.executeUpdate() > 0;
                ptm = conn.prepareStatement(DELETE_RECIPE_COMMENTS);
                ptm.setInt(1, recipeId);
                result = ptm.executeUpdate() > 0;
                ptm = conn.prepareStatement(DELETE_RECIPE_TODOLIST);
                ptm.setInt(1, recipeId);
                result = ptm.executeUpdate() > 0;
                ptm = conn.prepareStatement(DELETE_RECIPE);
                ptm.setInt(1, recipeId);
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
}
