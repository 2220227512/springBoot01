package cn.lsj.service;

import java.util.List;

import cn.lsj.model.User;


public interface UserService {

	public List<User> findAll();

	public List<User> findListByname(String name);

	public List<User> findLikename(String username);
}
