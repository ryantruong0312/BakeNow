/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.dao;

/**
 *
 * @author Admin
 */
public class test {
    public static void main(String[] args) {
        String url = "E:\\summer_2022\\software project\\BakeNow_Official\\BakeNow\\target\\BakeNow\\assets\\img/15621699_1813067048973944_1060579613836659971_n.jpg";
        int x = url.indexOf('/');
        
        System.out.println(x);
        String after =url.substring(x+1);
        System.out.println(after);
        
    }
}
