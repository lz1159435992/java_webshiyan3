package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Question;
import service.QuestionService;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
		response.getWriter().append("Served at: ").append(request.getContextPath());
		QuestionService questionService = new QuestionService();
		
		Question question = new Question();
		question.setQuestion(request.getParameter("str_qes"));
		question.setChoice_a(request.getParameter("str_choice_a"));
		question.setChoice_b(request.getParameter("str_choice_b"));
		question.setChoice_c(request.getParameter("str_choice_c"));
		question.setChoice_d(request.getParameter("str_choice_d"));
		question.setRight(request.getParameter("right"));
		String s = questionService.find(question);
		if(s.equals("error")){
			response.sendRedirect("tianjia.jsp?error=error");
		}
		questionService.addQuestion(question);
		ArrayList<Question> quest = questionService.getQuestions();
		request.setAttribute("questions", quest);
		request.getRequestDispatcher("changequestion.jsp").forward(request, response);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
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
