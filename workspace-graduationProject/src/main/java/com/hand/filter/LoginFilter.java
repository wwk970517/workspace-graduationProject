package com.hand.filter;

import com.hand.user.po.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@WebFilter(filterName = "LoginFilter")
public class LoginFilter implements Filter {
    public void destroy() {
    }
 
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //chain.doFilter(req, resp);
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        User user = (User)session.getAttribute("LoginUser");
        if(user != null){
            chain.doFilter(request,response);
        } else{
            out.println("您还未登陆，三秒钟后跳转至登录页面");
            //out.println("<script language='javascript'>alert('你还未登录');");
            response.setHeader("refresh","3;./login.jsp");
            //response.sendRedirect("/pages/users/login.jsp");
            //request.getRequestDispatcher("/pages/users/login.jsp").forward(request,response);
        }
    }
 
    public void init(FilterConfig config) throws ServletException {
 
    }
}
