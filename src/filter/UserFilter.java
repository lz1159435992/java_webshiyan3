package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Administrator;
import domain.User;

/**
 * Servlet Filter implementation class UserFilter
 */
@WebFilter("/UserFilter")
public class UserFilter implements Filter {

    /**
     * Default constructor. 
     */
    public UserFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
	    HttpServletResponse res = (HttpServletResponse) response;
	    
	    HttpSession session = req.getSession(true);
	    User user = new User();
	    user = (User)session.getAttribute("user");
	    //从session里取的用户名信息
	    Administrator administrator = new Administrator();
	    administrator = (Administrator)session.getAttribute("administrator");
	    //判断如果没有取到用户信息,就跳转到登陆页面
	    if (user == null || "".equals(user.getUsername())) {
	      //跳转到登陆页面
	      res.sendRedirect("http://"+req.getHeader("Host")+"/start.jsp");
	    }
	    else if(administrator == null || "".equals(administrator.getUsername())){
	    res.sendRedirect("http://"+req.getHeader("Host")+"/start.jsp");
	    }
	    else {
	      //已经登陆,继续此次请求
	      chain.doFilter(request,response);
	    }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
