package com.major.servletJspPractice.common.user;

public class UserDTO {
    private Long id;
    private String username;
    private String password;

    private String email;
    private String emailHash;
    private boolean emailChecked;

    public UserDTO(String username, String password, String email, String emailHash, boolean emailChecked) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.emailHash = emailHash;
        this.emailChecked = emailChecked;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmailHash() {
        return emailHash;
    }

    public void setEmailHash(String emailHash) {
        this.emailHash = emailHash;
    }

    public boolean isEmailChecked() {
        return emailChecked;
    }

    public void setEmailChecked(boolean emailChecked) {
        this.emailChecked = emailChecked;
    }

}
