package com.major.servletJspPractice.common.evaluation;

import com.major.servletJspPractice.common.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EvaluationDAO {

    public int write(EvaluationDTO evDTO) {
        String SQL = "INSERT into evaluation values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, evDTO.getUserName());
            pstmt.setString(2, evDTO.getLectureName());
            pstmt.setString(3, evDTO.getProfName());
            pstmt.setInt(4, evDTO.getLectureYear());
            pstmt.setString(5, evDTO.getSemesterDivide());
            pstmt.setString(6, evDTO.getLectureDivide());
            pstmt.setString(7, evDTO.getEvaluationTitle());
            pstmt.setString(8, evDTO.getEvaluationContent());
            pstmt.setString(9, evDTO.getTotalScore());
            pstmt.setString(10, evDTO.getCreditScore());
            pstmt.setString(11, evDTO.getComfortableScore());
            pstmt.setString(12, evDTO.getLectureScore());


            return pstmt.executeUpdate();
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
        return -2; //데이터베이스 오류
    }
    public ResultSet inquire(){
        String SQL = "SELECT * from evaluation";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            return rs;
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
        return rs; //데이터베이스 오류
    }
}
