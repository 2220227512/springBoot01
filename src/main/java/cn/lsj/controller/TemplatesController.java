package cn.lsj.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/templates")
public class TemplatesController {
	
	@RequestMapping("/hello")
	public String hello(Map<String, Object> map){
		map.put("name", "lsj");
		return "ftl/hello";
	}

	
	@RequestMapping("/helloftl")
	public String helloftl(Map<String, Object> map){
		map.put("name", "lsj");
		return "index";
	}
	
	@RequestMapping("/hellojsp")
	public String hellojsp(Map<String, Object> map){
		map.put("name", "lsj jsp");
		return "hellojsp";
	}
}
