package service;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.QuestionDao;
import domain.Question;
public class QuestionService {
	private QuestionDao questionDao = new QuestionDao();
	public ArrayList<Question> getQuestions(){
		return questionDao.getQuestions();
	}
	public void addQuestion(Question question){
		questionDao.add(question);
	}
	public void removeQuestion(Question question){
		questionDao.remove(question);
	}
	public String find(Question question) throws ClassNotFoundException, SQLException{
		return questionDao.find(question);
	}
}
