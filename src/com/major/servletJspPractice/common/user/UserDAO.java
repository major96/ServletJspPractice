package com.major.servletJspPractice.common.user;

import com.major.servletJspPractice.common.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserDAO {
    public int join (String userId, String userPwd){
        String SQL = "INSERT INTO USER (username, password) VALUES (?, ?)";
        try{
            Connection conn = DatabaseUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userId);
            pstmt.setString(2, userPwd);
            return pstmt.executeUpdate(); // 값이 추가되면 1, 안되면 0을 반환
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

}
