package util;
import java.sql.*;

public class Connect {
	 Connection conn=null;
     public Connect(){}
     public Connection connect() throws ClassNotFoundException{
    	 String driver = "com.mysql.jdbc.Driver";   
    	 String url = "jdbc:mysql://localhost:3306/lizheng?useSSL=false";
    	//MySQL配置时的用户名
    	  String user = "root";
    	//MySQL配置时的密码
    	  String password = "root";
    try {
        // 连接数据库
    	
    	Class.forName(driver);
        conn = DriverManager.getConnection(url, user, password);
        if(conn!=null&&!conn.isClosed())
        	System.out.println("Succeeded connecting to the Database!");
    }catch(SQLException e) {
        e.printStackTrace();}
    return conn;
     }  
}