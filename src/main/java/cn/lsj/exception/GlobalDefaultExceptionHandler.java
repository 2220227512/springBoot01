package cn.lsj.exception;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.lsj.controller.UserController;


@ControllerAdvice
public class GlobalDefaultExceptionHandler {

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
			customException = new CustomException("未知错误");  
		}
			//错误 信息
		
			message = customException.getMessage();
			System.out.println("错误输出："+message);
			System.out.println("*********");
			Logger logger=Logger.getLogger(UserController.class);
			logger.debug(message);
			System.out.println("***********");
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
