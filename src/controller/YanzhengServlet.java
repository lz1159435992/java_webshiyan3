package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Administrator;
import domain.Question;
import domain.User;
import service.AdministratorService;
import service.QuestionService;
import service.UserService;
import util.MD5;

/**
 * Servlet implementation class YanzhengServlet
 */
@WebServlet("/YanzhengServlet")
public class YanzhengServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public YanzhengServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		MD5 md5 = new MD5();
		String username = request.getParameter("username");
		String password = md5.toMD5(request.getParameter("password"));
		String choice = request.getParameter("choice");
		if(choice.equals("user")){
			UserService userService = new UserService();
			
			User user = userService.loginUser(username, password);
			if (user!=null){
				request.getSession().setAttribute("user", user);
				QuestionService questionService = new QuestionService();
				ArrayList<Question> qes = questionService.getQuestions();
				request.setAttribute("questions", qes);
				request.getRequestDispatcher("dati.jsp").forward(request, response);
			}
				//request.getRequestDispatcher("question.jsp").forward(request, response);
			else
				response.sendRedirect("start.jsp");
			}
		else
		{
			AdministratorService AdministratorService = new AdministratorService();
			
			Administrator administrator = AdministratorService.loginAdministrator(username, password);
			if (administrator!=null){
				request.getSession().setAttribute("administrator", administrator);
				response.sendRedirect("change.jsp");
			}
				//request.getRequestDispatcher("change.jsp").forward(request, response);
			else
				response.sendRedirect("start.jsp");
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
