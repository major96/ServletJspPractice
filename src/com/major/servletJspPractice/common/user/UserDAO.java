package com.major.servletJspPractice.common.user;

import com.major.servletJspPractice.common.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    public int login(String userId, String userPwd) {
        String SQL = "SELECT password FROM USER WHERE username = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString(1).equals(userPwd))
                    return 1; // 로그인 성공
                else
                    return 0; // 로그인 실패
            }
            return -1; //아이디 없음
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null)
                    pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (rs != null)
                    rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return -2; //데이터베이스 오류
    }

    public int join(UserDTO user) {
        String SQL = "INSERT INTO USER (username, password, email, emailHash, emailChecked" +
                ") VALUES (?, ?, ?, ?, false)";
        String DuplicationCheckQuery = "SELECT username FROM USER WHERE username = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet resultSet = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(DuplicationCheckQuery);
            pstmt.setString(1, user.getUsername());
            resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                if (!resultSet.getString(1).isEmpty()) {
                    return -1;
                }
            } else {
                pstmt.clearParameters();
                pstmt = conn.prepareStatement(SQL);
                pstmt.setString(1, user.getUsername());
                pstmt.setString(2, user.getPassword());
                pstmt.setString(3, user.getEmail());
                pstmt.setString(4, user.getEmailHash());
                return pstmt.executeUpdate(); // 값이 추가되면 1, 안되면 0을 반환
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null)
                    pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return -1; //데이터베이스 오류

    }

    public boolean getEmailChecked(String userId) {
        String SQL = "SELECT emailChecked FROM USER where username = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getBoolean(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null)
                    pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false; //데이터베이스 오류

    }

    public boolean setEmailChecked(String userId) {
        String SQL = "UPDATE USER SET emailChecked = true  where username = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userId);
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null)
                    pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false; //데이터베이스 오류

    }

    public String getUserEmail(String userId) {
        String SQL = "SELECT email FROM USER WHERE username = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null)
                    pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (rs != null)
                    rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return null; //데이터베이스 오류
    }
}