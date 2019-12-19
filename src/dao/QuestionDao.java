package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import domain.Question;
import domain.User;
import util.Connect;

public class QuestionDao {
	private Connection con=null;
	private ResultSet rs=null;
	//Question[] questions = new Question[];
	public ArrayList<Question> getQuestions(){
		 try{
			 	ArrayList<Question> questions = new ArrayList<Question>();
	        	PreparedStatement pstmt=null;
	        	
	        	Connect conn = new Connect();
				con = conn.connect();
				pstmt = con.prepareStatement("select * from questions");
				rs = pstmt.executeQuery();  
				while(rs.next()){
					Question qes = new Question();
					qes.setQuestion(rs.getString("question"));
					qes.setChoice_a(rs.getString("choice_a"));
					qes.setChoice_b(rs.getString("choice_b"));
					qes.setChoice_c(rs.getString("choice_c"));
					qes.setChoice_d(rs.getString("choice_d"));
					qes.setRight(rs.getString("right"));
					questions.add(qes);
				}
	            con.close();
	        return questions;
	        }catch (Exception e) {
	            throw new RuntimeException(e);
	        }
	}
	public void add(Question question){
		try{
        	Connect conn = new Connect();
			con = conn.connect();
			PreparedStatement pstmt=null;
			pstmt = con.prepareStatement("insert into questions VALUES (?,?,?,?,?,?)");
			pstmt.setString(1, question.getQuestion());
			pstmt.setString(2, question.getChoice_a());
			pstmt.setString(3, question.getChoice_b());
			pstmt.setString(4, question.getChoice_c());
			pstmt.setString(5, question.getChoice_d());
			pstmt.setString(6, question.getRight());
			pstmt.executeUpdate();
			con.close();
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
	}
	public void remove(Question question){
		try{
        	Connect conn = new Connect();
			con = conn.connect();
			PreparedStatement pstmt=null;
			//pstmt = con.prepareStatement("delete from questions where question = ? and choice_a = ? and choice_b = ? and choice_c = ? and choice_d = ? and right = ?");
			pstmt = con.prepareStatement("delete from questions where question = ?");
			pstmt.setString(1, question.getQuestion());
			//pstmt.setString(2, question.getChoice_a());
			//pstmt.setString(3, question.getChoice_b());
			//pstmt.setString(4, question.getChoice_c());
			//pstmt.setString(5, question.getChoice_d());
			//pstmt.setString(6, question.getRight());
			pstmt.executeUpdate();
			con.close();
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
	}
	public String find(Question question) throws SQLException, ClassNotFoundException{
		String s = null;
		Connection con=null;
		PreparedStatement stmt=null;
		Connect connect=new Connect();
		con=(Connection) connect.connect();
		Statement st;
		con.setAutoCommit(true); 
		st=(Statement) con.createStatement(); 
		ResultSet rs=st.executeQuery("SELECT * from questions");
		s="yes";
		while(rs.next())
		{
			if(question.getQuestion().equals(rs.getString("question"))){
			s="error";
			}
		}
		return s;
	}
	public void addQuestion(String question,String choice_a,String choice_b,String choice_c,String choice_d,String right){
		Question qes = new Question();
		qes.setQuestion(question);
		qes.setChoice_a(choice_a);
		qes.setChoice_b(choice_b);
		qes.setChoice_c(choice_c);
		qes.setChoice_d(choice_d);
		qes.setRight(right);
		
	}
	

}
