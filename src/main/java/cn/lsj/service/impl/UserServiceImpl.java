package cn.lsj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lsj.mapper.UserMapper;
import cn.lsj.model.User;
import cn.lsj.service.UserService;
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	public List<User> findAll() {
		System.out.println("************8");
		List<User> lists=userMapper.findAll();
		System.out.println("大小************"+lists.size());
		return lists;
	}
	public List<User> findListByname(String name) {
		return  userMapper.findUserByname(name);
		
	}
	public List<User> findLikename(String username) {
		// TODO Auto-generated method stub
		System.out.println(username);
		User user =new User();
		user.setUsername(username);
		return userMapper.findUserLikename3(user);
	}

}
