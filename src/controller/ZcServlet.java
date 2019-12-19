package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import util.Connect;
import util.MD5;

/**
 * Servlet implementation class ZcServlet
 */
@WebServlet("/ZcServlet")
public class ZcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZcServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try{
			MD5 md5 = new MD5();
			String username = request.getParameter("str_username");
			String password = request.getParameter("str_password");
			Connection con=null;
			PreparedStatement stmt=null;
			Connect connect=new Connect();
			con=(Connection) connect.connect();
			Statement st;
			con.setAutoCommit(true); 
			st=(Statement) con.createStatement(); 
			ResultSet rs=st.executeQuery("SELECT * from users");
			while(rs.next())
			{
				if(username.equals(rs.getString("username")))
				{	response.sendRedirect("zhuce.jsp?error=yes");					
				return;
				}}
			rs.close();
			st.close();
			String sql = "insert into users (username,password)values(?,?)";
			stmt = (PreparedStatement) con.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, md5.toMD5(password));//存入数据库的时候就将密码加密
			stmt.executeUpdate();
			stmt.close();
			con.close();
			response.sendRedirect("start.jsp");
		}catch(SQLException e) {
			System.out.println("错误"+e);
		}catch(Exception e){
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
