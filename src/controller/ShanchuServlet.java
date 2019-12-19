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
 * Servlet implementation class ShanchuServlet
 */
@WebServlet("/ShanchuServlet")
public class ShanchuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShanchuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		QuestionService questionService = new QuestionService();
		ArrayList<Question> qes = questionService.getQuestions();
		String nid = (String)request.getParameter("index");
		//String nid = (String)request.getAttribute("index");
		System.out.println(request.getSession().getAttribute("shanchu"));
		int id = Integer.parseInt(nid)-1;
		nid = String.valueOf(id);
		Question ques = qes.get(id);
		questionService.removeQuestion(ques);
		ArrayList<Question> quest = questionService.getQuestions();
		request.setAttribute("questions", quest);
		request.getRequestDispatcher("changequestion.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
