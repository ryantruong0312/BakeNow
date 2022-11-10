/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.util;

/**
 *
 * @author Admin
 */
public class imgUrlUtil {
    public boolean checkimgUrl(String imgUrl){
        boolean check = imgUrl.contains("E:\\summer_2022\\software project\\BakeNow_Official\\BakeNow\\target\\BakeNow\\assests\\img");
           return check;
    }
    public String getImgName(String imgUrl){
        try {
            int index = imgUrl.indexOf('/');
            String after =imgUrl.substring(index+1);
            return after;
        } catch (Exception e) {
        }
        return null;
    }
}
