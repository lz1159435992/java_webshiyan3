package dao;

import java.sql.*;
import domain.Administrator;
import util.Connect;
public class AdministratorDao {

	private Connection con=null;
	private ResultSet rs=null;
    public Administrator find(String username, String password) {
        try{
        	PreparedStatement pstmt=null;
        	Administrator administrator = null;
        	Connect conn = new Connect();
			con = conn.connect();
	 		//sql = con.createStatement();
			//rs = sql.executeQuery("SELECT * FROM users WHERE username="+username+" and password='"+password+"'");
			pstmt = con.prepareStatement("select * from administrators where username=? and password=?");
			pstmt.setString(1,username );
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();  
			
			if (rs.next()) {
				administrator = new Administrator();
				administrator.setUsername(username);
				administrator.setPassword(password);
			}
            con.close();
            return administrator;
        
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void add(Administrator administrator) {
        try{
        	Connect conn = new Connect();
			con = conn.connect();
			PreparedStatement pstmt=null;
			pstmt = con.prepareStatement("insert into administrators VALIES (?,?)");
			pstmt.setString(1, administrator.getUsername());
			pstmt.setString(2, administrator.getPassword());
			pstmt.executeUpdate();
			con.close();
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}


