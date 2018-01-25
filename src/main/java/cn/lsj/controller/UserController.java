package cn.lsj.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import sun.util.logging.resources.logging;

import com.github.pagehelper.PageHelper;

import cn.lsj.model.User;
import cn.lsj.service.UserService;

@Controller
public class UserController {

	Logger logger=Logger.getLogger(UserController.class);
	@Autowired
	private UserService userService;
	
	@RequestMapping("/hello")
	public String hello(){
		return "hello springBoot !";
	}
	
	@RequestMapping("/showlist")
	public List<User> showlist(){
		List<User> Lists=new ArrayList<User>();
		User u1=new User();
		u1.setAddr("天津");
		//u1.setAge(20);
		u1.setUsername("lsj");
		
		User u2=new User();
		u2.setAddr("天津2");
		//u2.setAge(20);
		u2.setUsername("lsj2");
		
		Lists.add(u1);
		Lists.add(u2);
		return Lists;
		
	}
	
	
	@RequestMapping("/user")
	public User  showuser(){
		User u2=new User();
		u2.setAddr("天津2");
		//u2.setAge(20);
		u2.setUsername("lsj2");
		return u2;
	}
	/*@RequestMapping("findAll")
	public List<User> findAll(){
		List<User> lists=userService.findAll();
		return lists;
	}*/
	
	@RequestMapping("findAll")
	public List<User> findAll(int pageNum,int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		List<User> lists=userService.findAll();
		//List<User> lists=new ArrayList<User>();
		return lists;
	}
	
	@RequestMapping("/index")
	public String index(){
		//List<User> lists=userService.findAll();
		//List<User> lists=new ArrayList<User>();
		return "ftl/index";
	}
	
	
	@RequestMapping("/findbyname")
	public String findbynane(String name){
		 List<User> lists=userService.findListByname(name);
		 System.out.println(lists.get(0).getPassword()+"；长度："+lists.size());
		 
		 int i=1/0;
		return "hellojsp";
	}
	
	@RequestMapping("/findlikename")
	public String findlikenane(String username){
		 List<User> lists=userService.findLikename(username);
		 System.out.println("******");
		 System.out.println("长度："+lists.size());
		 if(lists.size()>0){
			 System.out.println(lists.get(0).getPassword()+"；长度："+lists.size());
		 }
		
		return "hellojsp";
	}
	
	@RequestMapping("/tologin")
	public String tologin(){
		return "login";
	}
	
	@RequestMapping("/toindex")
	public String toindex(){
		return "index";
	}
}
