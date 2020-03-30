package com.huamai.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huamai.entity.DowUser;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.huamai.constant.SysConstant;
import com.huamai.entity.User;


public class LoginInterceptor implements HandlerInterceptor
{
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	// 获取请求的URL
       //string.indexOf("b") 含有则返回下标，没有则返回-1；
        String url = request.getRequestURI();
        if (url.indexOf("vLogin") >= 0 || url.indexOf("frontview") >= 0 || url.indexOf("proscenium") >= 0 || url.indexOf("vDowngo") >=0) {
            return true;
        }
        //登陆下载文件的session
        HttpSession session2 = request.getSession();
        DowUser user2 = (DowUser) session2.getAttribute(SysConstant.DowUserSession);
        // 登陆后台管理的session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute(SysConstant.UserSession);

        if (user != null || user2 !=null) {
            return true;
        }
        // 获取Session
      /*  HttpSession session2 = request.getSession();
        DowUser user1 = (DowUser) session.getAttribute(SysConstant.UserSession);
        if (user1 != null) {
            return true;
        }else{*/

        response.sendRedirect(request.getContextPath() + "/href/downGo/vDowngo.do");
        return false;
    }


    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception
    {
        // TODO Auto-generated method stub

    }


    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception
    {
        // TODO Auto-generated method stub

    }
}
