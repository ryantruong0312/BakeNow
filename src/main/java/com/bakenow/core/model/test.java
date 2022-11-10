/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model;

/**
 *
 * @author Admin
 */
public class test {
    public static void main(String[] args) {
        String imgUrl ="E:\\summer_2022\\software project\\BakeNow_Official\\BakeNow\\target\\BakeNow\\assests\\img/16406719_1829500327330616_7411789099708233415_n.jpg";
        int index = imgUrl.indexOf('/');
            String after =imgUrl.substring(index+1);
        System.out.println(after);
        System.out.println(imgUrl.contains("E:\\summer_2022\\software project\\BakeNow_Official\\BakeNow\\target\\BakeNow\\assests\\img"));
    }
}
