package cn.lsj.exception;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@ControllerAdvice
public class GlobalDefaultExceptionHandler {

	 private static Logger LOGGER = LoggerFactory.getLogger(GlobalDefaultExceptionHandler.class);
	/*@ExceptionHandler(Exception.class)
	@ResponseBody
	public String defaultExceptionHandler(HttpServletRequest req,Exception exception){
		return "对不起！！";
	}*/

	@ExceptionHandler(Exception.class)
	@ResponseBody
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {

		String message=null;
		CustomException customException=null;
		if(ex instanceof CustomException){
			customException=(CustomException)ex;
		}else{
			
			
			LOGGER.error(ex.getMessage());
			LOGGER.error("以下为本次错误详细信息",ex);
			
		
			customException = new CustomException("未知错误");  
		}
			//错误 信息
		
			message = customException.getMessage();
			
			request.setAttribute("message", message);

			
			try {
				//转向到错误 页面
				request.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return new ModelAndView();
	}
}
