package dao;

import domain.User;
import java.sql.*;


import util.Connect;
public class UserDao {

	private Connection con=null;
	private ResultSet rs=null;
    public User find(String username, String password) {
        try{
        	PreparedStatement pstmt=null;
        	User user = null;
        	Connect conn = new Connect();
			con = conn.connect();
	 		//sql = con.createStatement();
			//rs = sql.executeQuery("SELECT * FROM users WHERE username="+username+" and password='"+password+"'");
			pstmt = con.prepareStatement("select * from users where username=? and password=?");
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();  
			
			if (rs.next()) {
				user = new User();
				user.setUsername(username);
				user.setPassword(password);
			}
            con.close();
            return user;
        
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void add(User user) {
        try{
        	Connect conn = new Connect();
			con = conn.connect();
			PreparedStatement pstmt=null;
			pstmt = con.prepareStatement("insert into users VALIES (?,?)");
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.executeUpdate();
			con.close();
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}


