package com.major.servletJspPractice.common.util;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
    public static Connection getConnection() throws URISyntaxException, SQLException {
        try{
/*            URI jdbUri = new URI(System.getenv("jl9vnhc2lgr03s17:ahvj4h3yf757zes1@uyu7j8yohcwo35j3" +
                            ".cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/snpuoiypl7vycwpc"
                    ));
            String username = jdbUri.getUserInfo().split(":")[0];
            String password = jdbUri.getUserInfo().split(":")[1];
            String port = String.valueOf(jdbUri.getPort());
            String jdbUrl = "jdbc:mariadb://" + jdbUri.getHost() + ":3306/"+ jdbUri.getPath() + "?characterEncoding=UTF-8&serverTimezone=UTC";
            System.out.println(username);
            System.out.println(password);
            System.out.println(port);
            System.out.println(jdbUrl);
            return DriverManager.getConnection(jdbUrl, username, password);*/
            Class.forName("org.mariadb.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mariadb://uyu7j8yohcwo35j3.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/snpuoiypl7vycwpc?characterEncoding=UTF-8&serverTimezone=UTC",
                    "jl9vnhc2lgr03s17","ahvj4h3yf757zes1");
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    };

}//	"jdbc:mariadb://jl9vnhc2lgr03s17:ahvj4h3yf757zes1@uyu7j8yohcwo35j3.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/snpuoiypl7vycwpc?characterEncoding=UTF-8&serverTimezone=UTC";
