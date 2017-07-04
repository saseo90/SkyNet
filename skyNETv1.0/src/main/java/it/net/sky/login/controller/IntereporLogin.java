package it.net.sky.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
//1. preHandle - controller 이벤트 호출전
//2. postHandle - controller 호출 후 view 페이지 출력전
//3. afterCompletion - controller + view 페이지 모두 출력 후
//4. afterConcurrentHandlingStarted - 뭐 동시에 핸들링 해주는 메서드인대 정확히는 모르겠습니다.

import it.net.sky.util.session.SessionUtil;

public class IntereporLogin extends HandlerInterceptorAdapter {
	
	private static final String LOGIN = "login";
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{

		HttpSession session = request.getSession();
		
		try {
	            //admin이라는 세션key를 가진 정보가 널일경우 로그인페이지로 이동
	            if(SessionUtil.getAttribute("id") == null){
	                    response.sendRedirect("/sky"); 
	                    return false;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		 
	        //admin 세션key 존재시 main 페이지 이동
	        return true;	
	}
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	super.postHandle(request, response, handler, modelAndView);
    	
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object userVo = modelMap.get("userVo");
		
		if (userVo != null) {
			session.setAttribute(LOGIN, userVo);
			response.sendRedirect("/");
		}

    }
 
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
 
    @Override
    public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        super.afterConcurrentHandlingStarted(request, response, handler);
    }
}
