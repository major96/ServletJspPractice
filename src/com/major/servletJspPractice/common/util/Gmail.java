package com.major.servletJspPractice.common.util;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends  Authenticator{

    @Override
    protected PasswordAuthentication getPasswordAuthentication(){
        return new PasswordAuthentication("jinkeun96@gmail.com", "jgpark0903");
    }

}
