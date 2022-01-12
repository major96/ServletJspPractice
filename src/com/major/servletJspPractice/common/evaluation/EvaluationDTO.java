package com.major.servletJspPractice.common.evaluation;

public class EvaluationDTO {
    private Long id;
    private String userName;
    private String lectureName;
    private String profName;
    private int lectureYear;
    private String semesterDivide;
    private String lectureDivide;
    private String evaluationTitle;
    private String evaluationContent;
    private String totalScore;
    private String creditScore;
    private String comfortableScore;
    private String lectureScore;
    private int likeCount;

    public EvaluationDTO(){

    }
    public EvaluationDTO(Long id, String userName, String lectureName, String profName, int lectureYear, String semesterDivide,
                         String lectureDivide, String evaluationTitle, String evaluationContent, String totalScore, String creditScore, String comfortableScore, String lectureScore, int likeCount) {
        this.id = id;
        this.userName = userName;
        this.lectureName = lectureName;
        this.profName = profName;
        this.lectureYear = lectureYear;
        this.semesterDivide = semesterDivide;
        this.lectureDivide = lectureDivide;
        this.evaluationTitle = evaluationTitle;
        this.evaluationContent = evaluationContent;
        this.totalScore = totalScore;
        this.creditScore = creditScore;
        this.comfortableScore = comfortableScore;
        this.lectureScore = lectureScore;
        this.likeCount = likeCount;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getLectureName() {
        return lectureName;
    }

    public void setLectureName(String lectureName) {
        this.lectureName = lectureName;
    }

    public String getProfName() {
        return profName;
    }

    public void setProfName(String profName) {
        this.profName = profName;
    }

    public int getLectureYear() {
        return lectureYear;
    }

    public void setLectureYear(int lectureYear) {
        this.lectureYear = lectureYear;
    }

    public String getSemesterDivide() {
        return semesterDivide;
    }

    public void setSemesterDivide(String semesterDivide) {
        this.semesterDivide = semesterDivide;
    }

    public String getLectureDivide() {
        return lectureDivide;
    }

    public void setLectureDivide(String lectureDivide) {
        this.lectureDivide = lectureDivide;
    }

    public String getEvaluationTitle() {
        return evaluationTitle;
    }

    public void setEvaluationTitle(String evaluationTitle) {
        this.evaluationTitle = evaluationTitle;
    }

    public String getEvaluationContent() {
        return evaluationContent;
    }

    public void setEvaluationContent(String evaluationContent) {
        this.evaluationContent = evaluationContent;
    }

    public String getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(String totalScore) {
        this.totalScore = totalScore;
    }

    public String getCreditScore() {
        return creditScore;
    }

    public void setCreditScore(String creditScore) {
        this.creditScore = creditScore;
    }

    public String getComfortableScore() {
        return comfortableScore;
    }

    public void setComfortableScore(String comfortableScore) {
        this.comfortableScore = comfortableScore;
    }

    public String getLectureScore() {
        return lectureScore;
    }

    public void setLectureScore(String lectureScore) {
        this.lectureScore = lectureScore;
    }

    public int getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }

}
