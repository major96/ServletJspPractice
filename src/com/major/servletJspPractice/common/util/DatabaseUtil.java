package com.major.servletJspPractice.common.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
    public static Connection getConnection(){
        try{
            String dbUrl = "jdbc:mariadb://localhost:3306/JspUser?characterEncoding=UTF-8&serverTimezone=UTC";
            String dbId = "root";
            String dbPassword = "bluesky1";
            Class.forName("org.mariadb.jdbc.Driver");
            return DriverManager.getConnection(dbUrl, dbId, dbPassword);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    };

}
