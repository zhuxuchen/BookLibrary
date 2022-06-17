package com.ly.bl.interceptor;

import com.ly.bl.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        //System.out.println(request.getRequestURI());
        if ((request.getRequestURI().indexOf("login.html")) > 0
                || (request.getRequestURI().indexOf("login.do")) > 0){
            return true;
        }
        //请求必须登录
        HttpSession httpSession = request.getSession();
        User user = (User) httpSession.getAttribute("user");
        if (user != null){
            return true;
        }
        request.setAttribute("msg","您需要登录之后才能操作！");
        request.getRequestDispatcher("/jsp/login.jsp").forward(request,response);
        return false;
    }
}
